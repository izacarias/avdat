from django.db import models

# Create your models here.
class Pais (models.Model):
	nome = models.CharField(max_length=50)

class Regiao(models.Model):
	nome = models.CharField(max_length=50)

class UniaoFederacao(models.Model):
	sigla = models.CharField(max_length=2)
	nome = models.CharField(max_length=50)

class Sexo(models.Model):
	sigla = models.CharField(max_length=1)
	descricao = models.CharField(max_length=10)
		