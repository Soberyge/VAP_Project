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

</asp:Content>
