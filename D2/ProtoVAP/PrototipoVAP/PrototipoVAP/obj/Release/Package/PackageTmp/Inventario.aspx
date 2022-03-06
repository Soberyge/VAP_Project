<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="PrototipoVAP.Inventario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="filtrosInventario" class="row">
        
        <%--AGREGAR PRODUCTO--%>
        <div class="AgregarP col-6">
            <button type="button" class="btn btn-primary" style="border-radius:30px;" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Nuevo</button>
            <button type="button" class="btn btn-primary" style="border-radius:30px;" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">Agregar unidades</button>
        </div>

        <%--FILTRAR PRODUCTO--%>
        <div class="FiltrarP col-6 btn-group" role="group">   
            <asp:TextBox id="txtBusquedaInventario" runat="server" style="margin-right:0!important;" CssClass="form-control me-sm-2" placeholder="¿Qué producto busca?"></asp:TextBox>
            <asp:LinkButton OnClick="btnBuscarInventario_Click" runat="server" ID="btnBuscarInventario" CssClass="btn btn-primary" Text="<i class='bi bi-search lead'></i>" />
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
                    <th scope="col"></th>
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
                    <td><a href="#"><i class="bi bi-pencil-fill"></i></a></td>
                </tr>
                <tr class="table-secondary">
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td>Column content</td>
                    <td><a href="#"><i class="bi bi-pencil-fill"></i></a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <%--MODAL--%>
    <div id="modalInventario">
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Agregar nuevo producto</h5>
                        <button type="button" id="btnCerrarmodal" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div id="modalAP" class="modal-body">
                       <h4>Tipo</h4>
                        <div id="radiosBtn" class="modal-element text-center">
                            <asp:RadioButton Value="playera" ID="rdbPlayera" Text=" Playera" GroupName="tipoPrenda" runat="server"/> &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton Value="sudadera" ID="rdbSudadera" Text=" Sudadera" GroupName="tipoPrenda" runat="server"/>
                        </div>                        
                        <h4>Concepto</h4>
                        <asp:TextBox id="txtConcepto" runat="server" placeholder="Concepto" CssClass="form-control modal-element"/>
                        <h4>Marca</h4>
                        <asp:TextBox id="txtMarca" runat="server" placeholder="Marca" CssClass="form-control modal-element"/>
                        <h4>Precio</h4>
                        <asp:TextBox id="txtPrecio" TextMode="Number" runat="server" placeholder="Precio" CssClass="form-control modal-element"/>
                        <h4>Imagen version negro y blanco</h4>
                        <div id="imagenesProducto" class="text-start">
                            <div class="btn-group" role="group">
                                <h6 style="padding-right:10.383px;" >Color negro</h6>
                                <asp:FileUpload CssClass="form-control" ID="fluNegra" runat="server"/>
                            </div>
                            <div class="btn-group" role="group">
                                <h6>Color blanco</h6>
                                <asp:FileUpload CssClass="form-control" ID="fluBlanca" runat="server"/>
                            </div>                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="btnCancelarmodal" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                        <asp:Button runat="server" OnClick="btnAgregarProducto_Click" id="btnAgregarProducto" CssClass="btn btn-primary" Text="Agregar" data-bs-dismiss="modal"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--JS--%>
    <script src="Recursos/js/Inventario.js"></script>
</asp:Content>
