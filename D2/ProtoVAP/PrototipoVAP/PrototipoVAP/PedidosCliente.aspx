<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="PedidosCliente.aspx.cs" Inherits="PrototipoVAP.PedidosCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="tituloPedidos" class="row mb-3"></div>
    <div id="pedidos" class=""><%--PEDIDOS--%></div>
     <%--JQuery--%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%--JS--%>
    <script type="text/javascript">
        const pedidos = <%= ListaPedidos %>;
    </script>
    <script src="Recursos/js/PedidoC.js"></script>
</asp:Content>
