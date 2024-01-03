from django.shortcuts import get_object_or_404, redirect, render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from .models import *
from django.contrib.auth.models import *
from django.db.models import Count
from django.contrib.auth.decorators import login_required
from .utils import *
from django.contrib.auth.decorators import user_passes_test
# Para las imagenes
import os
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.hashers import make_password
# Aqui las importaciones pdf
from fpdf import FPDF
from PIL import Image
from django.core.files.base import ContentFile
from django.core.files.storage import default_storage
# Create your views here.
@login_required(login_url='login')

def index(request):
    numero_usuarios = obtener_numero_usuarios()
    es_admin = es_administrador(request.user)
    return render(request, "formplantilla/index.html",{'es_admin':es_admin,
                                                       'numero_usuarios':numero_usuarios})
#Pantalla Inicio
def index2(request):
    return render(request, "formplantilla/pantalladeinicio.html")
#Logueo
def inicio_seccion(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        # Realiza la autenticación del usuario
        user = authenticate(request, username=username, password=password)
        if user is not None:
            # El usuario está autenticado, inicia sesión
            login(request, user)
            # Reemplaza 'index' con la URL de tu página principal
            return redirect('index')
        else:
            # Authentication failed, show a SweetAlert2 error message
            error_message = "Usuario y contraseña incorrectos."
            return render(request, "formusuarios/login.html", {"error_message": error_message})
    if request.user.is_authenticated:
        return redirect('index')
    return render(request, "formusuarios/login.html")

def registro(request):
    if request.method == 'POST':
        nameuser2 = request.POST.get('username2')
        email2 = request.POST.get('email2')
        pass1 = request.POST.get('password12')
        pass2 = request.POST.get('password21')
        if pass1 != pass2:
            # Passwords don't match, show a SweetAlert2 error message
            error_message = "Las contraseñas son diferentes."
            return render(request, "formusuarios/login.html", {"error_message": error_message})
        else:
            try:
                my_user = User.objects.create_user(nameuser2, email2, pass1,is_active=False)
                my_user.save()
                return redirect('login')  # Cambiado de 'login' a la URL correcta
            except Exception as e:
                # Handle any other exception that may occur during user creation
                error_message = "Error al registrar el usuario."
                return render(request, "formusuarios/login.html", {"error_message": error_message})
    return render(request, "formusuarios/login.html")

def logoutpage(request):
    logout(request)
    return redirect('login')
#roles
@login_required(login_url='login')
def formulario_roles(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    grupos = Group.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formusuarios/formroles/formulario_roles.html', {'grupos': grupos,
                                                                  'es_admin':es_admin          
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })
@login_required(login_url='login')
def crearroles(request):
    es_admin = es_administrador(request.user)
    #imagen_empleado = obtener_imagen_empleado(request.user)
    if request.method == 'POST':
        name = request.POST.get('name')
        try:
            # Crea un nuevo objeto grupos si estás utilizando un modelo personalizado
            my_groups = Group.objects.create(name=name)
            my_groups.save()
            return redirect('formulario_roles')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al registrar el Rol."
            return render(request, "formusuarios/formroles/crearroles.html", {"error_message": error_message,
                                                                        'es_admin':es_admin      
                                                                   #'imagen_empleado': imagen_empleado
                                                                   })
    return render(request, "formusuarios/formroles/crearroles.html", {'es_admin':es_admin
        #'imagen_empleado': imagen_empleadoç
        })       
@login_required(login_url='login')
def editarroles(request, id):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    try:
        es_admin = es_administrador(request.user)
        my_groups = Group.objects.get(id=id)
    except Group.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulario_roles')
    if request.method == 'POST':
        name = request.POST.get('name')
        try:
            # Actualiza los campos de la instancia existente
            my_groups.name = name
            my_groups.save()
            # Redirige a la página de listado de roles
            return redirect('formulario_roles')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formusuarios/formroles/editarroles.html", {'my_groups': my_groups, 'es_admin':es_admin,
            "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })

    return render(request, "formusuarios/formroles/editarroles.html", {'my_groups': my_groups,
                                                            'es_admin':es_admin#'imagen_empleado': imagen_empleado
                                                            })
@login_required(login_url='login')
def eliminarroles(request, id):
    rolid = Group.objects.get(id=id)
    rolid.delete()
    return redirect('formulario_roles')

#Rangos
@login_required(login_url="login")
def formulariorango(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    rangos = Rango.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formrango/formulariorango.html', {'rangos': rangos,
                                                              'es_admin':es_admin
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })

@login_required(login_url='login')
def crearrango(request):
    if request.method == 'POST':
        rangopersona = request.POST.get('rangopersona')
        descripcion = request.POST.get('descripcion')
        try:
            my_rango = Rango.objects.create(
                rangopersona=rangopersona,
                detalle=descripcion
            )
            my_rango.save()
            return redirect('formulariorango')
        except Exception as e:
            error_message = "Error al crear la persona."
            return render(request, "formrango/crearrango.html", {'error_message': error_message})

    return render(request,'formrango/crearrango.html' )

@login_required(login_url='login')
def editarrango(request,id):
    try:
        my_rango = Rango.objects.get(id=id)
    except Rango.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulariorango')
    if request.method == 'POST':
        rangopersona = request.POST.get('rangopersona')
        descripcion = request.POST.get('descripcion')
        try:
            # Actualiza los campos de la instancia existente
            my_rango.rangopersona = rangopersona
            my_rango.detalle = descripcion
            my_rango.save()
            # Redirige a la página de listado de roles
            return redirect('formulariorango')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formrango/editarrango.html", {'my_rango': my_rango, 
            "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })
    return render(request,'formrango/editarrango.html',{'my_rango':my_rango,
                                                                      } )
@login_required(login_url='login')
def eliminarrango(request, id):
    rangoid = Rango.objects.get(id=id)
    rangoid.delete()
    return redirect('formulariorango')

###################Persona
@login_required(login_url='login')
@user_passes_test(es_administrador)
def formulario_persona(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    personas = Persona.objects.all()
    #usuarios_desactivados = User.objects.filter(is_active=False)
    #codigos_empleado = Persona.objects.values_list('codigoempleado', flat=True)
    #usuarios = User.objects.filter(campo_codigo_empleado__in=codigos_empleado)
    #personas = Persona.objects.filter(codigoempleado__in=codigos_empleado)
    #rangos=Rango.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formpersona/formulario_persona.html', {'personas': personas,
                                                                   'es_admin':es_admin
                                                                   
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })
@login_required(login_url='login')
def crearpersona(request):
    personas = Persona.objects.all()
    usuarios = User.objects.filter(is_active=False)
    #usuarios = User.objects.all()
    rangos=Rango.objects.all()
    groups = Group.objects.all()
    if request.method == 'POST':
        identificacion = request.POST.get('identificacion')
        nombres = request.POST.get('nombres')
        apellidos = request.POST.get('apellidos')
        codigoempleado = request.POST.get('usuario')
        direccion = request.POST.get('direccion')
        fecha_nacimiento = request.POST.get('fecha_nacimiento')
        tipo_sangre = request.POST.get('tiposangre')
        ciudad_nacimiento = request.POST.get('ciudad_nacimiento')
        numero_celular = request.POST.get('numero_celular')
        id_rango = request.POST.get('rango')
        dependencia = request.POST.get('dependencia')
        firma=request.FILES.get('firma')
        contrasenia_firma= request.POST.get('contrasena_firma')
        # Hashea la contraseña antes de guardarla en la base de datos
        hashed_password = make_password(contrasenia_firma)
        my_user = User.objects.get(id=codigoempleado)
        rangoid = Rango.objects.get(id=id_rango)
        if firma:
            # Define el nuevo nombre de archivo como la cédula con la extensión de la foto
            extension = os.path.splitext(firma.name)[1]
            nuevo_nombre_archivo = f"{identificacion}{extension}"

            # Configura el sistema de almacenamiento de medios
            fs = FileSystemStorage(location=os.path.join(
                settings.MEDIA_ROOT, 'firmasempleados'))

            # Guarda la foto en la carpeta 'imgempleados'
            filename = fs.save(nuevo_nombre_archivo, firma)

            # Obtén la URL de la foto para almacenar en la base de datos
            foto_url = os.path.join('firmasempleados', nuevo_nombre_archivo)
        else:
            foto_url = None
        persona = Persona.objects.create(
                identificacion=identificacion,
                nombres=nombres,
                apellidos=apellidos,
                codigoempleado = my_user,
                direccion=direccion,
                fecha_nacimiento=fecha_nacimiento,
                tipo_sangre=tipo_sangre,
                ciudad_nacimiento=ciudad_nacimiento,
                numero_celular=numero_celular,
                id_rango = rangoid,
                dependencia=dependencia,
                firma=foto_url,
                contrasenia_firma=hashed_password
            )
        persona.save()
        group_id = request.POST.get('rol')
        
        try:
                my_user.is_active = True

                # Guarda los cambios en el usuario
                my_user.save()
                group = Group.objects.get(id=group_id)
                my_user.groups.set([group])  # Asigna al usuario al grupo
        except Group.DoesNotExist:
                pass  # Manejar el caso si el grupo no existe
        return redirect('formulario_persona')
        
        

    return render(request, "formpersona/crearpersona.html",{'personas': personas,
                                                                    'usuarios':usuarios,
                                                                    'rangos':rangos,
                                                                    'groups':groups
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })
@login_required(login_url='login')
def editarpersona(request, identificacion):
    try:
        personas = Persona.objects.all()
        usuarios = User.objects.filter(is_active=False)
        #usuarios = User.objects.all()
        rangos=Rango.objects.all()
        groups = Group.objects.all()
        my_persona = Persona.objects.get(identificacion=identificacion)
    except Persona.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulario_persona')
    if request.method == 'POST':
        identificacion = request.POST.get('identificacion')
        nombres = request.POST.get('nombres')
        apellidos = request.POST.get('apellidos')
        codigoempleado = request.POST.get('usuario')
        direccion = request.POST.get('direccion')
        fecha_nacimiento = request.POST.get('fecha_nacimiento')
        tipo_sangre = request.POST.get('tiposangre')
        ciudad_nacimiento = request.POST.get('ciudad_nacimiento')
        numero_celular = request.POST.get('numero_celular')
        id_rango = request.POST.get('rango')
        dependencia = request.POST.get('dependencia')
        my_user = User.objects.get(id=codigoempleado)
        rangoid = Rango.objects.get(id=id_rango)
        try:
            # Actualiza los campos de la instancia existente
            my_persona.identificacion=identificacion
            my_persona.nombres=nombres
            my_persona.apellidos=apellidos
            my_persona.codigoempleado=my_user
            my_persona.direccion=direccion
            my_persona.fecha_nacimiento=fecha_nacimiento
            my_persona.tipo_sangre=tipo_sangre
            my_persona.ciudad_nacimiento=ciudad_nacimiento
            my_persona.numero_celular=numero_celular
            my_persona.id_rango=rangoid
            my_persona.dependencia=dependencia
            my_persona.save()
            # Redirige a la página de listado de roles
            return redirect('formulario_persona')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formpersona/editarpersona.html", {'personas': personas,
                                                                    'usuarios':usuarios,
                                                                    'rangos':rangos,
                                                                    'groups':groups, 
            "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })
    return render(request, "formpersona/editarpersona.html", {'personas': personas,
                                                                    'usuarios':usuarios,
                                                                    'rangos':rangos,
                                                                    'groups':groups,
                                                                    'my_persona':my_persona })
@login_required(login_url='login')
def eliminarpersona(request, identificacion):
    persona = get_object_or_404(Persona, identificacion=identificacion)
     # Guarda la ruta de la imagen antes de eliminar el objeto
    imagen_path = persona.firma.path
    # Elimina la imagen del sistema de archivos
    import os
    if os.path.exists(imagen_path):
        os.remove(imagen_path)
    persona.delete()
    return redirect('formulario_persona')
    
############### Vehiculo    
@login_required(login_url='login')
def formulario_tipovehiculo(request):
    tipovehiculos=Tipovehiculo.objects.all()
    return render(request,"formtipovehiculo/formulario_tipovehiculo.html",{'tipovehiculos':tipovehiculos
                                                                  })
@login_required(login_url='login')
def creartipovehiculo(request):
    if request.method == 'POST':
        tipovehiculo = request.POST.get('tipovehiculo')
        descripcion = request.POST.get('descripcion')
        try:
            my_tipovehiculo = Tipovehiculo.objects.create(
                tipovehiculo=tipovehiculo,
                descripcion=descripcion
            )
            my_tipovehiculo.save()
            return redirect('formulario_tipovehiculo')
        except Exception as e:
            error_message = "Error al crear la persona."
            return render(request, "formtipovehiculo/creartipovehiculo.html", {'error_message': error_message})

    return render(request,'formtipovehiculo/creartipovehiculo.html' )
@login_required(login_url='login')
def editartipovehiculo(request,id):
    try:
        my_tipovehiculo = Tipovehiculo.objects.get(id=id)
    except Tipovehiculo.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulario_tipovehiculo')
    if request.method == 'POST':
        tipovehiculo = request.POST.get('tipovehiculo')
        descripcion = request.POST.get('descripcion')
        try:
            # Actualiza los campos de la instancia existente
            my_tipovehiculo.tipovehiculo = tipovehiculo
            my_tipovehiculo.descripcion = descripcion
            my_tipovehiculo.save()
            # Redirige a la página de listado de roles
            return redirect('formulario_tipovehiculo')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formtipovehiculo/editartipovehiculo.html", {'my_tipovehiculo': my_tipovehiculo, 
            "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })
    return render(request,'formtipovehiculo/editartipovehiculo.html',{'my_tipovehiculo':my_tipovehiculo,
                                                                      } )
@login_required(login_url='login')
def eliminartipovehiculo(request,id):
    tipovehiculoid = Tipovehiculo.objects.get(id=id)
    tipovehiculoid.delete()
    
    return redirect('formulario_tipovehiculo')

@login_required(login_url='login')
def formulario_vehiculo(request):
    vehiculos=Vehiculo.objects.all()
    return render(request,"formvehiculo/formulario_vehiculo.html",{'vehiculos':vehiculos
                                                                  })
@login_required(login_url='login')
def crearvehiculo(request):
    tipovehiculos=Tipovehiculo.objects.all()
    if request.method == 'POST':
        placa= request.POST.get('placa')
        chasis= request.POST.get('chasis')
        marca = request.POST.get('marca')
        modelo= request.POST.get('modelo')
        color = request.POST.get('color')
        motor = request.POST.get('motor')
        kilometraje= request.POST.get('kilometraje')
        cilindraje = request.POST.get('cilindraje')
        capacidad_carga = request.POST.get('capacidad_carga')
        capacidad_pasajeros = request.POST.get('capacidad_pasajeros')
        tipovehiculo = request.POST.get('tipovehiculo')
        tipovehiculoid=Tipovehiculo.objects.get(id=tipovehiculo)
        my_vehiculo = Vehiculo.objects.create(
                placa=placa,
                chasis=chasis,
                marca=marca,
                modelo=modelo,
                color=color,
                motor=motor,
                kilometraje=kilometraje,
                cilindraje=cilindraje,
                capacidad_carga=capacidad_carga,
                capacidad_pasajeros=capacidad_pasajeros,
                tipovehiculo=tipovehiculoid,
                estado=True
            )
        my_vehiculo.save()
        return redirect('formulario_vehiculo')
        

    return render(request,'formvehiculo/crearvehiculo.html', {'tipovehiculos':tipovehiculos})
@login_required(login_url='login')
def editarvehiculo(request,placa):
    try:
        my_vehiculo = Vehiculo.objects.get(placa=placa)
        tipovehiculos=Tipovehiculo.objects.all()
    except Vehiculo.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulario_vehiculo')
    if request.method == 'POST':
        placa= request.POST.get('placa')
        chasis= request.POST.get('chasis')
        marca = request.POST.get('marca')
        modelo= request.POST.get('modelo')
        color = request.POST.get('color')
        motor = request.POST.get('motor')
        kilometraje= request.POST.get('kilometraje')
        cilindraje = request.POST.get('cilindraje')
        capacidad_carga = request.POST.get('capacidad_carga')
        capacidad_pasajeros = request.POST.get('capacidad_pasajeros')
        tipovehiculo = request.POST.get('tipovehiculo')
        tipovehiculoid=Tipovehiculo.objects.get(id=tipovehiculo)
        try:
            # Actualiza los campos de la instancia existente
            my_vehiculo.placa=placa
            my_vehiculo.chasis=chasis
            my_vehiculo.marca=marca
            my_vehiculo.modelo=modelo
            my_vehiculo.color=color
            my_vehiculo.motor=motor
            my_vehiculo.kilometraje=kilometraje
            my_vehiculo.cilindraje=cilindraje
            my_vehiculo.capacidad_carga=capacidad_carga
            my_vehiculo.capacidad_pasajeros=capacidad_pasajeros
            my_vehiculo.tipovehiculo=tipovehiculoid
            my_vehiculo.estado=True
            my_vehiculo.save()
            # Redirige a la página de listado de roles
            return redirect('formulario_vehiculo')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formvehiculo/editarvehiculo.html", {'my_vehiculo': my_vehiculo,
                                                                        'tipovehiculos':tipovehiculos,
                                                                        "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })
    return render(request,'formvehiculo/editarvehiculo.html',{'my_vehiculo':my_vehiculo,
                                                              'tipovehiculos':tipovehiculos} )
@login_required(login_url='login')
def eliminarvehiculo(request,placa):
    vehiculoid = Vehiculo.objects.get(placa=placa)
    vehiculoid.delete()
    
    return redirect('formulario_tipovehiculo')

#Tipod de Mantenimientos 
@login_required(login_url="login")
def formulariotipomantenimiento(request):
    tipomantenimientos=Tipomantenimiento.objects.all()
    return render(request,"formtipomantenimiento/formulariotipomantenimiento.html",{'tipomantenimientos':tipomantenimientos
                                                                  })

@login_required(login_url='login')
def creartipomantenimiento(request):
    if request.method == 'POST':
        tipo = request.POST.get('tipo')
        descripcion = request.POST.get('descripcion')
        try:
            my_tipomantenimiento = Tipomantenimiento.objects.create(
                tipo=tipo,
                descripcion=descripcion
            )
            my_tipomantenimiento.save()
            return redirect('formulariotipomantenimiento')
        except Exception as e:
            error_message = "Error al crear el tipo."
            return render(request, "formtipomantenimiento/creartipomantenimiento.html", {'error_message': error_message})

    return render(request,'formtipomantenimiento/creartipomantenimiento.html' )

@login_required(login_url='login')
def editartipomantenimiento(request,id):
    try:
        my_tipomantenimiento = Tipomantenimiento.objects.get(id=id)
    except Tipomantenimiento.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulariotipomantenimiento')
    if request.method == 'POST':
        tipo = request.POST.get('tipo')
        descripcion = request.POST.get('descripcion')
        try:
            # Actualiza los campos de la instancia existente
            my_tipomantenimiento.tipo = tipo
            my_tipomantenimiento.descripcion = descripcion
            my_tipomantenimiento.save()
            # Redirige a la página de listado de roles
            return redirect('formulariotipomantenimiento')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formtipomantenimiento/editartipomantenimiento.html", {'my_tipomantenimiento': my_tipomantenimiento, 
            "error_message": error_message, 
            #'imagen_empleado': imagen_empleado
            })
    return render(request,'formtipomantenimiento/editartipomantenimiento.html',{'my_tipomantenimiento':my_tipomantenimiento,
                                                                      } )
@login_required(login_url='login')
def eliminartipomantenimiento(request,id):
    tipomanid = Tipomantenimiento.objects.get(id=id)
    tipomanid.delete()
    
    return redirect('formulariotipomantenimiento')  

@login_required(login_url="login")
def formulariomantenimiento(request):
    vehiculos = Vehiculo.objects.all()
    mantenimientos=Mantenimiento.objects.all()
    es_admin = es_administrador(request.user)
    return render(request,"formmantenimiento/formulariomantenimiento.html",{'mantenimientos':mantenimientos,
                                                                            'vehiculos':vehiculos,
                                                                            'es_admin':es_admin
                                                                  })
@login_required(login_url='login')
def crearmantenimiento(request):
    personas=Persona.objects.all()
    tipomantenimientos=Tipomantenimiento.objects.all()
    vehiculos=Vehiculo.objects.all()
    es_admin = es_administrador(request.user)
    if request.method == 'POST':
        fecha= request.POST.get('fecha')
        km= request.POST.get('kmvehiculoactual')
        observaciones= request.POST.get('observaciones')
        persona= request.POST.get('persona')
        vehiculo= request.POST.get('vehiculo')
        tipodemantenimiento= request.POST.get('tipodemantenimiento')
        estado = False
        personaid=Persona.objects.get(identificacion=persona)
        tipomantenimientoid=Tipomantenimiento.objects.get(id=tipodemantenimiento)
        vehiculoid=Vehiculo.objects.get(placa=vehiculo)
        
        my_mantenimiento = Mantenimiento.objects.create(
                fecha=fecha,
                km=km,
                observaciones=observaciones,
                persona=personaid,
                vehiculo=vehiculoid,
                tipodemantenimiento=tipomantenimientoid,
                estado=estado
            )
        my_mantenimiento.save()
        vehiculoid.estado=None
        vehiculoid.save()
        return redirect('formulariomantenimiento')
        
    return render(request,'formmantenimiento/crearmantenimiento.html', {'personas':personas,
                                                                        'vehiculos':vehiculos,
                                                                        'es_admin':es_admin,
                                                                        'tipomantenimientos':tipomantenimientos})  

@login_required(login_url='login')
def editarmantenimiento(request,id):
    try:
        es_admin = es_administrador(request.user)
        personas=Persona.objects.all()
        tipomantenimientos=Tipomantenimiento.objects.all()
        vehiculos=Vehiculo.objects.all()
        my_mantenimiento = Mantenimiento.objects.get(id=id)
    except Mantenimiento.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulariomantenimiento')
    if request.method == 'POST':
        fecha= request.POST.get('fecha')
        km= request.POST.get('km')
        observaciones= request.POST.get('observaciones')
        persona= request.POST.get('persona')
        vehiculo= request.POST.get('vehiculo')
        tipodemantenimiento= request.POST.get('tipodemantenimiento')
        personaid=Persona.objects.get(identificador=persona)
        tipomantenimientoid=Tipomantenimiento.objects.get(id=tipodemantenimiento)
        vehiculoid=Vehiculo.objects.get(placa=vehiculo)
        try:
            # Actualiza los campos de la instancia existente
            my_mantenimiento.fecha = fecha
            my_mantenimiento.km = km
            my_mantenimiento.observaciones = observaciones
            my_mantenimiento.persona = personaid
            my_mantenimiento.vehiculo = vehiculoid
            my_mantenimiento.tipodemantenimiento = tipomantenimientoid
            
            my_mantenimiento.save()
            # Redirige a la página de listado de roles
            return redirect('formulariomantenimiento')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formmantenimiento/editarmantenimiento.html", {'my_mantenimiento': my_mantenimiento,
                                                                                'personas':personas,
                                                                                'vehiculos':vehiculos,
                                                                                'es_admin':es_admin,
                                                                                'tipomantenimientos':tipomantenimientos,
                                                                                "error_message": error_message, 
                                                                                #'imagen_empleado': imagen_empleado
                                                                                })
    return render(request,'formmantenimiento/editarmantenimiento.html',{'my_mantenimiento':my_mantenimiento,
                                                                        'personas':personas,
                                                                        'vehiculos':vehiculos,
                                                                        'es_admin':es_admin,
                                                                        'tipomantenimientos':tipomantenimientos
                                                                      } )

@login_required(login_url='login')
def eliminarmantenimiento(request, id):
    # Obtener la instancia del mantenimiento o devolver un error 404 si no existe
    manid = get_object_or_404(Mantenimiento, id=id)
    # Obtener el vehículo relacionado al mantenimiento
    vehiculo = Vehiculo.objects.get(placa=manid.vehiculo.placa)
    # Actualizar el estado del vehículo y guardarlo
    vehiculo.estado = True
    vehiculo.save()
    # Eliminar el mantenimiento
    manid.delete()
    # Redirigir a la página 'formulariomantenimiento'
    return redirect('formulariomantenimiento')
#-----------------------------------------------------


#################################Boleta de Salida de Mantenimiento####################################
class PDF(FPDF):
    def __init__(self, page_size='A4'):
        super().__init__(orientation='P', unit='mm', format=page_size)
        self.page_size = page_size  # Establecer el formato a 12 cm x 10 cm

    def add_full_page_image(self, img_path):
        # Establecer las coordenadas del punto de inicio para la imagen
        x = 0
        y = 0
        # Obtener el ancho y alto de la página actual
        page_width = self.w
        page_height = self.h
        # Agregar la imagen a toda la página
        self.image(img_path, x, y, page_width, page_height)
    def footer(self):
        self.set_y(-15)
        self.set_font('Arial', 'I', 8)
        self.cell(0, 10, 'Página ' + str(self.page_no()), 0, 0, 'C')

from io import BytesIO
from PIL import Image
import tempfile
def salidamantenimiento(request, id):
    boleta = Mantenimiento.objects.get(id=id)
    cantidad_mantenimientos = Mantenimiento.objects.filter(vehiculo__placa=boleta.vehiculo.placa).count()
    
    if request.method == 'POST':
        codigo = request.POST.get('codigo', '')
        firmage=request.FILES.get('firmage')
        pdf = PDF()
        pdf.set_left_margin(15)
        pdf.set_right_margin(10)
        pdf.add_page()
        
        # Agrega la imagen a toda la página
        # pdf.add_full_page_image('media/imgmodelosfichas/dienav.jpg')
        pdf.set_font("Times", size=9, style='B')
        pdf.ln(0)
        pdf.cell(30, 10, '', 'LTR' )
        pdf.cell(107, 10, 'NOMBRE DEL DOCUMENTO: FORMATO PARA ORDEN DE TRABAJO','LTR', 0, 'C')
        pdf.cell(43, 10, 'Código: '+ codigo, 1)
        pdf.ln()
        pdf.cell(30, 10, '', 'LR' )
        pdf.cell(107, 10, 'DE MANTENIMIENTO PREVENTIVO Y/O CORRECTIVO','LRB', 0, 'C')
        pdf.cell(43, 10, 'Revisión: '+str(cantidad_mantenimientos), 1)
        pdf.ln()
        pdf.cell(30, 10, '', 'LRB' )
        pdf.cell(107, 10, 'Referencia al punto de la norma ISO 9001:2008   6.3, 6.4', 1, 0, 'C')
        numero_total_de_paginas = pdf.page_no()
        pdf.cell(43, 10, 'Página '+str(numero_total_de_paginas)+' de '+str(numero_total_de_paginas), 1)
        pdf.ln(15)
        pdf.set_font("Times", size=10, style='B')
        # Título de la boleta
        pdf.cell(180, 10, "ORDEN DE TRABAJO DE MANTENIMIENTO", '', 1, 'C')
        pdf.set_font("Times", size=10, style='B')
        pdf.ln(10)
        tipo_mantenimiento = boleta.tipodemantenimiento.tipo
        pdf.cell(67, 10, 'Tipo de Mantenimiento','LTB', 0, 'C')
        pdf.cell(10, 10, '','TRB', 0, 'C')
        pdf.cell(103, 10, '', '', 0, 'C')
        pdf.ln()
        pdf.cell(67, 10, 'Preventivo' if tipo_mantenimiento == 'Preventivo' else 'Preventivo', 'LR', 0, 'C')
        pdf.cell(10, 10, 'X' if tipo_mantenimiento == 'Preventivo' else '', 'LTRB', 0, 'C')
        pdf.cell(103, 10, '', '', 0, 'C')
        pdf.ln()
        pdf.cell(67, 10, 'Correctivo' if tipo_mantenimiento == 'Correctivo' else 'Correctivo', 'LTRB', 0, 'C')
        pdf.cell(10, 10, 'X' if tipo_mantenimiento == 'Correctivo' else '', 1, 0, 'C')
        pdf.cell(60, 10, '', '', 0, 'C')
        pdf.cell(43, 10, 'Nº Mantenimiento '+ str(boleta.id),'', 0, 'C')
        pdf.ln(20)
        # ... (Otras secciones de tu código)
        pdf.cell(67, 10, 'Mantenimiento:','LTB', 0, 'L')
        pdf.cell(10, 10, 'Interno','TB', 0, 'C')
        pdf.cell(103, 10, 'Externo', 'RTB', 0, 'C')
        pdf.ln()
        pdf.cell(180, 10, "Kilometraje de Reparación: "+str(boleta.km), 1, 1, 'L')
        pdf.cell(180, 10, "Asignado a: " + boleta.persona.nombres+' '+boleta.persona.apellidos, 1, 1, 'L')
        pdf.ln(10)
        import locale
        locale.setlocale(locale.LC_TIME, 'es_ES.utf8')
        pdf.cell(180, 10, "Fecha de Realizacion: " + datetime.strftime(boleta.fecha, "%d de %B del %Y"), 1, 1, 'L')
        # Datos adicionales
        #pdf.cell(45, 5, 'Fecha:', 1)
        #pdf.cell(45, 5, boleta.fecha.strftime("%d/%m/%Y"), 1)
        # Tamaño máximo de la celda
        # Agregar el texto "Trabajo a Realizar"
        pdf.multi_cell(180, 10, "Trabajo a Realizar: " + boleta.observaciones, 1, 1, 'L')
        pdf.ln(10)

        # Obtener la posición actual después del MultiCell
        x_after_multi_cell = pdf.get_x()
        y_after_multi_cell = pdf.get_y()

        # Agregar el texto "Firma Empleado"
        pdf.cell(90, 10, 'Firma Empleado:', '', 0, 'C')

        # Agregar el texto "Firma Gerente"
        pdf.cell(90, 10, 'Firma Gerente:', '', 0, 'C')
        pdf.ln(15)

        # Agregar líneas adicionales
        pdf.cell(90, 10, '................................................', '', 0, 'C')
        pdf.cell(90, 10, '................................................', '', 0, 'C')

        # Colocar la imagen debajo de "Firma Empleado"
        url_imagen = boleta.persona.firma.path
        pdf.image(url_imagen, x=x_after_multi_cell+35, y=y_after_multi_cell + 10, w=20)
        # Verifica si firmage es un objeto de archivo de imagen válido
        # Verifica si firmage es un objeto de archivo de imagen válido
        if firmage and firmage.content_type.startswith('image'):
            # Lee los datos de la imagen
            imagen_data = BytesIO(firmage.read())

            # Rebobina los datos para que estén al principio
            imagen_data.seek(0)

            # Guarda la imagen temporalmente
            with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as temp_image:
                temp_image.write(imagen_data.read())
                temp_image_path = temp_image.name

            # Agrega la imagen al PDF usando la ruta del archivo temporal
            pdf.image(temp_image_path, x=x_after_multi_cell + 125, y=y_after_multi_cell + 10, w=20, h=10)
                        

        # ... (Otras secciones de tu código)
        # Posición X para la imagen (misma columna que Fecha de Inscripción)
        x = pdf.w - 194
        # Posición Y para la imagen (misma línea que Fecha de Inscripción)
        y = pdf.h - 285
        w = 28  # Ancho de la celda (misma que la celda "Foto")
        h = 26  # Altura de la celda
        image_path = os.path.join(settings.STATIC_ROOT, 'lib/img/logo/logo.jpg')
        pdf.image(image_path, x, y, w, h)
        #pdf.add_page()  # Agrega una nueva página
        # Guardar el PDF en la carpeta docsalidamancar/
        pdf_output = pdf.output(dest='S').encode('latin1')
        pdf_file = ContentFile(pdf_output)
        file_name = f'SalidaMantenimiento_{boleta.vehiculo.placa}.pdf'
        pdf_path = default_storage.save(f'docsalidamancar/{file_name}', pdf_file)

        # Crear un objeto Salidamtto y asociar el PDF
        salidamtto = Salidamtto.objects.create(
            docsalida=pdf_path,
            mantenimiento=boleta,
        )
        salidamtto.save()
        response = HttpResponse(content_type='application/pdf')
        response['Content-Disposition'] = f'filename=SalidaMantenimiento_{boleta.vehiculo.placa}.pdf'

        pdf_output = pdf.output(dest='S').encode('latin1')
        response.write(pdf_output)

        return response
    return render(request, 'formmantenimiento/ingresar_codigo_modal.html')
#Listarsalidas
@login_required(login_url='login')
def listarsalidas(request):
    salidas=Salidamtto.objects.all()
    return render(request,"formmantenimiento/salidamantenimiento.html",{'salidas':salidas})
######################################################################################################
@login_required(login_url='login')
#################################Boleta de Entrada de Mantenimiento####################################
class PDF2(FPDF):
    def __init__(self, page_size='A4'):
        super().__init__(orientation='P', unit='mm', format=page_size)
        self.page_size = page_size  # Establecer el formato a 12 cm x 10 cm

    def add_full_page_image(self, img_path):
        # Establecer las coordenadas del punto de inicio para la imagen
        x = 0
        y = 0
        # Obtener el ancho y alto de la página actual
        page_width = self.w
        page_height = self.h
        # Agregar la imagen a toda la página
        self.image(img_path, x, y, page_width, page_height)
    def footer(self):
        self.set_y(-15)
        self.set_font('Arial', 'I', 8)
        self.cell(0, 10, 'Página ' + str(self.page_no()), 0, 0, 'C')

from io import BytesIO
from PIL import Image
import tempfile
def entradamantenimiento(request, id):
    boletaen = Mantenimiento.objects.get(id=id)
    cantidad_mantenimientos = Mantenimiento.objects.filter(vehiculo__placa=boletaen.vehiculo.placa).count()
    vehiculoid=Vehiculo.objects.get(placa=boletaen.vehiculo.placa)
    if request.method == 'POST':
        codigo = request.POST.get('codigo', '')
        firmage=request.FILES.get('firmage')
        pdf = PDF()
        pdf.set_left_margin(15)
        pdf.set_right_margin(10)
        pdf.add_page()
        
        # Agrega la imagen a toda la página
        # pdf.add_full_page_image('media/imgmodelosfichas/dienav.jpg')
        pdf.set_font("Times", size=9, style='B')
        pdf.ln(0)
        pdf.cell(30, 10, '', 'LTR' )
        pdf.cell(107, 10, 'NOMBRE DEL DOCUMENTO: FORMATO PARA ORDEN DE TRABAJO','LTR', 0, 'C')
        pdf.cell(43, 10, 'Código: '+codigo, 1)
        pdf.ln()
        pdf.cell(30, 10, '', 'LR' )
        pdf.cell(107, 10, 'DE MANTENIMIENTO PREVENTIVO Y/O CORRECTIVO','LRB', 0, 'C')
        pdf.cell(43, 10, 'Reparación: '+str(cantidad_mantenimientos), 1)
        pdf.ln()
        pdf.cell(30, 10, '', 'LRB' )
        pdf.cell(107, 10, 'Referencia al punto de la norma ISO 9001:2008   6.3, 6.4', 1, 0, 'C')
        numero_total_de_paginas = pdf.page_no()
        pdf.cell(43, 10, 'Página '+str(numero_total_de_paginas)+' de '+str(numero_total_de_paginas), 1)
        pdf.ln(15)
        pdf.set_font("Times", size=10, style='B')
        # Título de la boleta
        pdf.cell(180, 10, "ORDEN DE ENTRADA DE MANTENIMIENTO", '', 1, 'C')
        pdf.set_font("Times", size=10, style='B')
        pdf.ln(10)
        tipo_mantenimiento = boletaen.tipodemantenimiento.tipo
        pdf.cell(67, 10, 'Tipo de Mantenimiento','LTB', 0, 'C')
        pdf.cell(10, 10, '','TRB', 0, 'C')
        pdf.cell(103, 10, '', '', 0, 'C')
        pdf.ln()
        pdf.cell(67, 10, 'Preventivo' if tipo_mantenimiento == 'Preventivo' else 'Preventivo', 'LR', 0, 'C')
        pdf.cell(10, 10, 'X' if tipo_mantenimiento == 'Preventivo' else '', 'LTRB', 0, 'C')
        pdf.cell(103, 10, '', '', 0, 'C')
        pdf.ln()
        pdf.cell(67, 10, 'Correctivo' if tipo_mantenimiento == 'Correctivo' else 'Correctivo', 'LTRB', 0, 'C')
        pdf.cell(10, 10, 'X' if tipo_mantenimiento == 'Correctivo' else '', 1, 0, 'C')
        pdf.cell(60, 10, '', '', 0, 'C')
        pdf.cell(43, 10, 'Nº Mantenimiento '+ str(boletaen.id),'', 0, 'C')
        pdf.ln(20)
        # ... (Otras secciones de tu código)
        pdf.cell(67, 10, 'Mantenimiento:','LTB', 0, 'L')
        pdf.cell(10, 10, 'Interno','TB', 0, 'C')
        pdf.cell(103, 10, 'Externo', 'RTB', 0, 'C')
        pdf.ln()
        pdf.cell(180, 10, "Kilometraje Nuevo: "+str(boletaen.km), 1, 1, 'L')
        pdf.cell(180, 10, "Asignado a: " + boletaen.persona.nombres+' '+boletaen.persona.apellidos, 1, 1, 'L')
        pdf.ln(10)
        from fpdf import FPDF
        from datetime import datetime
        import locale
        # Establecer la localización a español
        locale.setlocale(locale.LC_TIME, 'es_ES.utf8')
        # Obtener la fecha actual
        fecha_actual = datetime.now()
        # Formatear la fecha actual
        fecha_formateada = fecha_actual.strftime("%d de %B del %Y")
        
        pdf.multi_cell(180, 10, "Fecha de Realizacion: " + fecha_formateada, 1, 1, 'L')

        # Datos adicionales
        #pdf.cell(45, 5, 'Fecha:', 1)
        #pdf.cell(45, 5, boleta.fecha.strftime("%d/%m/%Y"), 1)
        # Tamaño máximo de la celda
        # Agregar el texto "Trabajo a Realizar"
        # Supongamos que boletaen.observaciones contiene las observaciones como una cadena
        observaciones_str = boletaen.observaciones

        # Convertir la cadena de observaciones a una lista de líneas
        observaciones = observaciones_str.split('\n')
        for observacion in observaciones:
            pdf.multi_cell(180, 10,observacion+ ' -->Hecho', 1, 0, 'L')
        
        pdf.ln(10)
        # Obtener la posición actual después del MultiCell
        x_after_multi_cell = pdf.get_x()
        y_after_multi_cell = pdf.get_y()
        # Agregar el texto "Firma Empleado"
        pdf.cell(90, 10, 'Firma Empleado:', '', 0, 'C')
        # Agregar el texto "Firma Gerente"
        pdf.cell(90, 10, 'Firma Gerente:', '', 0, 'C')
        pdf.ln(15)
        # Agregar líneas adicionales
        pdf.cell(90, 10, '................................................', '', 0, 'C')
        pdf.cell(90, 10, '................................................', '', 0, 'C')
        # Colocar la imagen debajo de "Firma Empleado"
        url_imagen = boletaen.persona.firma.path
        pdf.image(url_imagen, x=x_after_multi_cell+35, y=y_after_multi_cell + 10, w=20)
        # Verifica si firmage es un objeto de archivo de imagen válido
        # Verifica si firmage es un objeto de archivo de imagen válido
        if firmage and firmage.content_type.startswith('image'):
            # Lee los datos de la imagen
            imagen_data = BytesIO(firmage.read())
            # Rebobina los datos para que estén al principio
            imagen_data.seek(0)
            # Guarda la imagen temporalmente
            with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as temp_image:
                temp_image.write(imagen_data.read())
                temp_image_path = temp_image.name
            # Agrega la imagen al PDF usando la ruta del archivo temporal
            pdf.image(temp_image_path, x=x_after_multi_cell + 125, y=y_after_multi_cell + 10, w=20, h=10)
                        
        # ... (Otras secciones de tu código)
        # Posición X para la imagen (misma columna que Fecha de Inscripción)
        x = pdf.w - 194
        # Posición Y para la imagen (misma línea que Fecha de Inscripción)
        y = pdf.h - 285
        w = 28  # Ancho de la celda (misma que la celda "Foto")
        h = 26  # Altura de la celda
        image_path = os.path.join(settings.STATIC_ROOT, 'lib/img/logo/logo.jpg')
        pdf.image(image_path, x, y, w, h)
        #pdf.add_page()  # Agrega una nueva página
        # Guardar el PDF en la carpeta docsalidamancar/
        pdf_output = pdf.output(dest='S').encode('latin1')
        pdf_file = ContentFile(pdf_output)
        file_name = f'EntradaMantenimiento_{boletaen.vehiculo.placa}.pdf'
        pdf_path = default_storage.save(f'docentradamancar/{file_name}', pdf_file)

        # Crear un objeto Salidamtto y asociar el PDF
        entradamtto = Entradamtto.objects.create(
            docentrada=pdf_path,
            mantenimiento=boletaen,
        )
        entradamtto.save()
        boletaen.estado=True
        boletaen.save()
        vehiculoid.estado=True
        vehiculoid.save()
        response = HttpResponse(content_type='application/pdf')
        response['Content-Disposition'] = f'filename=EntradaMantenimiento_{boletaen.vehiculo.placa}.pdf'
        pdf_output = pdf.output(dest='S').encode('latin1')
        response.write(pdf_output)
        return response
    return render(request, 'formmantenimiento/ingresar_codigo_modal.html')   

@login_required(login_url='login')
def listarentradas(request):
    entradas=Entradamtto.objects.all()
    return render(request,"formmantenimiento/entradamantenimiento.html",{'entradas':entradas})  
######################################################################################################

#Circuito
@login_required(login_url="login")
def formulariocircuito(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    subcircuitos = Subcircuito.objects.all()
    circuitos = Circuito.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formcircuito/formulariocircuito.html', {'circuitos': circuitos,
                                                                     'subcircuitos':subcircuitos,
                                                              'es_admin':es_admin
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })

@login_required(login_url='login')
def crearcircuito(request):
    subcircuitos = Subcircuito.objects.all() 
    if request.method == 'POST':
        cod_circuito = request.POST.get('cod_circuito')
        nombre_circuito = request.POST.get('nombre_circuito')
        numero_circuito = request.POST.get('numero_circuito')
        id_subcircuito = request.POST.get('id_subcircuito')
        try:
            my_circuito = Circuito.objects.create(
                cod_circuito = cod_circuito,
                nombre_circuito=nombre_circuito,
                numero_circuito=numero_circuito,
                id_subcircuito_id=id_subcircuito
            )
            my_circuito.save()
            return redirect('formulariocircuito')
        except Exception as e:
            error_message = "Error al crear el circuito."
            return render(request, "formcircuito/crearcircuito.html", {'error_message': error_message, 'subcircuitos':subcircuitos})

    return render(request,'formcircuito/crearcircuito.html', {'subcircuitos':subcircuitos}) 

@login_required(login_url='login')
def editarcircuito(request, cod_circuito):
    subcircuitos = Subcircuito.objects.all()
    try:
        my_circuito = Circuito.objects.get(cod_circuito=cod_circuito)
    except Circuito.DoesNotExist:
        return redirect('formulariocircuito')

    if request.method == 'POST':
        cod_circuito = request.POST.get('cod_circuito')
        nombre_circuito = request.POST.get('nombre_circuito')
        numero_circuito = request.POST.get('numero_circuito')
        id_subcircuito = request.POST.get('id_subcircuito')

        try:
            my_circuito.cod_circuito = cod_circuito
            my_circuito.nombre_circuito = nombre_circuito
            my_circuito.numero_circuito = numero_circuito
            my_circuito.id_subcircuito_id = id_subcircuito  # Usa el campo 'id_subcircuito_id' para establecer la relación
            my_circuito.save()
            return redirect('formulariocircuito')
        except Exception as e:
            error_message = "Error al actualizar el circuito."
            return render(request, "formcircuito/editarcircuito.html", {'my_circuito': my_circuito,
                                                                       "error_message": error_message,
                                                                       'subcircuitos': subcircuitos})

    return render(request, 'formcircuito/editarcircuito.html', {'my_circuito': my_circuito, 'subcircuitos': subcircuitos})


@login_required(login_url='login')
def eliminarcircuito(request, cod_circuito):
    circuitocod_circuito = Circuito.objects.get(cod_circuito=cod_circuito)
    circuitocod_circuito.delete()
    return redirect('formulariocircuito')

#subcircuito
@login_required(login_url="login")
def formulariosubcircuito(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    subcircuitos = Subcircuito.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formsubcircuito/formulariosubcircuito.html', {'subcircuitos': subcircuitos,
                                                              'es_admin':es_admin
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })
@login_required(login_url='login')
def crearsubcircuito(request):
    if request.method == 'POST':
        cod_subcircuito = request.POST.get('cod_subcircuito')
        nombre_subcircuito = request.POST.get('nombre_subcircuito')
        numero_subcircuito = request.POST.get('numero_subcircuito')
        try:
            my_subcircuito = Subcircuito.objects.create(
                cod_subcircuito = cod_subcircuito,
                nombre_subcircuito=nombre_subcircuito,
                numero_subcircuito=numero_subcircuito
            )
            my_subcircuito.save()
            return redirect('formulariosubcircuito')
        except Exception as e:
            error_message = "Error al crear el subcircuito."
            return render(request, "formsubcircuito/crearsubcircuito.html", {'error_message': error_message})

    return render(request,'formsubcircuito/crearsubcircuito.html' )

@login_required(login_url='login')
def editarsubcircuito(request,cod_subcircuito):
    try:
        my_subcircuito = Subcircuito.objects.get(cod_subcircuito=cod_subcircuito)
    except Subcircuito.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulariosubcircuito')
    if request.method == 'POST':
        cod_subcircuito = request.POST.get('cod_subcircuito')
        nombre_subcircuito = request.POST.get('nombre_subcircuito')
        numero_subcircuito = request.POST.get('numero_subcircuito')
        try:
            # Actualiza los campos de la instancia existente
            my_subcircuito.cod_subcircuito = cod_subcircuito
            my_subcircuito.nombre_subcircuito = nombre_subcircuito
            my_subcircuito.numero_subcircuito = numero_subcircuito
            my_subcircuito.save()
            # Redirige a la página de listado de roles
            return redirect('formulariosubcircuito')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formsubcircuito/editarsubcircuito.html", {'my_subcircuito': my_subcircuito, 
                                                                        "error_message": error_message, 
                                                                     #'imagen_empleado': imagen_empleado
                                                                                                        })
    return render(request,'formsubcircuito/editarsubcircuito.html',{'my_subcircuito':my_subcircuito,
                                                                      } )
@login_required(login_url='login')
def eliminarsubcircuito(request, cod_subcircuito):
    subcircuitocod_subcircuito = Subcircuito.objects.get(cod_subcircuito=cod_subcircuito)
    subcircuitocod_subcircuito.delete()
    return redirect('formulariosubcircuito')


#distrito
@login_required(login_url="login")
def formulariodistrito(request):
    #imagen_empleado = obtener_imagen_empleado(request.user)
    distritos = Distrito.objects.all()
    es_admin = es_administrador(request.user)
    return render(request, 'formdistrito/formulariodistrito.html', {'distritos': distritos,
                                                              'es_admin':es_admin
                                                                 #'imagen_empleado': imagen_empleado
                                                                 })
@login_required(login_url='login')
def creardistrito(request):
    if request.method == 'POST':
        cod_distrito = request.POST.get('cod_distrito')
        nombre_distrito = request.POST.get('nombre_distrito')
        numero_distrito = request.POST.get('numero_distrito')
        try:
            my_distrito = Distrito.objects.create(
                cod_distrito = cod_distrito,
                nombre_distrito=nombre_distrito,
                numero_distrito=numero_distrito
            )
            my_distrito.save()
            return redirect('formulariodistrito')
        except Exception as e:
            error_message = "Error al crear el distrito."
            return render(request, "formdistrito/creardistrito.html", {'error_message': error_message})

    return render(request,'formdistrito/creardistrito.html' )

@login_required(login_url='login')
def editardistrito(request,cod_distrito):
    try:
        my_distrito = Distrito.objects.get(cod_distrito=cod_distrito)
    except Distrito.DoesNotExist:
        # Manejar el caso si el rol no existe
        # Redirige a la página de listado de roles
        return redirect('formulariodistrito')
    if request.method == 'POST':
        cod_distrito = request.POST.get('cod_distrito')
        nombre_distrito = request.POST.get('nombre_distrito')
        numero_distrito = request.POST.get('numero_distrito')
        try:
            # Actualiza los campos de la instancia existente
            my_distrito.cod_distrito = cod_distrito
            my_distrito.nombre_distrito = nombre_distrito
            my_distrito.numero_distrito = numero_distrito
            my_distrito.save()
            # Redirige a la página de listado de roles
            return redirect('formulariodistrito')
        except Exception as e:
            # Handle any other exception that may occur while creating the new object
            error_message = "Error al actulizar el Rol."
            return render(request, "formdistrito/editardistrito.html", {'my_distrito': my_distrito, 
                                                                        "error_message": error_message, 
                                                                     #'imagen_empleado': imagen_empleado
                                                                                                        })
    return render(request,'formdistrito/editardistrito.html',{'my_distrito':my_distrito,
                                                                      } )
@login_required(login_url='login')
def eliminardistrito(request, cod_distrito):
    distritocod_distrito = Distrito.objects.get(cod_distrito=cod_distrito)
    distritocod_distrito.delete()
    return redirect('formulariodistrito')

