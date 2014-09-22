# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url
from acidentes import views

urlpatterns = patterns('', 
    url(r'^$', views.index, name='index'),
    url(r'^compara_estados$', views.compara_estados, name='compara_estados'),
    url(r'^voce_sabia$', views.voce_sabia, name='voce_sabia'),
    url(r'^equipe$', views.equipe, name='equipe')
)