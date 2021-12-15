using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
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
            Response.Redirect("Catalogo.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Cliente cliente = op.VerificarUsuario(txtCorreo.Text, txtContraseña.Text);
            if (cliente != null)
            {
                Session["IdCliente"] = cliente.IdCliente;
                //OBJETO A JSON
                Globales.clienteString = JsonConvert.SerializeObject(cliente, Formatting.Indented);
                Response.Redirect("Catalogo.aspx");
            }
            else
            {

            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {

        }
    }
}