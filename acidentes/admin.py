from django.contrib import admin
from acidentes.models import Pais, Regiao, UniaoFederacao, Sexo
from acidentes.models import SeriesPais, SeriesRegioes, SeriesUniaoFederacao, SeriesSexo

class SeriesUniaoFederacaoAdmin(admin.ModelAdmin):
    list_display = ('ano', 'uf', 'acidentes')
    

# Register your models here.
admin.site.register(Pais)
admin.site.register(Regiao)
admin.site.register(UniaoFederacao)
admin.site.register(Sexo)
admin.site.register(SeriesPais)
admin.site.register(SeriesRegioes)
admin.site.register(SeriesUniaoFederacao, SeriesUniaoFederacaoAdmin)
admin.site.register(SeriesSexo)