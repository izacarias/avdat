#-*- coding: UTF-8 -*-

from django.db import models

# Create your models here.
class Pais(models.Model):
	nome = models.CharField(max_length=50)
	
	def __unicode__(self):
		return self.nome

	class Meta:
		verbose_name = 'País'
		verbose_name_plural = 'Países'
			

class Regiao(models.Model):
	nome = models.CharField(max_length=50)
	
	def __unicode__(self):
		return self.nome

	class Meta:
		verbose_name = 'Região'
		verbose_name_plural = 'Regiões'

class UniaoFederacao(models.Model):
	sigla = models.CharField(max_length=2)
	nome = models.CharField(max_length=50)

	def __unicode__(self):
		return self.sigla

	class Meta:
		verbose_name = 'Estado'
		verbose_name_plural = 'Estados'

class Sexo(models.Model):
	sigla = models.CharField(max_length=1)
	descricao = models.CharField(max_length=10)

	def __unicode__(self):
		return self.descricao

	class Meta:
		verbose_name = 'Sexo'
		verbose_name_plural = 'Sexo'

class SeriesPais(models.Model):
	pais = models.ForeignKey(Pais)
	ano = models.IntegerField(default=0)
	acidentes = models.DecimalField(max_digits=5, decimal_places=2)

	class Meta:
		verbose_name = 'Série de dados por país'
		verbose_name_plural = 'Série de dados por países'

class SeriesRegioes(models.Model):
	regiao = models.ForeignKey(Regiao)
	ano = models.IntegerField(default=0)
	acidentes = models.DecimalField(max_digits=5, decimal_places=2)

	class Meta:
		verbose_name = 'Série de dados por região'
		verbose_name_plural = 'Série de dados por regiões'

class SeriesUniaoFederacao(models.Model):
	uf = models.ForeignKey(UniaoFederacao)
	ano = models.IntegerField(default=0)
	acidentes = models.DecimalField(max_digits=5, decimal_places=2)

	def __unicode__(self):
		return "%s | %s" % (self.ano, self.uf.sigla)

	class Meta:
		verbose_name = 'Série de dados por estado'
		verbose_name_plural = 'Série de dados por estados'

class SeriesSexo(models.Model):
	sexo = models.ForeignKey(Sexo)
	ano = models.IntegerField(default=0)
	acidentes = models.DecimalField(max_digits=5, decimal_places=2)

	class Meta:
		verbose_name = 'Série de dados por sexo'
		verbose_name_plural = 'Série de dados por sexo'