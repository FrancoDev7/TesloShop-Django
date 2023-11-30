import datetime
from django.http import Http404
from django.shortcuts import render,redirect, get_object_or_404
from .models import Producto,Venta
from .forms import ProductoForm,NuevoUsuarioForm,VentaForm
from django.contrib import messages
from django.contrib.auth.models import User
from django.core.paginator import Paginator

# Create your views here.

def mantenedores(request):
    return render(request, 'teslo/mantenedores.html')

#Usuarios
def UsuariosListView(request):
    query = request.GET.get('q')
    usuarios = User.objects.all()

    if query:
        usuarios = User.objects.filter(
            username__icontains=query
        ).distinct()
    
    data = {
        'usuarios': usuarios
    }
    return render(request, 'users/list.html', data)

def agregar_usuario(request):
    if request.method == 'POST':
        form = NuevoUsuarioForm(request.POST)
        if form.is_valid():
            form.save()

            if form:
                messages.success(request, 'Usuario Creado Correctamente')
            else:
                messages.error(request, 'Error al crear usuario')

            return redirect('usuarios')
    else:
        form = NuevoUsuarioForm()
    return render(request, 'users/add_usuario.html', {'form': form})

def editar_usuario(request, usuario_id):
    usuario = get_object_or_404(User, id=usuario_id)

    if request.method == 'POST':
        form = NuevoUsuarioForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            messages.success(request, 'Usuario Editado Correctamente')
            return redirect('usuarios')
    else:
        form = NuevoUsuarioForm(instance=usuario)
    return render(request, 'users/edit_usuario.html', {'form': form , 'usuario':usuario})

def eliminar_usuario(request, usuario_id):
    usuario = get_object_or_404(User, id=usuario_id)

    if request.method == 'POST':
        usuario.delete()
        messages.success(request, 'Usuario Eliminado Correctamente')
        return redirect('usuarios')
    return render(request, 'users/delete_usuario.html', {'usuario': usuario})



#Productos

def ProductosView(request):
    productos = Producto.objects.all()
    

    data = { 'productos': productos}

    return render(request, 'teslo/productos.html', data)

def ProductosListView(request):
    query = request.GET.get('q')
    productos = Producto.objects.all()
    page = request.GET.get('page', 1)

    try:
        paginator = Paginator(productos, 5)
        productos = paginator.page(page)
    except:
        raise Http404

    if query:
        productos = Producto.objects.filter(nombre__icontains=query).distinct()
    
    data = {
        'productos': productos,
        'paginator': paginator,
    }
    return render(request, 'productos/list.html', data)

def crear_producto(request):
    if request.method == 'POST':
        form = ProductoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()

            if form:
                messages.success(request, 'Producto Creado Correctamente')
            else:
                messages.error(request, 'Error al crear producto')

            return redirect('productos')
    else:
        form = ProductoForm()

    return render(request, 'productos/crear_producto.html', {'form': form})

def editar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)

    if request.method == 'POST':
        form = ProductoForm(request.POST, request.FILES, instance=producto)
        if form.is_valid():
            form.save()
            messages.success(request, 'Producto Editado Correctamente')
            return redirect('productos')
    else:
        form = ProductoForm(instance=producto)
    return render(request, 'productos/editar_producto.html', {'form': form , 'producto':producto})

def eliminar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)

    if request.method == 'POST':
        producto.delete()
        messages.success(request, 'Producto Eliminado Correctamente')
        return redirect('productos')
    return render(request, 'productos/eliminar_producto.html', {'producto': producto})

#Ventas

def VentasListView(request):
    fecha_buscada = request.GET.get('fecha')

    # Si hay una fecha proporcionada en la URL, filtrar por esa fecha
    if fecha_buscada:
        try:
            fecha_parseada = datetime.strptime(fecha_buscada, '%Y-%m-%d')
            ventas = Venta.objects.filter(fecha_venta__date=fecha_parseada)
        except ValueError:
            # Manejo de errores si la fecha proporcionada no está en el formato esperado
            ventas = Venta.objects.none()
            # Puedes añadir un mensaje de error o redirigir a una página de error aquí
    else:
        # Si no hay fecha proporcionada, obtener todas las ventas
        ventas = Venta.objects.all()
    
    data = {
        'ventas': ventas,
        'fecha_buscada': fecha_buscada  
    }
    return render(request, 'ventas/list.html', data)

def crear_venta(request):
    if request.method == 'POST':
        form = VentaForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Venta Creada Correctamente')
            return redirect('ventas')
        else:
            messages.error(request, 'Error al crear la venta')
    else:
        form = VentaForm()

    return render(request, 'ventas/add_ventas.html', {'form': form})

def editar_venta(request, venta_id):
    venta = get_object_or_404(Venta, id=venta_id)
    if request.method == 'POST':
        form = VentaForm(request.POST, instance=venta)
        if form.is_valid():
            form.save()
            messages.success(request, 'Venta Editada Correctamente')
            return redirect('ventas')
        else:
            messages.error(request, 'Error al editar la venta')
    else:
        form = VentaForm(instance=venta)

    return render(request, 'ventas/edit_ventas.html', {'form': form, 'venta': venta})

def eliminar_venta(request, venta_id):
    venta = get_object_or_404(Venta, id=venta_id)
    if request.method == 'POST':
        venta.delete()
        messages.success(request, 'Venta Eliminada Correctamente')
        return redirect('ventas')

    return render(request, 'ventas/delete_ventas.html', {'venta': venta})

def formulario_venta(request, producto_id):
    producto = get_object_or_404(Producto, pk=producto_id)
    if request.method == 'POST':
        form = VentaForm(request.POST)
        if form.is_valid():
            venta = form.save(commit=False)
            venta.producto = producto
            venta.save()
            messages.success(request, 'COMPRA REALIZADA CORRECTAMENTE')
            return redirect('home')
    else:
        form = VentaForm(initial={'producto': producto_id})
    
    return render(request, 'ventas/crear_venta.html', {'form': form, 'producto': producto})