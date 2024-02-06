from datetime import datetime
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

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
    cod_circuito = models.CharField(max_length=20)
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
    cod_distrito = models.CharField(max_length=20)
    nombre_distrito = models.CharField(max_length=100)
    numero_distrito = models.CharField(max_length=100)
    id_circuito = models.ForeignKey(Circuito,on_delete=models.CASCADE)
    def __str__(self):
        fila = "cod_distrito {}\nnombre_distrito: {}\n".format(
            self.cod_distrito , self.nombre_distrito)
        return fila

    class Meta:
        verbose_name = 'Distrito'
        verbose_name_plural = 'Distritos'

# Modelo de Dependencia
class Dependencia(models.Model):
    provincia = models.CharField(max_length=50)
    id_distrito = models.ForeignKey(Distrito, on_delete=models.CASCADE)
    parroquia = models.CharField(max_length=50)
    def __str__(self):
       fila = "nprovincia: {}\nparroquia: {}\n".format(
           self.provincia, self.parroquia)
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
    fecha_nacimiento = models.DateField(default=datetime.now)
    tipo_sangre = models.CharField(max_length=10)
    ciudad_nacimiento = models.CharField(max_length=25)
    numero_celular = models.CharField(max_length=10)
    id_rango = models.ForeignKey(Rango, on_delete=models.CASCADE)
    dependencia = models.ForeignKey(Dependencia, on_delete=models.CASCADE)
    # firma = models.ImageField(upload_to='firmasempleados/',blank=True, null=True)
    # contrasenia_firma = models.CharField(max_length=255,blank=True, null=True)
    def __str__(self):
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
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    iva = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2)
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
    capacidad_carga = models.FloatField()
    capacidad_pasajeros = models.IntegerField()
    #propietario = models.ManyToManyField(Persona, related_name='vehiculos')
    tipovehiculo =models.ForeignKey(Tipovehiculo, on_delete=models.CASCADE)
    dependencia = models.ForeignKey(Dependencia, on_delete=models.CASCADE)
    estado=models.BooleanField(blank=True, null=True)

    def __str__(self):
        return "{}-{}-{}".format(self.placa, self.marca, self.color)
    class Meta:
        verbose_name = 'Vehículo'
        verbose_name_plural = 'Vehículos'    

#Mantenimiento vehicular
class Mantenimiento(models.Model):
    fecha = models.DateField(default=datetime.now)
    fechaentrada = models.DateField(default=datetime.now, blank=True,null=True)
    km = models.DecimalField(max_digits=15, decimal_places=2)
    observaciones = models.TextField(blank=True,null=True)
    persona = models.ForeignKey(Persona, blank=True, null=True, on_delete=models.CASCADE)
    vehiculo=models.ForeignKey(Vehiculo, on_delete=models.CASCADE)
    tipodemantenimiento=models.ForeignKey(Tipomantenimiento, on_delete=models.CASCADE)
    costo= models.DecimalField(max_digits=10, decimal_places=2)
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
            
#orden de trabajo DENDENCIA
class OrdendeTrabajo(models.Model):
    fecha = models.DateField(default=datetime.now)
    fechaentrada = models.DateField(default=datetime.now, blank=True,null=True)
    vehiculo = models.ForeignKey(Vehiculo,on_delete=models.CASCADE) #referencia al modelo Vehiculo
    responsable = models.ForeignKey(Persona,on_delete=models.CASCADE)
    agente1 = models.ForeignKey(Persona,on_delete=models.CASCADE,blank=True, null=True,related_name='ordendetrabajo_agente1')
    agente2 = models.ForeignKey(Persona,on_delete=models.CASCADE,blank=True, null=True,related_name='ordendetrabajo_agente2')
    agente3 = models.ForeignKey(Persona,on_delete=models.CASCADE,blank=True, null=True,related_name='ordendetrabajo_agente3')
    ruta = models.CharField(max_length=1000)
    dependencia=models.ForeignKey(Dependencia,on_delete=models.CASCADE)
    km = models.DecimalField(max_digits=8, decimal_places=2)
    observaciones = models.TextField(max_length=500, blank=True)
    estado=models.BooleanField(blank=True, null=True)
                            
                             
    def __str__(self):
        return "Orden N° {} - Fecha {}".format(self.id,self.fecha.strftime("%d/%m/%Y"))
    class Meta:
        verbose_name = 'Orden de Trabajo'
        verbose_name_plural = 'Ordenes de Trabajo'

class SalidaOrden(models.Model):
    docsalidaorden = models.ImageField(upload_to='docsalidaorden/')
    salida =models.ForeignKey(OrdendeTrabajo, on_delete=models.CASCADE)
    def __str__(self):
        return "{}-{}-{}".format(self.docsalidaorden)
    class Meta:
        verbose_name = ("Salida Orden")
        verbose_name_plural = ("Salidas Ordenes")
class EntradaOrden(models.Model):
    docentradaorden = models.ImageField(upload_to='docentradaorden/')
    entrada =models.ForeignKey(OrdendeTrabajo, on_delete=models.CASCADE)
    def __str__(self):
        return "{}-{}-{}".format(self.docentradaorden)
    class Meta:
        verbose_name = ("Entrada Orden")
        verbose_name_plural = ("Entradas Ordenes")    

#Modelo de Registrar Denuncia
class Denuncia(models.Model):
    fecha_ingreso = models.DateField(default=timezone.now)
    id_circuito = models.ForeignKey(Circuito,on_delete=models.CASCADE)
    id_subcircuito = models.ForeignKey(Subcircuito,on_delete=models.CASCADE)
    tipo = models.CharField(max_length=20)
    detalle = models.CharField(max_length=100)
    contacto = models.CharField(max_length=100)
    nombres = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    
    def __str__(self):
        fila = "id {}\nfecha_ingreso: {}\n".format(
            self.fecha_ingreso , self.nombres)
        return fila

    class Meta:
        verbose_name = 'Denuncia'
        verbose_name_plural = 'Denuncias'