<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="PrototipoVAP.Catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="head-catalogo" class="row">
        
        <%--FILTROS--%>
        <div class="col-6">
            <div id="filtros" class="btn-group col-2" role="group">
                <button disabled type="button" style="border-radius:0!important;" class="btn btn-primary">Tipo</button>
                <button id="btnGroupDrop1" type="button" style="border-radius:0!important;" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 50px);" data-popper-placement="bottom-start">
                    <a id="fltTodo" class="dropdown-item" href="#">Todo</a>
                    <a id="fltSudadera" class="dropdown-item" href="#">Sudadera</a>
                    <a id="fltPlayera" class="dropdown-item" href="#">Playera</a>
                </div>
            </div>
        </div>

        <%--ORDER BY--%>
        <div class="col-6">
            <div id="order_by" class="btn-group" role="group">
                <button disabled type="button" style="border-radius:0!important;" class="btn btn-primary">Ordenar por</button>
                <button id="btnGroupDrop2" type="button" style="border-radius:0!important;" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a id="odbMenor" class="dropdown-item" href="#">Menor precio</a>
                    <a id="odbMayor" class="dropdown-item" href="#">Mayor precio</a>
                </div>
            </div>
        </div>        
    </div>

    <div id="catalogo">
        <%--CARDS--%>         
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Detalles del producto</h5>
                    <button type="button" id="btnCerrarmodal" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                            <img id="modalImg" src="#" class="img-fluid" alt="<imagen>">
                        </div>
                        <div class="col-6">
                            <h6 id="modalTyC"></h6>
                            <h4 id="modalPrecio" style="margin-bottom:30px;"></h4>
                            <input type="radio" class="btn-check" name="talla" id="rbCH" autocomplete="off">
                            <label id="rbChico" class="radioTalla" for="rbCH">CH</label>
                            <input type="radio" class="btn-check" name="talla" id="rbM" autocomplete="off">
                            <label id="rbMediano" class="radioTalla" for="rbM">M</label>
                            <input type="radio" class="btn-check" name="talla" id="rbG" autocomplete="off">
                            <label id="rbGrande" class="radioTalla" for="rbG">G</label>
                            <input type="radio" class="btn-check" name="talla" id="rbEG" autocomplete="off">
                            <label id="rbExtraGrande" class="radioTalla" for="rbEG">EG</label>
                            <h6 style="margin-top:30px;">Color</h6>
                            <input type="radio" class="btn-check color" name="color" id="rbNegro" autocomplete="off">
                            <label id="rbN" for="rbNegro">N</label>
                            <input type="radio" class="btn-check color" name="color" id="rbBlanco" autocomplete="off">
                            <label id="rbB" for="rbBlanco">B</label>
                            <h6 id="existencias" style="margin-top:30px;"></h6>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancelarmodal" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" disabled id="btnAgregarCarrito" class="btn btn-primary" data-bs-dismiss="modal">Agregar al carrito</button>
                </div>
            </div>
        </div>
    </div>

    <%--JS--%>
    <script type="text/javascript">
        const productos = <%= ListaProductos %>;
    </script>
    <script src="Recursos/js/Catalogo.js"></script>

</asp:Content>
