const nombre = document.getElementById('txtNombreC');
const apellidos = document.getElementById('txtApellidosC');
const celular = document.getElementById('txtCelularC');
const correo = document.getElementById('txtCorreoC');
const btnCancelar = document.getElementById('btnCancelarEdicion');
const btnEditar = document.getElementById('btnEditarPerfil');
const btnGuardar = document.getElementById('btnGuardarInfo');

//funcion para ingresar las propiedades del cliente en los textbox

function renderPerfil() {
    let clienteLocal = JSON.parse(cliente);

    nombre.text = clienteLocal.Nombre;
    nombre.readOnly = true;
    apellidos.text = clienteLocal.Apellidos;
    apellidos.readOnly = true;
    celular.text = clienteLocal.Celular;
    celular.readOnly = true;
    correo.text = clienteLocal.Correo;
    correo.readOnly = true;
}

//acciones a realizar al dar clic en el boton editar
btnEditar.onclick = () => {
    nombre.readOnly = false;
    apellidos.readOnly = false;
    celular.readOnly = false;
    correo.readOnly = false;
    btnCancelar.style.display = "block";
    btnGuardar.style.display = "block";
    btnEditar.style.display = "none";
}

//acciones a realizar al dar clic en el boton cancelar
btnCancelar.onclick = () => {
    renderPerfil()
    btnCancelar.style.display = "none";
    btnGuardar.style.display = "none";
    btnEditar.style.display = "block";
}