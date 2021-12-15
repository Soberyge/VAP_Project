using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class PedidosCliente : System.Web.UI.Page
    {
        string json = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //MANDAR PEDIDOS A LA VISTA
        protected string ListaPedidos { get { return json; } }

        //ZONA DE PETICIONES AJAX
        [System.Web.Services.WebMethod]
        public static string CancelarPedido(int idPedido)
        {
            return "Pedido Cancelado con éxito";
        }
    }
}