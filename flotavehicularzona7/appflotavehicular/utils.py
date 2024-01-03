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
    
def obtener_numero_usuarios():
    return User.objects.count()

