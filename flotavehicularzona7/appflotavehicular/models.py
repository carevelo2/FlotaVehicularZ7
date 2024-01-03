from datetime import datetime
from django.db import models
from django.contrib.auth.models import User

# Create your models here.
# Rango
class Rango(models.Model):
    rangopersona= models.CharField(max_length=100)
    detalle= models.CharField(max_length=100)
    def _str_(self):
        fila = "identificacion {}\nNombres: {}\n".format(
            self.rangopersona , self.detalle)
        return fila

    class Meta:
        verbose_name = 'Rango'
        verbose_name_plural = 'Rangos'
#Modelo de Subcircuito
class Subcircuito(models.Model):
    cod_subcircuito = models.CharField(primary_key=True, max_length=20, unique=True)
    nombre_subcircuito= models.CharField(max_length=100)
    numero_subcircuito= models.CharField(max_length=100)
    def _str_(self):
        fila = "cod_subcircuito {}\nnombre_subcircuito: {}\n".format(
            self.cod_subcircuito , self.nombre_subcircuito)
        return fila

    class Meta:
        verbose_name = 'Subcircuito'
        verbose_name_plural = 'Subcircuitos'


#Modelo de Circuito
class Circuito(models.Model):
    cod_circuito = models.CharField(primary_key=True, max_length=20, unique=True)
    nombre_circuito= models.CharField(max_length=100)
    numero_circuito= models.CharField(max_length=100)
    id_subcircuito = models.ForeignKey(Subcircuito,on_delete=models.CASCADE)
    def _str_(self):
        fila = "cod_circuito {}\nnombre_circuito: {}\n".format(
            self.cod_circuito , self.nombre_circuito)
        return fila

    class Meta:
        verbose_name = 'Circuito'
        verbose_name_plural = 'Circuitos'


#Modelo de Distrito
class Distrito(models.Model):
    cod_distrito = models.CharField(primary_key=True, max_length=20, unique=True)
    nombre_distrito = models.CharField(max_length=100)
    numero_distrito = models.CharField(max_length=100)
    def _str_(self):
        fila = "cod_distrito {}\nnombre_distrito: {}\n".format(
            self.cod_distrito , self.nombre_distrito)
        return fila

    class Meta:
        verbose_name = 'Distrito'
        verbose_name_plural = 'Distritos'

# Modelo de Dependencia
class Dependencia(models.Model):
    identificacion = models.CharField(primary_key=True, max_length=20, unique=True)
    provincia = models.CharField(max_length=50)
    id_distrito = models.ForeignKey(Distrito, on_delete=models.CASCADE)
    parroquia = models.CharField(max_length=50)
    id_circuito =  models.ForeignKey(Circuito, on_delete=models.CASCADE)
    id_subcircuito = models.ForeignKey(Subcircuito, on_delete=models.CASCADE)
    def _str_(self):
       fila = "identificacion {}\nprovincia: {}\nparroquia: {}\n".format(
           self.identificacion , self.provincia, self.parroquia)
       return fila

    class Meta:
        verbose_name = 'Dependencia'
        verbose_name_plural = 'Dependencias'


# Modelo de Persona
class Persona(models.Model):
    identificacion = models.CharField(primary_key=True, max_length=10, unique=True)
    nombres = models.CharField(max_length=50)
    apellidos = models.CharField(max_length=50)
    codigoempleado =models.ForeignKey(User, on_delete=models.CASCADE)
    direccion = models.CharField(max_length=150)
    fecha_nacimiento = models.DateField(default=datetime.now())
    tipo_sangre = models.CharField(max_length=10)
    ciudad_nacimiento = models.CharField(max_length=25)
    numero_celular = models.CharField(max_length=10)
    id_rango = models.ForeignKey(Rango, on_delete=models.CASCADE)
    dependencia = models.CharField(max_length=150)
    firma = models.ImageField(upload_to='firmasempleados/',blank=True, null=True)
    contrasenia_firma = models.CharField(max_length=255,blank=True, null=True)
    def _str_(self):
        fila = "identificacion {}\nNombres: {}\nApellidos: {}\nDirección: {}\n".format(
            self.identificacion , self.nombres, self.apellidos, self.direccion)
        return fila

    class Meta:
        verbose_name = 'Persona'
        verbose_name_plural = 'Personas'

#Tipo de mantenimiento
class Tipomantenimiento(models.Model):
    tipo = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=200)
    def __str__(self):
        return self.descripcion
    class Meta:
        verbose_name = 'Tipo mantenimiento'
        verbose_name_plural = 'Tipo de mantenimientos'        
# Tipovehiculo
class Tipovehiculo(models.Model):
    tipovehiculo = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200,blank=True, null=True )
    def __str__(self):
        return self.descripcion
    class Meta:
        verbose_name='Tipo Vehículo'
        verbose_name_plural='Tipos de Vehículos'

# Vehiculo 
class Vehiculo(models.Model):
    placa = models.CharField(max_length=8, primary_key=True)
    chasis=models.CharField(max_length=30)
    marca = models.CharField(max_length=30)
    modelo = models.CharField(max_length=40)
    color = models.CharField(max_length=20)
    motor = models.CharField(max_length=100)
    kilometraje = models.IntegerField()
    cilindraje = models.FloatField()
    capacidad_carga = models.IntegerField()
    capacidad_pasajeros = models.IntegerField()
    #propietario = models.ManyToManyField(Persona, related_name='vehiculos')
    tipovehiculo =models.ForeignKey(Tipovehiculo, on_delete=models.CASCADE)
    estado=models.BooleanField(blank=True, null=True)
    def __str__(self):
        return "{}-{}-{}".format(self.placa, self.marca, self.color)
    class Meta:
        verbose_name = 'Vehículo'
        verbose_name_plural = 'Vehículos'    

#Mantenimiento vehicular
class Mantenimiento(models.Model):
    fecha = models.DateField(default=datetime.now())
    km = models.DecimalField(max_digits=15, decimal_places=2)
    observaciones = models.TextField(blank=True,null=True)
    persona = models.ForeignKey(Persona, blank=True, null=True, on_delete=models.CASCADE)
    vehiculo=models.ForeignKey(Vehiculo, on_delete=models.CASCADE)
    tipodemantenimiento=models.ForeignKey(Tipomantenimiento, on_delete=models.CASCADE)
    estado=models.BooleanField()
    def __str__(self):
        return "{}-{}-{}".format(self.fecha, self.km, self.observaciones)
    class Meta:
        verbose_name = ("Mantenimiento")
        verbose_name_plural = ("Mantenimientos")
    
#Salida a mantenimiento
class Salidamtto(models.Model):
    docsalida = models.ImageField(upload_to='docsalidamancar/')
    mantenimiento =models.ForeignKey(Mantenimiento, on_delete=models.CASCADE)
    def __str__(self):
        return "{}-{}-{}".format(self.docsalida )
    class Meta:
        verbose_name = ("Salida mantenimiento")
        verbose_name_plural = ("Salida mantenimientos")

class Entradamtto(models.Model):
    docentrada = models.ImageField(upload_to='docentradamancar/')
    mantenimiento =models.ForeignKey(Mantenimiento, on_delete=models.CASCADE)
    def __str__(self):
        return "{}-{}-{}".format(self.mantenimiento)
    class Meta:
        verbose_name = ("Entrada mantenimiento")
        verbose_name_plural = ("Entrada mantenimientos")
            
   