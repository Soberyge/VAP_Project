<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="PrototipoVAP.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Estructura del Perfil--%>
    <div id="perfil-content">
        <div class="form-group">            
            <div class="mb-3">
                <h3>Nombre</h3>
                <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtNombreC"></asp:TextBox>
            </div>
            <div class="mb-3">
                <h3>Apellidos</h3>
                <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtApellidosC"></asp:TextBox>
            </div>
            <div class="mb-3">
                <h3>Celular</h3>
                <asp:TextBox runat="server" ReadOnly="true" TextMode="Phone" CssClass="form-control" ID="txtCelularC"></asp:TextBox>
            </div>
            <div class="mb-3">
                <h3>Correo</h3>
                <asp:TextBox runat="server" ReadOnly="true" TextMode="Email" CssClass="form-control" ID="txtCorreoC"></asp:TextBox>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="text-center">
                        <button type="button" style="display:none;" onclick="Cancelar()" class="btn btn-danger" id="btnCancelarEdicion">Cancelar</button>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <button type="button" class="btn btn-primary" onclick="Editar()" id="btnEditarPerfil">Editar</button>
                    <button style="display:none;" class="btn btn-success" id="btnGuardarInfo" onclick="Guardar()">Guardar</button>
                </div>
            </div>            
        </div>
    </div>    

    <%--JS--%>
    <script defer="defer">

        const nombre = document.getElementById('<%=txtNombreC.ClientID%>');
        const apellidos = document.getElementById('<%=txtApellidosC.ClientID%>');
        const celular = document.getElementById('<%=txtCelularC.ClientID%>');
        const correo = document.getElementById('<%=txtCorreoC.ClientID%>');
        const btnCancelar = document.getElementById('btnCancelarEdicion');
        const btnEditar = document.getElementById('btnEditarPerfil');
        const btnGuardar = document.getElementById('btnGuardarInfo');

        //funcion para ingresar las propiedades del cliente en los textbox

        const renderPerfil = () => {
            if (cliente !== "") {
                const clienteLocal = JSON.parse(cliente);
                nombre.value = clienteLocal.Nombre;
                nombre.textContent = clienteLocal.Nombre;
                nombre.readOnly = true;
                apellidos.value = clienteLocal.Apellidos;
                apellidos.readOnly = true;
                celular.value = clienteLocal.Celular;
                celular.readOnly = true;
                correo.value = clienteLocal.Correo;
                correo.readOnly = true;
            }            
        }

        //acciones a realizar al dar clic en el boton editar
        function Editar() {
            nombre.readOnly = false;
            apellidos.readOnly = false;
            celular.readOnly = false;
            correo.readOnly = false;
            btnCancelar.style.display = "block";
            btnGuardar.style.display = "block";
            btnEditar.style.display = "none";
        }

        //acciones a realizar al dar clic en el boton cancelar
        function Cancelar() {
            renderPerfil()
            btnCancelar.style.display = "none";
            btnGuardar.style.display = "none";
            btnEditar.style.display = "block";
        }

        function Guardar() {
            if (
                nombre.value !== "" &&
                apellidos.value !== "" &&
                celular.value !== "" &&
                correo.value !== ""
            ) {
                let data = {
                    nombre: nombre.value,
                    apellidos: apellidos.value,
                    celular: celular.value,
                    correo: correo.value
                }
                ActualizarCliente(data).then((data) => {
                    alert(data.d)
                    return false;
                })
            } else {
                alert("Todos los campos son necesarios")
            } 
        }

        async function ActualizarCliente(data) {
            let result
            try {
                result = await $.ajax({
                    type: "POST",
                    url: "Perfil.aspx/GuardarInfo",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true
                });
                return result
            } catch (error) {
                alert(error)
            }
        }

        let timerId = setInterval(renderPerfil, 500);
        setTimeout(() => clearInterval(timerId), 2000);

    </script>

</asp:Content>
