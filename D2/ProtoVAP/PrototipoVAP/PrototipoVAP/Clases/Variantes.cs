using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Variantes
    {
        private string idVariante;
        private string talla;
        private string color;
        private int cantidad;

        public Variantes(string talla, string color)
        {
            this.talla = talla;
            this.color = color;
        }
        public Variantes()
        {

        }
        public Variantes(string idVariante, string talla, string color, int cantidad)
        {
            this.idVariante = idVariante;
            this.talla = talla;
            this.color = color;
            this.cantidad = cantidad;

        }

        public string IdVariante { get => idVariante; set => idVariante = value; }
        public string Talla { get => talla; set => talla = value; }
        public string Color { get => color; set => color = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }

    }
}