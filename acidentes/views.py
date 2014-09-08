# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from chartit import DataPool, Chart
from acidentes.models import SeriesPais


def index(request):
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
    # Renderiza o HTML para a saída
    return render_to_response('acidentes/index.html', {'charts': acidPais})

def voce_sabia(request):
	return render_to_response('acidentes/voce_sabia.html')

def equipe(request):
	return render_to_response('acidentes/equipe.html')