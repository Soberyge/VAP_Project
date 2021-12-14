using System;
using System.Collections;
using System.Web.Services;

namespace PrototipoVAP
{
    public partial class Carrito1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetCarrito(ArrayList idArray, float total)
        {
            ConfirmarCompra(idArray, total);
            return "Ok";
        }

        public static void ConfirmarCompra(ArrayList ListaCarrito, float total)
        {//en base de dato es decimal
            //bool confirmado = false;
            OperacionesBD op = new OperacionesBD();
            //Se crea la venta
            string fecha = DateTime.Now.ToString("yyyy-MM-dd");
            op.CreaVentaNueva(Globales.idCliente, fecha, total);

            //se llena el pedido de la venta con los articulos del carrito           
            foreach (string p in ListaCarrito)
            {
                op.AgrgarProductoVenta(1,p);

            }

            //return confirmado;
        }
    }
}