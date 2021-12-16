<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PrototipoVAP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usuario:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            <br />
            Contraseña:
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
            registrar<br />
            nombre<asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            apellido<asp:TextBox ID="txtApe" runat="server"></asp:TextBox>
            <br />
            cel<asp:TextBox ID="txtCel" runat="server"></asp:TextBox>
            <br />
            correo<asp:TextBox ID="txtMail" runat="server"></asp:TextBox>
            <br />
            contraseña<asp:TextBox ID="txtPassReg" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Registrar" />
        </div>
    </form>
</body>
</html>
