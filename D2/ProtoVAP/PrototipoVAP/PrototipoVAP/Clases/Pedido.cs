using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Pedido
    {
        int idPedido;
        string fecha;
        string total;
        string estado;
        ArrayList producto;

        public Pedido(int idPedido, string fecha, string total, string estado, ArrayList producto)
        {
            this.idPedido = idPedido;
            this.fecha = fecha;
            this.total = total;
            this.estado = estado;
            this.producto = producto;
        }

        public int IdPedido { get => idPedido; set => idPedido = value; }
        public string Fecha { get => fecha; set => fecha = value; }
        public string Total { get => total; set => total = value; }
        public string Estado { get => estado; set => estado = value; }
        public ArrayList Producto { get => producto; set => producto = value; }


    }

}