# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response, RequestContext
from django.http import HttpResponse
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_protect
from chartit import DataPool, Chart
from acidentes.models import SeriesPais, SeriesUniaoFederacao, UniaoFederacao


def index(request):
    c = {}
    c.update(csrf(request))
    if request.method == "POST" and request.POST.get('uf') != "selecione" : 
        uf = request.POST.get('uf')
    else:
        uf = 'RS'

    if request.POST.get('uf') == 'selecione':
        erro = True
    else:
        erro = False

    # manda os estados
    estados = UniaoFederacao.objects.all().order_by('sigla')

    nome_field = 'Acidentes ' + uf
    # Step 1: Cria o DataPool para a série Acidentes / Ano
    acidentes_ano_data = DataPool(
        series= [{
            'options': {
                'source': SeriesPais.objects.all()
            },
            'terms': [
                'ano',
                'acidentes'
            ]
        }]
    )
    
    #Step 2: Cria o gráfico de barras para série Acidentes / Ano
    acidPais = Chart(
        datasource = acidentes_ano_data,
        series_options = [{
            'options':{
              'type': 'column',
              'stacking': False
            },
            'terms': {
              'ano': ['acidentes']
            }
        }],
        chart_options = {
            'title': {
               'text': 'Acidentes de Trabalho no Brasil'
            },
            'legend': {
                'enabled': False
            },
            'xAxis': {
                'title': {'text': 'Ano'}
            },
            'yAxis': {
                'title': {'text': 'Acidentes (por 1000 segurados)'}
            }
        }
    )

    # Cria o grafico de comparacao entre pais e estado
    comparacao_data = DataPool(
        series=[{
            'options': {
                'source': SeriesPais.objects.all()
            },
            'terms': [
                'ano',
                'acidentes'
            ]
        }, {
            'options': {
                'source': SeriesUniaoFederacao.objects.filter(uf__sigla=uf)
            },
            'terms': [
                {'ano_uf': 'ano'},
                {nome_field: 'acidentes'}
            ]
        }
        ]
    )

    comparacaoChart = Chart(
        datasource = comparacao_data,
        series_options = [{
            'options':{
              'type': 'line',
              'stacking': False
            },
            'terms': {
              'ano': ['acidentes'],
              'ano_uf': [nome_field]
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
        }
    )
    # Renderiza o HTML para a saída
    # return render_to_response('acidentes/index.html', {'charts': [acidPais, comparacaoChart]})
    return render_to_response('acidentes/index.html', RequestContext(request, {'charts': [acidPais, comparacaoChart], 
        'erro': erro, 'estados': estados}))

def voce_sabia(request):
    return render_to_response('acidentes/voce_sabia.html')

def equipe(request):
    return render_to_response('acidentes/equipe.html')