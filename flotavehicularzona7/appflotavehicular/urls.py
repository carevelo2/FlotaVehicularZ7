from . import views
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
# Aqui las url de tu app
urlpatterns = [
    # Pagina de inicio
    path('inicio/', views.index, name="index"),
    path('flotavehicularzona7/', views.index2, name="index2"),
    # Urls de Login
    path('', views.inicio_seccion, name="login"),
    path('registro/', views.registro, name="signup"),
    path('logout/', views.logoutpage, name="logout"),
     # Urls Grupos
    path('roles/', views.formulario_roles, name="formulario_roles"),
    path('roles/crear-roles', views.crearroles, name="crearroles"),
    path('roles/editar-roles/<str:id>',views.editarroles,name="editarroles"),
    path('eliminar-rol/<str:id>',views.eliminarroles,name="eliminarroles"),
    #Rangos
    path('rango/', views.formulariorango, name='formulariorango'),
    path('rango/crear-rango/', views.crearrango, name='crearrango'),
    path("rango/editar-rango/<str:id>", views.editarrango, name="editarrango"),
    path('eliminar-rango/<str:id>', views.eliminarrango, name="eliminarrango"),
    #Persona 
    path('persona/', views.formulario_persona, name="formulario_persona"),
    path('persona/crear-persona', views.crearpersona, name="crearpersona"),
    path('persona/editar-persona/<str:identificacion>', views.editarpersona, name="editarpersona"),
    path('persona/eliminar-persona/<str:identificacion>', views.eliminarpersona, name="eliminarpersona"),
    #Tipovehiculo
    path('vehiculo/tipovehiculo', views.formulario_tipovehiculo, name="formulario_tipovehiculo"),
    path('vehiculo/tipovehiculo/creartipovehiculo', views.creartipovehiculo, name="creartipovehiculo"),
    path('vehiculo/tipovehiculo/editaripovehiculo/<str:id>', views.editartipovehiculo, name="editartipovehiculo"),
    path('vehiculo/tipovehiculo/eliminartipovehiculo/<str:id>', views.eliminartipovehiculo, name="eliminartipovehiculo"),
    #Vehiculo
    path('vehiculo/', views.formulario_vehiculo, name="formulario_vehiculo"),
    path('vehiculo/crearvehiculo', views.crearvehiculo, name="crearvehiculo"),
    path('vehiculo/editaripovehiculo/<str:placa>', views.editarvehiculo, name="editarvehiculo"),
    path('vehiculo/eliminarvehiculo/<str:placa>', views.eliminarvehiculo, name="eliminarvehiculo"),
    #Tipo de mantenimiento
    path("mantenimiento/listartipos", views.formulariotipomantenimiento, name='formulariotipomantenimiento'),
    path('mantenimiento/creartipomantenimiento', views.creartipomantenimiento, name="creartipomantenimiento"),
    path('mantenimiento/editartipomantenimiento/<str:id>', views.editartipomantenimiento, name="editartipomantenimiento"),
    path('mantenimiento/eliminartipomantenimiento/<str:id>', views.eliminartipomantenimiento, name="eliminartipomantenimiento"),
    #Mantenimiento
    path("mantenimiento/", views.formulariomantenimiento, name='formulariomantenimiento'),
    path("mantenimiento/entradamantenimiento/<str:id>", views.entradamantenimiento, name='entradamantenimiento'),
    path("mantenimiento/salidamantenimiento/<str:id>", views.salidamantenimiento, name='salidamantenimiento'),
    path("mantenimiento/crearmantenimiento", views.crearmantenimiento, name='crearmantenimiento'),
    path('mantenimiento/editarmantenimiento/<str:id>', views.editarmantenimiento, name="editarmantenimiento"),
    path('mantenimiento/eliminarmantenimiento/<str:id>', views.eliminarmantenimiento, name="eliminarmantenimiento"),
    path("mantenimiento/listarsalidas", views.listarsalidas, name='listarsalidas'),
    path("mantenimiento/listarentradas", views.listarentradas, name='listarentradas'),
    #circuito
    path("circuito/", views.formulariocircuito, name='formulariocircuito'),
    path("circuito/crearcircuito", views.crearcircuito, name='crearcircuito'),
    path('circuito/editarcircuito/<str:cod_circuito>', views.editarcircuito, name="editarcircuito"),
    path('circuito/eliminarcircuito/<str:cod_circuito>', views.eliminarcircuito, name="eliminarcircuito"),
    #Subcircuito
    path("subcircuito/", views.formulariosubcircuito, name='formulariosubcircuito'),
    path("subcircuito/crearsubcircuito", views.crearsubcircuito, name='crearsubcircuito'),
    path('subcircuito/editarsubcircuito/<str:cod_subcircuito>', views.editarsubcircuito, name="editarsubcircuito"),
    path('subcircuito/eliminarsubcircuito/<str:cod_subcircuito>', views.eliminarsubcircuito, name="eliminarsubcircuito"),
    #Distrito 
    path("distrito/", views.formulariodistrito, name='formulariodistrito'),
    path("distrito/creardistrito", views.creardistrito, name='creardistrito'),
    path('distrito/editardistrito/<str:cod_distrito>', views.editardistrito, name="editardistrito"),
    path('distrito/eliminardistrito/<str:cod_distrito>', views.eliminardistrito, name="eliminardistrito"),
    #dependencia
    path("dependencia/", views.formulariodependencia, name='formulariodependencia'),
    path("dependencia/creardependencia", views.creardependencia, name='creardependencia'),
    path('dependencia/editardependencia/<str:id>/', views.editardependencia, name="editardependencia"),
    path('dependencia/eliminardependencia/<str:id>/', views.eliminardependencia, name="eliminardependencia"),
    #orden de trabajo
    path("ordentrabajo/", views.formularioordendetrabajo, name='formularioordendetrabajo'),
    path("ordentrabajo/crearordentrabajo", views.crearordentrabajo, name='crearordentrabajo'),
    path('ordentrabajo/editarordentrabajo/<str:id>/', views.editarordentrabajo, name="editarordentrabajo"),
    path('ordentrabajo/eliminarordentrabajo/<str:id>/', views.eliminarordentrabajo, name="eliminarordentrabajo"),
    path("ordentrabajo/ordendesalida/<str:id>", views.ordendesalida, name='ordendesalida'),
    path("ordentrabajo/ordendeentrada/<str:id>", views.ordendeentrada, name='ordendeentrada'),
    path("ordentrabajo/salida-orden", views.salidaorden, name='salidaorden'),
    path("ordentrabajo/entrada-orden", views.entradaorden, name='entradaorden'),
    #dependencia
    path("dependencia/", views.formulariodependencia, name='formulariodependencia'),
    path("dependencia/creardependencia", views.creardependencia, name='creardependencia'),
    path('dependencia/editardependencia/<str:id>/', views.editardependencia, name="editardependencia"),
    path('dependencia/eliminardependencia/<str:id>/', views.eliminardependencia, name="eliminardependencia"),
    #Denuncias
    path("denuncia/", views.formulariodenuncia, name='formulariodenuncia'),
    path("denuncia/creardenuncia", views.creardenuncia, name='creardenuncia'),
    #combustibles
    path("combustibles/",views.formulariocombustible,name='formulariocombustible'),
    path("combustibles/crearcombustible",views.crearcombustible,name='crearcombustible'),
    path("combustibles/editarcombustible/<str:id>/",views.editarcombustible,name='editarcombustible'),
    path('combustibles/eliminarcombustible/<str:id>/',views.eliminarcombustible,name="eliminarcombustible"),
    path('combustibles/generarorden/<str:id>/',views.ordencombustible,name="ordencombustible"),
]    
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
