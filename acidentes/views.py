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
from acidentes.models import SeriesPais, SeriesUniaoFederacao, UniaoFederacao

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
                   'text': 'Comparação com o índice de acidentes no Brasil'
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