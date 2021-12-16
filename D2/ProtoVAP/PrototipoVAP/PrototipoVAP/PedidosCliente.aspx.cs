using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class PedidosCliente : System.Web.UI.Page
    {
        ArrayList pedidos = new ArrayList();
        string json_pedidos = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            TraerPedidos();
        }

        public void TraerPedidos()
        {
            //se deben llamar los pedidos que se tienen segun la id del cliente
            OperacionesBD op = new OperacionesBD();
            DataSet dst = new DataSet();
            Cliente c = JsonConvert.DeserializeObject<Cliente>(Globales.clienteString);
            dst = op.ObtenerPedidosDelCliente(c.IdCliente);
            bool hayPedidos = false;
            if (dst.Tables[0].Rows.Count > 0)
            { hayPedidos = true; }

            for (int i = 0; (dst.Tables[0].Rows.Count > i) && (hayPedidos); i++)
            {
                //obtenemos datos del pedido            
                ArrayList a = new ArrayList();
                int idPedido = Convert.ToInt32(dst.Tables[0].Rows[i][0]);
                string fecha = dst.Tables[0].Rows[i][1].ToString();
                string total = dst.Tables[0].Rows[i][2].ToString();
                string estado = dst.Tables[0].Rows[i][3].ToString();

                ArrayList productos = new ArrayList();
                for (bool mismoPedido = true; (dst.Tables[0].Rows.Count > i) && (mismoPedido); i++)
                {
                    string talla = dst.Tables[0].Rows[i][4].ToString();
                    string color = dst.Tables[0].Rows[i][5].ToString();
                    string tipo = dst.Tables[0].Rows[i][6].ToString();
                    string concepto = dst.Tables[0].Rows[i][7].ToString();
                    string marca = dst.Tables[0].Rows[i][8].ToString();
                    int precio = Convert.ToInt32(dst.Tables[0].Rows[i][9]);
                    Variantes v = new Variantes(talla, color);
                    Producto prod = new Producto(concepto, tipo, marca, precio, v);
                    productos.Add(prod);
                    if ((dst.Tables[0].Rows.Count - 1) > i)
                        if (idPedido != Convert.ToInt32(dst.Tables[0].Rows[i + 1][0]))
                        {
                            mismoPedido = false;
                        }
                }
                pedidos.Add(new Pedido(idPedido, fecha, total, estado, productos));
                i--;
            }

            json_pedidos = JsonConvert.SerializeObject(pedidos, Formatting.Indented);
        }

        //MANDAR PEDIDOS A LA VISTA
        protected string ListaPedidos { get { return json_pedidos; } }

        //ZONA DE PETICIONES AJAX
        [System.Web.Services.WebMethod]
        public static string CancelarPedido(int idPedido)
        {
            Cliente c = JsonConvert.DeserializeObject<Cliente>(Globales.clienteString);
            OperacionesBD op = new OperacionesBD();
            op.CancelarPedido(c.IdCliente, idPedido);         
            return "Pedido Cancelado con éxito"; 
        }
    }
}