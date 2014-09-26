# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from acidentes import views

urlpatterns = patterns('', 
    url(r'^$', views.index, name='index'),
    url(r'^evolucao_brasil', views.evolucao_brasil, name='evolucao_brasil'),
    url(r'^compara_pais$', views.compara_pais, name='compara_pais'),
    url(r'^compara_estados$', views.compara_estados, name='compara_estados'),
    url(r'^voce_sabia$', views.voce_sabia, name='voce_sabia'),
    url(r'^equipe$', views.equipe, name='equipe')
)