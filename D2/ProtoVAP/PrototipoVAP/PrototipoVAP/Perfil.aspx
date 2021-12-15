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
                        <button type="button" style="display:none;" class="btn btn-danger" id="btnCancelarEdicion">Cancelar</button>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <button type="button" class="btn btn-primary" id="btnEditarPerfil">Editar</button>
                    <asp:Button runat="server" style="display:none;" CssClass="btn btn-success" ID="btnGuardarInfo" Text="Guardar" OnClick="btnGuardarInfo_Click" />
                </div>
            </div>            
        </div>
    </div>    

    <%--JS--%>
    <script src="Recursos/js/Perfil.js"></script>

</asp:Content>
