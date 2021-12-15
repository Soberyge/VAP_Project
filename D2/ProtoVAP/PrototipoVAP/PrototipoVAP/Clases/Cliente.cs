using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class Cliente
    {
        private int idCliente;
        private string nombre;
        private string apellidos;
        private Int64 celular;
        private string correo;

        public Cliente() { }

        public Cliente(int idCliente, string nombre, string apellidos, Int64 celular, string correo)
        {
            this.idCliente = idCliente;
            this.nombre = nombre;
            this.apellidos = apellidos;
            this.celular = celular;
            this.correo = correo;
        }

        public int IdCliente { get => idCliente; set => idCliente = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellidos { get => apellidos; set => apellidos = value; }
        public Int64 Celular { get => celular; set => celular = value; }
        public string Correo { get => correo; set => correo = value; }
    }
}