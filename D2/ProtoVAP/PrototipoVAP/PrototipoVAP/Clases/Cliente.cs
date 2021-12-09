using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Cliente
    {
        private string usuario;
        private string correo;
        private string direccion;

        public Cliente(string usuario, string correo, string direccion)
        {
            this.usuario = usuario;
            this.correo = correo;
            this.direccion = direccion;
        }

        public string Usuario { get => usuario; set => usuario = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Direccion { get => direccion; set => direccion = value; }

    }
}