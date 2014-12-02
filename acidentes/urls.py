# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from acidentes import views

urlpatterns = patterns('', 
    url(r'^$', views.index, name='index'),
    url(r'^video', views.video, name="video"),
    url(r'^heatmap_regioes', views.heatmap_regioes, name='heatmap_regioes'),
    url(r'^evolucao_brasil', views.evolucao_brasil, name='evolucao_brasil'),
    url(r'^evolucao_regioes', views.evolucao_regioes, name='evolucao_regioes'),
    url(r'^regiao_pais', views.regiao_pais, name='regiao_pais'),
    url(r'^compara_pais$', views.compara_pais, name='compara_pais'),
    url(r'^compara_estados$', views.compara_estados, name='compara_estados'),
    url(r'^voce_sabia$', views.voce_sabia, name='voce_sabia'),
    url(r'^equipe$', views.equipe, name='equipe')
)