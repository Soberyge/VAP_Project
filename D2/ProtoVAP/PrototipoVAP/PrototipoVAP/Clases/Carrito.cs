using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public static class Carrito
    {
        public static ArrayList lista = new ArrayList();

        public static bool ConfirmarCompra(){
            bool confirmado = false;


            return confirmado;
        }

        public static bool EliminarProducto()
        {
            bool eliminado = false;

            return eliminado;
        }

        public static int TotalCarrito()
        {
            int total = 0;
            foreach(Producto p in lista)
            {
                total += p.Precio;
            }

            return total;
        }

    }
}