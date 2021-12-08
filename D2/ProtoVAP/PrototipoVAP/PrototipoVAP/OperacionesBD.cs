using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PrototipoVAP
{
    public class OperacionesBD
    {
        public bool VerificarUsuario()
        {
            bool existe = false;

            return existe;
        }
        public bool VerificarAdmin()
        {
            bool existe = false;

            return existe;
        }

        public bool RegistrarUsuario()
        {
            bool registrado = false;

            return registrado;
        }


        public bool EditarInfoUsuario()
        {
            bool editado = false;


            return editado;
        }

       public DataSet ObtenerCatalogo(string filtro, int tipo, int orden)//este no se si es mejor como datatable
        {
            string query = "SELECT * FROM producto";
            if (filtro != "")
            {
                query += " where txt_concepto_prenda like '%"+filtro+ "%' or txt_tipo_prenda like '%"+filtro +"'";
            }
            switch (tipo)
            {
                case 0:                    
                    break;
                case 1:
                    query += " where txt_tipo_prenda = 'sudadera'";
                    break;
                case 2:
                    query += " where txt_tipo_prenda = 'playera'";
                    break;
            }
            //0 es decendente, 1 es ascendente
          //  query += (orden == 0) ? " order by dec_precio_prenda desc" : " order by dec_precio_prenda asc";

            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);            
            cnx.Close();                      

            return dst;
        }
/* 
        public DataSet ObtenerInventario(string filtro)//este no se si es mejor como datatable
        {
            string consulta = "";
            DataSet dst;

            return dst;
        }
        public DataSet ObtenerPedidosClientes(string filtro)//este no se si es mejor como datatable
        {
            string consulta = "";
            DataSet dst;

            return dst;
        }
        public DataSet ObtenerHistorialVentas(string filtro)//este no se si es mejor como datatable
        {
            string consulta = "";
            DataSet dst;

            return dst;
        }*/

    }
}