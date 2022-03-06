using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        OperacionesBD op = new OperacionesBD();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Globales.busqueda = txtBusqueda.Text;
            Response.Redirect("Index.aspx");
        }

        protected void Login(string mail, string pass)
        {
            Cliente cliente = op.VerificarUsuario(mail, pass);
            if (cliente != null)
            {
                //OBJETO A JSON
                Globales.clienteString = JsonConvert.SerializeObject(cliente, Formatting.Indented);                
                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('No se encontro al usuario');</script>");
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (isValidEmail(txtCorreo.Text))
            {
                Login(txtCorreo.Text, txtContraseña.Text);
                LimpiaCampos();
            }
            else
            {
                Response.Write("<script>alert('El correo no tiene el fomrato correcto');</script>");
            }

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            OperacionesBD op = new OperacionesBD();
            if (isValidEmail(txtCorreoR.Text))
            {
                bool registrado = op.RegistrarUsuario(txtNombre.Text, txtApellidos.Text, txtCelular.Text, txtCorreoR.Text, txtContraseñaR.Text);
                if (registrado)
                {
                    Login(txtCorreoR.Text, txtContraseñaR.Text);
                    LimpiaCampos();
                }
                else
                {
                    LimpiaCampos();
                    Response.Write("<script>alert('Este correo ya esta ocupado por otro usuario');</script>"); 
                }
            }
            else
            {
                Response.Write("<script>alert('El correo no tiene el fomrato correcto');</script>"); 
            }
        }

        protected void LimpiaCampos()
        {
            txtCorreo.Text = "";
            txtContraseña.Text = "";
            txtNombre.Text = "";
            txtApellidos.Text = "";
            txtCorreoR.Text = "";
            txtContraseñaR.Text = "";
            txtCelular.Text = "";
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