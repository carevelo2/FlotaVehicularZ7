from .models import Persona
from django.contrib.auth.models import *

def es_administrador(user):
    try:
        # Intenta convertir el ID del grupo a un entero
        # Intenta obtener el objeto del grupo por su nombre o ID
        grupo_administrador = Group.objects.get(name='Administrador')

        # Verifica si el usuario pertenece al grupo con el ID dado
        return grupo_administrador in user.groups.all()
    except ValueError:
        # Maneja el caso en que el ID del grupo no es un entero válido
        return False

def es_encargado_logistica(user):
    try:
        grupo_encargado_logistica = Group.objects.get(name='Encargado Logistica')
        return grupo_encargado_logistica in user.groups.all()
    except Group.DoesNotExist:
        return False

def es_auxiliar(user):
    try:
        grupo_auxiliar = Group.objects.get(name='Auxiliar')
        return grupo_auxiliar in user.groups.all()
    except Group.DoesNotExist:
        return False

def es_gerente(user):
    try:
        grupo_gerente = Group.objects.get(name='Gerente')
        return grupo_gerente in user.groups.all()
    except Group.DoesNotExist:
        return False

def es_personal_policial(user):
    try:
        grupo_personal_policial = Group.objects.get(name='Personal Policial')
        return grupo_personal_policial in user.groups.all()
    except Group.DoesNotExist:
        return False   

def es_tecnico1(user):
    try:
        es_tecnico1 = Group.objects.get(name='Tecnico 1')
        return es_tecnico1 in user.groups.all()
    except Group.DoesNotExist:
        return False  
def es_tecnico2(user):
    try:
        es_tecnico2 = Group.objects.get(name='Tecnico 2')
        return es_tecnico2 in user.groups.all()
    except Group.DoesNotExist:
        return False 
def obtener_numero_usuarios():
    return User.objects.count()

