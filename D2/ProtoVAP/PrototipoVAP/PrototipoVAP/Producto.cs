using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Producto
    {
        int id;
        int id2;
        string concepto;
        int precio;
        string tipo;
        string talla;
        string color;
        int cantidad;
        string imgNegro;
        string imgBlanco;

        public Producto(int id, string concepto, string tipo, int precio, string imgBlanco)
        {
            this.id = id;
            this.concepto = concepto;
            this.precio = precio;
            this.tipo = tipo;
            this.imgBlanco = imgBlanco;
        }

        public Producto(int id, int id2, string concepto, int precio, string tipo, string talla, string color, int cantidad, string imgNegro, string imgBlanco)
        {
            this.id = id;
            this.id2 = id2;
            this.concepto = concepto;
            this.precio = precio;
            this.tipo = tipo;
            this.talla = talla;
            this.color = color;
            this.cantidad = cantidad;
            this.imgNegro = imgNegro;
            this.imgBlanco = imgBlanco;
        }

        public int Id { get => id; set => id = value; }
        public int Id2 { get => id2; set => id2 = value; }
        public string Concepto { get => concepto; set => concepto = value; }
        public int Precio { get => precio; set => precio = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public string Talla { get => talla; set => talla = value; }
        public string Color { get => color; set => color = value; }
        public int Cantidad { get => cantidad; set => cantidad = value; }
        public string ImgNegro { get => imgNegro; set => imgNegro = value; }
        public string ImgBlanco { get => imgBlanco; set => imgBlanco = value; }

        

        public bool GuardarProducto()
        {
            bool guardado = false;


            return guardado;
        }

        public override string ToString()
        {
            
            string r = id + " " + id2 + " " + concepto + " " + precio + " " + tipo+ " " + talla + " " + color + " " + cantidad + " " + imgNegro + " " + imgBlanco; ;
            return  r;
        }
    }

}