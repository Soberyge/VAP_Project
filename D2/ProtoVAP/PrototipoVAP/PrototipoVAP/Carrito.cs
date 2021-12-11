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
            foreach(Producto p in lista)
            {


            }

            return confirmado;
        }

        public static bool EliminarProducto(int indice)
        {
            bool eliminado = false;
            lista.RemoveAt(indice);

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