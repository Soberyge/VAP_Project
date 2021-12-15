<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="PrototipoVAP.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <asp:Button runat="server" style="display:none;" CssClass="btn btn-success" ID="btnGuardarInfo" Text="Guardar" OnClientClick="return validarCampos()" OnClick="btnGuardarInfo_Click" />
                </div>
            </div>            
        </div>
    </div>    

    <%--JS--%>
    <script type="text/javascript">
        const nombre = document.getElementById('<%=txtNombreC.ClientID%>');
        const apellidos = document.getElementById('<%=txtApellidosC.ClientID%>');
        const celular = document.getElementById('<%=txtCelularC.ClientID%>');
        const correo = document.getElementById('<%=txtCorreoC.ClientID%>');
        const btnCancelar = document.getElementById('btnCancelarEdicion');
        const btnEditar = document.getElementById('btnEditarPerfil');
        const btnGuardar = document.getElementById('<%=btnGuardarInfo.ClientID%>');

        //funcion para ingresar las propiedades del cliente en los textbox

        function renderPerfil() {
            const clienteLocal = JSON.parse(cliente);

            nombre.value = clienteLocal.Nombre;
            nombre.readOnly = true;
            apellidos.value = clienteLocal.Apellidos;
            apellidos.readOnly = true;
            celular.value = clienteLocal.Celular;
            celular.readOnly = true;
            correo.value = clienteLocal.Correo;
            correo.readOnly = true;
        }

        //acciones a realizar al dar clic en el boton editar
        function Editar() {
            renderPerfil()
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

        function validarCampos() {
            let res = false
            if (
                nombre.value !== "" &&
                apellidos.value !== "" &&
                celular.value !== "" &&
                correo.value !== ""
            ) res = true
            else {
                alert("Campos necesarios")
            }
            return res
        }
    </script>

</asp:Content>
