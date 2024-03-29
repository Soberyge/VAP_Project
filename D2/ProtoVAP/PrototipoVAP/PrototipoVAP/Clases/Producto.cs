﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Producto
    {
        private int id;
        private string concepto;
        private decimal precio;
        private string tipo;
        private string marca;
        private string imgNegro;
        private string imgBlanco;
        private ArrayList variantes;
        private Variantes variante;

        public Producto(string concepto, string tipo, string marca, int precio, Variantes variante)
        {

            this.concepto = concepto;
            this.precio = precio;
            this.tipo = tipo;
            this.marca = marca;
            this.variante = variante;

        }

        public Producto(int id, string concepto, string tipo, string marca, decimal precio, string imgBlanco, string imgNegro)
        {
            this.id = id;
            this.concepto = concepto;
            this.precio = precio;
            this.tipo = tipo;
            this.marca = marca;
            this.imgBlanco = imgBlanco;
            this.ImgNegro = imgNegro;

        }
        public Producto(int id, string concepto, string tipo, string marca, decimal precio, string imgBlanco, string imgNegro, ArrayList v)
        {
            this.id = id;
            this.concepto = concepto;
            this.precio = precio;
            this.tipo = tipo;
            this.marca = marca;
            this.imgBlanco = imgBlanco;
            this.ImgNegro = imgNegro;
            this.variantes = v;
        }

        public int Id { get => id; set => id = value; }
        public string Concepto { get => concepto; set => concepto = value; }
        public decimal Precio { get => precio; set => precio = value; }
        public string Tipo { get => tipo; set => tipo = value; }
        public string Marca { get => marca; set => marca = value; }
        public string ImgNegro { get => imgNegro; set => imgNegro = value; }
        public string ImgBlanco { get => imgBlanco; set => imgBlanco = value; }
        public ArrayList Variantes { get => variantes; set => variantes = value; }
        public Variantes Variante { get => variante; set => variante = value; }

        public bool GuardarProducto()
        {
            bool guardado = false;


            return guardado;
        }

        public override string ToString()
        {

            string r = id + " " + " " + concepto + " " + precio + " " + tipo + " " + imgNegro + " " + imgBlanco; ;
            return r;
        }
    }

}