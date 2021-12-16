using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod]
        public static string GuardarInfo(string nombre, string apellidos, string celular, string correo)
        {
            string res = "";
            Cliente c = JsonConvert.DeserializeObject<Cliente>(Globales.clienteString);
            OperacionesBD op = new OperacionesBD();
            if(op.EditarInfoUsuario(c.IdCliente, nombre, apellidos, celular, correo))
            {
                DataSet dst = op.ObtenerInfoCliente(c.IdCliente);
                Cliente cliente = new Cliente
                {
                    IdCliente = c.IdCliente,
                    Nombre = dst.Tables[0].Rows[0][0].ToString(),
                    Apellidos = dst.Tables[0].Rows[0][1].ToString(),
                    Celular = Convert.ToInt64(dst.Tables[0].Rows[0][2]),
                    Correo = dst.Tables[0].Rows[0][3].ToString()
                };

                Globales.clienteString = JsonConvert.SerializeObject(cliente, Formatting.Indented);
                res = "Los datos se editaron correctamente";
            }
            return res;
        }
    }
}