# -*- coding: utf-8 -*-
import json
import simplejson
from django.core.context_processors import csrf
from django.core import serializers
from django.core.serializers.json import DjangoJSONEncoder
from django.http import HttpResponse
from django.shortcuts import render, render_to_response, RequestContext
from django.utils.encoding import force_text
from django.views.decorators.csrf import csrf_protect
from chartit import DataPool, Chart
from acidentes.models import Regiao, UniaoFederacao
from acidentes.models import SeriesPais, SeriesRegioes, SeriesUniaoFederacao

# páginas estáticas
def voce_sabia(request):
    return render_to_response('acidentes/voce_sabia.html')

def equipe(request):
    return render_to_response('acidentes/equipe.html')

# páginas dinâmicas
def index(request):
    # necessário para CSRF token
    c = {}
    c.update(csrf(request))
    # busca todos os anos com dados
    anos = SeriesUniaoFederacao.objects.values('ano').distinct().order_by('-ano')
    # pega o ano solicitado ou o mais atual
    if request.method == 'POST':
        ano_solicitado = request.POST.get('ano')
    else:
        ano_solicitado = anos[0].get('ano')
    # busca dos dados do ano
    dict_indicies = (SeriesUniaoFederacao.objects.values('uf__latitude', 'uf__longitude' , 'acidentes').filter(ano=ano_solicitado))
    indices_json = simplejson.dumps(list(dict_indicies))
    return render_to_response('acidentes/index.html', RequestContext(request, 
        {'anos':anos, 'ano_solicitado':ano_solicitado, 'indices_json': indices_json}))

def compara_estados(request):
    # necessário para CSRF token
    c = {}
    c.update(csrf(request))
    ufs_selecionadas = False
    compara_uf_chart = False
    uf_1 = ''
    uf_2 = ''
    # lista todas as UFs com dados
    ufs  = UniaoFederacao.objects.values('sigla').order_by('sigla')
    # se vier por POST renderiza o gráfico
    if request.method == 'POST':
        # recupera os dados informados pelo usuário
        uf_1 = request.POST.get('uf1')
        uf_2 = request.POST.get('uf2')
        ufs_selecionadas = True
        # busca dados das UFs
        uf1_indices = SeriesUniaoFederacao.objects.values().filter(uf__sigla=uf_1)
        uf2_indices = SeriesUniaoFederacao.objects.values().filter(uf__sigla=uf_2)
        # Cria o DataPool para comparação
        comparacao_data = DataPool(
            series=[{
                'options': {'source': uf1_indices},
                'terms':[{'ano1':'ano'}, {uf_1: 'acidentes'}]
            }, {
                'options': {'source': uf2_indices},
                'terms':[{'ano2': 'ano'}, {uf_2: 'acidentes'}]
            }]
        )
        # cria o objeto gráfico
        compara_uf_chart = Chart(datasource = comparacao_data,
            series_options = [{
                'options':{
                  'type': 'line',
                  'stacking': False
                },
                'terms': {
                  'ano1': [uf_1],
                  'ano2': [uf_2]
                }
            }],
            chart_options = {
                'title': {
                   'text': 'Comparativo do índice de acidentes'
                },
                'legend': {
                    'enabled': True
                },
                'xAxis': {
                    'title': {'text': 'Ano'}
                },
                'yAxis': {
                    'title': {'text': 'Acidentes (por 1000 segurados)'}
                }
        })
    # renderiza a view
    return render_to_response('acidentes/compara_estados.html', RequestContext(request, 
        {'ufs':ufs, 'uf_1':uf_1, 'uf_2':uf_2, 'ufs_selecionadas':ufs_selecionadas, 
         'charts':[compara_uf_chart]}))

def compara_pais(request):
    # necessário para CSRF token
    c = {}
    c.update(csrf(request))
    uf_selecionada = False
    compara_uf_chart = False
    uf = ''
    # lista todas as UFs com dados
    ufs  = UniaoFederacao.objects.values('sigla').order_by('sigla')
    # se vier por POST renderiza o gráfico
    if request.method == 'POST':
        # recupera os dados informados pelo usuário
        uf = request.POST.get('uf')
        uf_selecionada = True
        # busca dados das UFs
        uf_indices = SeriesUniaoFederacao.objects.filter(uf__sigla=uf)
        brasil_indices = SeriesPais.objects.all()
        # Cria o DataPool para comparação
        comparacao_data = DataPool(
            series=[{
                'options': {'source': uf_indices},
                'terms':[{'ano_uf':'ano'}, {uf: 'acidentes'}]
            }, {
                'options': {'source': brasil_indices},
                'terms':[{'ano_brasil': 'ano'}, {'Brasil': 'acidentes'}]
            }]
        )
        # cria o objeto gráfico
        compara_uf_chart = Chart(datasource = comparacao_data,
            series_options = [{
                'options':{
                  'type': 'line',
                  'stacking': False
                },
                'terms': {
                  'ano_uf': [uf],
                  'ano_brasil': ['Brasil']
                }
            }],
            chart_options = {
                'title': {
                   'text': 'Comparativo com o índice de acidentes nacional'
                },
                'legend': {
                    'enabled': True
                },
                'xAxis': {
                    'title': {'text': 'Ano'}
                },
                'yAxis': {
                    'title': {'text': 'Acidentes (por 1000 segurados)'}
                }
        })
    # renderiza a view
    return render_to_response('acidentes/compara_pais.html', RequestContext(request, 
        {'ufs':ufs, 'uf_plotada':uf, 'ufs_selecionadas':uf_selecionada, 'charts':[compara_uf_chart]}))

def regiao_pais(request):
    # necessário para CSRF token
    c = {}
    c.update(csrf(request))
    regiao_selecionada = False
    compara_regiao_chart = False
    codigo_regiao = 0
    nome_regiao = ''
    # lista todas as regiões
    regioes  = Regiao.objects.values('id', 'nome').order_by('nome')
    # se vier por POST renderiza o gráfico
    if request.method == 'POST':
        # recupera os dados informados pelo usuário
        codigo_regiao = request.POST.get('regiao')
        regiao_selecionada = True
        # nome da regiao para template
        nome_regiao = Regiao.objects.get(id=codigo_regiao).nome
        # busca dados das UFs
        regiao_indices = SeriesRegioes.objects.filter(regiao__id=codigo_regiao)
        brasil_indices = SeriesPais.objects.all()
        # Cria o DataPool para comparação
        comparacao_data = DataPool(
            series=[{
                'options': {'source': regiao_indices},
                'terms':[{'ano_regiao':'ano'}, {nome_regiao: 'acidentes'}]
            }, {
                'options': {'source': brasil_indices},
                'terms':[{'ano_brasil': 'ano'}, {'Brasil': 'acidentes'}]
            }]
        )
        # cria o objeto gráfico
        compara_regiao_chart = Chart(datasource = comparacao_data,
            series_options = [{
                'options':{
                  'type': 'line',
                  'stacking': False
                },
                'terms': {
                  'ano_regiao': [nome_regiao],
                  'ano_brasil': ['Brasil']
                }
            }],
            chart_options = {
                'title': {
                   'text': 'Comparativo com o índice de acidentes nacional'
                },
                'legend': {
                    'enabled': True
                },
                'xAxis': {
                    'title': {'text': 'Ano'}
                },
                'yAxis': {
                    'title': {'text': 'Acidentes (por 1000 segurados)'}
                }
        })
    # renderiza a view
    return render_to_response('acidentes/regiao_pais.html', RequestContext(request, 
        {'regioes':regioes, 'regiao_selecionada':regiao_selecionada, 'codigo_regiao':codigo_regiao, 
        'charts':[compara_regiao_chart]}))

def evolucao_regioes(request):
    c = {}
    c.update(csrf(request))
    anos = SeriesRegioes.objects.values('ano').distinct().order_by('-ano')
    ano_selecionado = 0
    cht = False
    if request.method == 'POST':
        ano_selecionado = request.POST.get('ano')
        indices = SeriesRegioes.objects.filter(ano=ano_selecionado)
        ds = DataPool(
            series=
                [{'options': {
                    'source': indices},
                  'terms': [
                    'regiao__nome',
                    'acidentes'
                  ]}
                ])
        cht = Chart(
                datasource = ds,
                series_options =
                    [{'options': {
                        'type': 'pie',
                        'stacking': False},
                      'terms': {
                        'regiao__nome': [
                            'acidentes']
                      }}],
                chart_options = 
                    {'chart': {
                        'options3d': {
                            'enabled': True,
                            'alpha': 45
                        }
                     }, 
                     'plotOptions': {
                        'pie': {
                            'innerSize': 100,
                            'depth': 45
                        }
                     },
                     'title': {
                        'text': 'Grafico das regiões (Ano: ' + str(ano_selecionado) + ')'
                     }
                    }
            )
    # renderiza a view
    return render_to_response('acidentes/evolucao_regioes.html', RequestContext(request, 
        {'anos':anos, 'ano_selecionado':ano_selecionado, 'chart':[cht]}))

def evolucao_brasil(request):
    c = {}
    c.update(csrf(request))
    brasil_indices = SeriesPais.objects.all()
    # Cria o DataPool com séries de evolução do país
    series_pais = DataPool(
        series=[{
            'options': {'source': brasil_indices},
            'terms':['ano', 'acidentes', 'pib']
        }]
    )
    # cria o objeto gráfico
    series_pais_chart = Chart(datasource = series_pais,
        series_options = [
        {
            'options':{
              'type': 'column',
              'xAxis': 0,
              'yAxis': 0,
              'zIndex': 0,
            },
            'terms': {
              'ano': ['acidentes']
            }
        }, {
            'options':{
                'type': 'line',
                'xAxis': 1,
                'yAxis': 1,
                'zIndex': 1,
            },
            'terms': {
                'ano': ['pib']
            }
        }],
        chart_options = {
            'title': {
               'text': 'Evolução dos índices nacionais'
            },
            'legend': {
                'enabled': True,
            },
            'xAxis': {
                'title': {'text': 'Ano'}
            },
    })
    # renderiza a view
    return render_to_response('acidentes/evolucao_brasil.html', RequestContext(request, 
        {'chart':[series_pais_chart]}))