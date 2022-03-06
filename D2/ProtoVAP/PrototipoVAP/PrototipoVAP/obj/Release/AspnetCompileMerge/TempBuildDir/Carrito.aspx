<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="PrototipoVAP.Carrito1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="header-carrito" class="row">
        <%--Titulo--%>
        <div class="col-6">
            <h1 id="TituloCarrito"></h1>
        </div>
        <%--Total Carrito--%>
        <div class="col-6">
            <h1 id="TotalCarrito"></h1>
        </div>
    </div>

    <div id="carrito" style="margin:0px 80px;">
        <%--Productos--%>               
    </div>

    <div id="confirmarPedido" style="visibility:hidden;" class="text-center">
        <button id="btnConfirmarPedido" style="border-radius:30px;" class="btn btn-primary">Confirmar pedido</button>
    </div>

    <%--JS--%>
    <script type="module" src="Recursos/js/Carrito.js"></script>

</asp:Content>
