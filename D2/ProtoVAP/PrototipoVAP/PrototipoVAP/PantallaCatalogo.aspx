<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PantallaCatalogo.aspx.cs" Inherits="PrototipoVAP.PantallaCatalogo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtBuscar" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Button" />
            <br />
            Tipo<asp:DropDownList ID="ddlTipo" runat="server">
                <asp:ListItem Value="0">Todo</asp:ListItem>
                <asp:ListItem Value="1">Sudaderas</asp:ListItem>
                <asp:ListItem Value="2">Playeras</asp:ListItem>
            </asp:DropDownList>
            <br />
            Orden<asp:DropDownList ID="ddlOrden" runat="server">
                <asp:ListItem Value="0">Descendente</asp:ListItem>
                <asp:ListItem Value="1">Ascendente</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:GridView ID="gdvCatalgo" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
