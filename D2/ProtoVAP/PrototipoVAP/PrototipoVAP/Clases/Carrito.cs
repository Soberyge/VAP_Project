using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public static class Carrito
    {
        public static ArrayList ListaCarrito = new ArrayList();
        //en proceso
        public static bool ConfirmarCompra(int idcliente, float total)
        {//en base de dato es decimal
            bool confirmado = false;
            OperacionesBD op = new OperacionesBD();
            //Se crea la venta
            string fecha = DateTime.Now.ToString("dd-MM-yyyy");
            op.CreaVentaNueva(Globales.idCliente, fecha, total);

            //se llena el pedido de la venta con los articulos del carrito           
            int i = 0;
            foreach (Producto p in ListaCarrito)
            {
                op.AgrgarProductoVenta(1, ListaCarrito[i++].ToString());

            }

            return confirmado;
        }

        //public static bool EliminarProducto(int indice)
        //{
        //    bool eliminado = false;
        //    ListaCarrito.RemoveAt(indice);

        //    return eliminado;
        //}

        //public static float TotalCarrito()
        //{
        //    float total = 0;
        //    foreach(Producto p in ListaCarrito)
        //    {
        //        total += p.Precio;
        //    }

        //    return total;
        //}

    }
}