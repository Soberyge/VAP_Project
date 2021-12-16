<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="PrototipoVAP.AgregarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            tipo<asp:TextBox ID="txtTipo" runat="server"></asp:TextBox>
            <br />
            concepto<asp:TextBox ID="txtConcepto" runat="server"></asp:TextBox>
            <br />
            marca<asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
            <br />
            precio<asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <br />
            <br />
            Imgen blanca<asp:FileUpload ID="fluBlanca" runat="server" />
            <asp:Label ID="lblBlanca" runat="server"></asp:Label>
            <br />
            Imagen negra<asp:FileUpload ID="fluNegra" runat="server" />
            <asp:Label ID="lblNegra" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Height="26px" />
            <br />
            <br />
            <br />
            <asp:GridView ID="gvdInventario" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
