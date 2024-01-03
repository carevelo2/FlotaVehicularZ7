from django.test import TestCase

# Create your tests here.
from django.urls import reverse
from django.contrib.auth.models import User, Group
from django.contrib.auth import get_user_model

class FormularioRolesTest(TestCase):
    def setUp(self):
        # Crear un usuario de prueba
        self.user = get_user_model().objects.create_user(
            username='testuser',
            password='testpassword'
        )

        # Crear un grupo de prueba
        self.group = Group.objects.create(name='TestGroup')

    def test_formulario_roles_view(self):
        # Iniciar sesión como el usuario de prueba
        self.client.login(username='testuser', password='testpassword')

        # Obtener la URL de la vista
        url = reverse('formulario_roles')

        # Realizar una solicitud GET a la vista
        response = self.client.get(url)

        # Verificar que la respuesta tenga un código 200 (éxito)
        self.assertEqual(response.status_code, 200)

        # Verificar que el contexto contiene la lista de grupos
        self.assertIn('grupos', response.context)

        # Verificar que el grupo de prueba está en la lista de grupos
        self.assertIn(self.group, response.context['grupos'])

        # También puedes verificar otros aspectos de la respuesta según sea necesario

        # Por ejemplo, puedes verificar la existencia de ciertos elementos en el HTML de la respuesta

        # También puedes verificar que ciertos datos específicos estén presentes en el HTML

    # Agrega más tests según sea necesario