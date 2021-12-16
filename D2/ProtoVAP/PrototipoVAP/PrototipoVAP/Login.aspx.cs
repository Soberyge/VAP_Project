using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            OperacionesBD op = new OperacionesBD();
            if (isValidEmail(txtPass.Text))
            {
                bool acceso = op.VerificarUsuario(txtUser.Text, txtPass.Text);
                if (acceso)
                {
                    Label1.Text = "existe";
                }
                else
                {
                    Label1.Text = "no existe";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OperacionesBD op = new OperacionesBD();
            if (isValidEmail(txtMail.Text))
            {
               bool registrado = op.RegistrarUsuario(txtNombre.Text, txtApe.Text, txtCel.Text, txtMail.Text, txtPassReg.Text);
                if (registrado)
                {
                    Label1.Text = "Se a registrado con exito";
                }
                else
                {
                    Label1.Text = "Este correo ya esta ocupado por otro usuario";
                }
            }
            else
            {
                Label1.Text = "El correo no tiene el fomrato correcto";
            }
        }
        public bool isValidEmail(string inputEmail)
        {
            string strRegex = @"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$";
            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputEmail))
                return (true);
            else
                return (false);
        }
    }
}