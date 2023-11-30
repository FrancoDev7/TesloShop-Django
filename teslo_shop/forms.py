from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Producto
from .models import Venta

class ProductoForm(forms.ModelForm):

    class Meta:
        model = Producto
        fields = ('nombre', 'descripcion', 'precio','stock', 'talla', 'imagen')
        
    def __init__(self, *args, **kwargs):
        super(ProductoForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'POST'
        self.helper.add_input(Submit('submit', 'Guardar producto'))


    def clean_nombre(self):
        nombre = self.cleaned_data['nombre']
        if len(nombre) < 3:
            raise forms.ValidationError('El nombre debe tener al menos 3 caracteres')
        if not nombre :
            raise forms.ValidationError('Debe ingresar un nombre')
        return nombre
    
    def clean_descripcion(self):
        descripcion = self.cleaned_data['descripcion']
        if len(descripcion) < 3:
            raise forms.ValidationError('La descripcion debe tener al menos 3 caracteres')
        if not descripcion :
            raise forms.ValidationError('Debe ingresar una descripcion')
        return descripcion
    
    def clean_precio(self):
        precio = self.cleaned_data['precio']
        if precio < 0:
            raise forms.ValidationError('El precio debe ser mayor a 0')
        if not precio :
            raise forms.ValidationError('Debe ingresar un precio')
        return precio
    
    def clean_stock(self):
        stock = self.cleaned_data['stock']
        if stock < 0:
            raise forms.ValidationError('El stock debe ser mayor a 0')
        if not stock :
            raise forms.ValidationError('Debe ingresar un stock')
        return stock
    
    def clean_talla(self):
        talla = self.cleaned_data['talla']
        if not talla :
            raise forms.ValidationError('Debe ingresar una talla')
        return talla
    
    def clean_imagen(self):
        imagen = self.cleaned_data['imagen']
        if not imagen :
            raise forms.ValidationError('Debe ingresar una imagen')
        return imagen
    
class NuevoUsuarioForm(UserCreationForm):

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name','email','password1','password2')

    def __init__(self, *args, **kwargs):
        super(NuevoUsuarioForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['first_name'].widget.attrs['class'] = 'form-control'
        self.fields['last_name'].widget.attrs['class'] = 'form-control'        
        self.fields['email'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'        
        self.fields['password2'].widget.attrs['class'] = 'form-control'        
        self.helper = FormHelper()
        self.helper.form_method = 'POST'
        self.helper.add_input(Submit('submit', 'Guardar usuario'))

    def clean_username(self):
        username = self.cleaned_data['username']
        if len(username) < 3:
            raise forms.ValidationError('El nombre de usuario debe tener al menos 3 caracteres')
        if not username :
            raise forms.ValidationError('Debe ingresar un nombre de usuario')
        return username
    
    def clean_first_name(self):
        first_name = self.cleaned_data['first_name']
        if len(first_name) < 3:
            raise forms.ValidationError('El nombre debe tener al menos 3 caracteres')
        if not first_name :
            raise forms.ValidationError('Debe ingresar un nombre')
        return first_name
    
    def clean_last_name(self):
        last_name = self.cleaned_data['last_name']
        if len(last_name) < 3:
            raise forms.ValidationError('El apellido debe tener al menos 3 caracteres')
        if not last_name :
            raise forms.ValidationError('Debe ingresar un apellido')
        return last_name
    
    def clean_email(self):
        email = self.cleaned_data['email']
        if not email :
            raise forms.ValidationError('Debe ingresar un email')
        return email
    
    def clean_password1(self):
        password1 = self.cleaned_data['password1']
        if len(password1) < 3:
            raise forms.ValidationError('La contraseña debe tener al menos 3 caracteres')
        if not password1 :
            raise forms.ValidationError('Debe ingresar una contraseña')
        return password1
    
    def clean_password2(self):
        password2 = self.cleaned_data['password2']
        if len(password2) < 3:
            raise forms.ValidationError('La contraseña debe tener al menos 3 caracteres')
        if not password2 :
            raise forms.ValidationError('Debe ingresar una contraseña')
        return password2
    

class VentaForm(forms.ModelForm):
    class Meta:
        model = Venta
        fields = ['producto', 'cantidad', 'nombre_comprador', 'correo', 'direccion_envio', 'rut']

    def __init__(self, *args, **kwargs):
        super(VentaForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'POST'
        self.helper.add_input(Submit('submit', 'Realizar compra'))

    def clean_nombre_comprador(self):
        nombre_comprador = self.cleaned_data['nombre_comprador']
        if len(nombre_comprador) < 3:
            raise forms.ValidationError('El nombre del comprador debe tener al menos 3 caracteres')
        return nombre_comprador