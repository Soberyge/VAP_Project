<%@ Page Title="" Language="C#" MasterPageFile="~/Recursos/Master Page/MasterPageCliente.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="PrototipoVAP.Catalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="head-catalogo" class="row">
        
        <%--FILTROS--%>
        <div class="col-6">
            <div id="filtros" class="btn-group col-2" role="group">
                <button disabled type="button" class="btn btn-primary">Tipo</button>
                <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
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
                <button disabled type="button" class="btn btn-primary">Ordenar por</button>
                <button id="btnGroupDrop2" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
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
                            <img id="modalImg" src="Recursos/Imagenes/VAP_Logo.png" class="img-fluid" alt="<imagen>">
                        </div>
                        <div class="col-6">
                            <h6 id="modalTyC"></h6>
                            <h4 id="modalPrecio" style="margin-bottom:30px;"></h4>
                            <input type="radio" class="btn-check talla" name="options1" id="rbCH" autocomplete="off">
                            <label class="btn btn-dark" style="margin-left:20px;" for="rbCH">CH</label>
                            <input type="radio" class="btn-check talla" name="options1" id="rbM" autocomplete="off">
                            <label class="btn btn-dark" for="rbM">M</label>
                            <input type="radio" class="btn-check talla" name="options1" id="rbG" autocomplete="off">
                            <label class="btn btn-dark" for="rbG">G</label>
                            <input type="radio" class="btn-check talla" name="options1" id="rbEG" autocomplete="off">
                            <label class="btn btn-dark" for="rbEG">EG</label>
                            <h6 style="margin-top:30px;">Color</h6>
                            <input type="radio" class="btn-check color" name="options2" id="rbNegro" autocomplete="off">
                            <label id="rbN" class="btn color" for="rbNegro">N</label>
                            <input type="radio" class="btn-check color" name="options2" id="rbBlanco" autocomplete="off">
                            <label id="rbB" class="btn" for="rbBlanco">B</label>
                            <h6 id="existencias" style="margin-top:30px;"></h6>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnCancelarmodal" class="btn btn-danger" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" disabled id="btnAgregarCarrito" class="btn btn-primary">Agregar al carrito</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        const productos = <%= MyProperty %>;
    </script>
</asp:Content>
