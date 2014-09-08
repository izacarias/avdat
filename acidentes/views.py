# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from chartit import DataPool, Chart
from acidentes.models import SeriesPais


def index(request):
	#Step 1: Create a DataPool with the data of graph
    weatherdata = DataPool(
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
    #Step 2: Create the Chart object
    acidPais = Chart(
	    datasource = weatherdata,
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
	       	'xAxis': {
	            'title': {'text': 'Ano'}
	        },
	        'yAxis': {
	        	'title': {'text': 'Acidentes (por 1000 segurados)'}
	        }
	    }
	)
    #Step 3: Send the chart object to the template.
    return render_to_response('acidentes/index.html', {'weatherchart': acidPais})