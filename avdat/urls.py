from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'avdat.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^acidentes/', include('acidentes.urls')),
    url(r'^admin/', include(admin.site.urls)),
<<<<<<< HEAD
) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
=======
) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
>>>>>>> 970d357bdf9c5f0dd651772fb655e57eca5c9c70
