<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="PrototipoVAP.Inventario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="filtrosInventario" class="row">
        
        <%--AGREGAR PRODUCTO--%>
        <div class="AgregarP col-6">
            <button type="button" class="btn btn-primary">Primary</button>
        </div>

        <%--FILTRAR PRODUCTO--%>
        <div class="FiltrarP col-6">
            <asp:TextBox id="txtBusquedaInventario" runat="server" CssClass="form-control me-sm-2" placeholder="¿Qué producto busca?"></asp:TextBox>
        </div>
    </div>

    <%--TABLA--%>
    <div id="tablaInventario">
        <table class="table table-hover text-center">
            <thead>
                <tr class="table-dark">
                    <th scope="col">Tipo</th>
                    <th scope="col">Concepto</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Variantes</th>
                </tr>
            </thead>
            <tbody>                
                <tr class="table-primary">
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                </tr>
                <tr class="table-secondary">
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
