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

        public DataSet ObtenerInfoCliente()
        {
            string query = "select txt_nombre_cliente, " +
                            "txt_apellidos_cliente, " +
                            "int_celular_cliente, " +
                            "txt_correo_cliente " +
                            "from cliente";
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);
            cnx.Close();

            return dst;
        }


        public bool EditarInfoUsuario()
        {
            bool editado = false;


            return editado;
        }

        public bool CrearProducto(string tipo, string concepto, string marca, int precio, byte[] imgB, byte[] imgN, string estado)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CrearProducto";
                cmd.Parameters.Add("@txt_tipo_prenda", SqlDbType.VarChar).Value = tipo;
                cmd.Parameters.Add("@txt_concepto_prenda", SqlDbType.VarChar).Value = concepto;
                cmd.Parameters.Add("@txt_marca_prenda", SqlDbType.VarChar).Value = marca;
                cmd.Parameters.Add("@dec_precio_prenda", SqlDbType.Decimal).Value = precio;
                cmd.Parameters.Add("@img_blanco_prenda", SqlDbType.Image).Value = imgB;
                cmd.Parameters.Add("@img_negro_prenda", SqlDbType.Image).Value = imgN;
                cmd.Parameters.Add("@txt_estado_prenda", SqlDbType.VarChar).Value = estado;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }

            return ok;
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

        public DataSet ObtenerInventario(string filtro)//este no se si es mejor como datatable
        {
            string query = "select producto.id_prenda as 'ID', " +
                "producto.txt_tipo_prenda as 'Tipo'," +
                "producto.txt_concepto_prenda as 'Concepto', " +
                "producto.txt_marca_prenda as 'Marca', " +
                "variantes_producto.txt_color_prenda as 'Color', " +
                "variantes_producto.txt_talla_prenda as 'Talla', " +
                "variantes_producto.int_cantidad_prenda as 'Cantidad'," +
                "producto.txt_estado_prenda as 'Estado'" +
                "from producto join variantes_producto " +
                "on producto.id_prenda = variantes_producto.id_prenda";

            if (filtro != "") 
            { query += " where producto.txt_concepto_prenda like '%" + filtro + "%' or producto.id_prenda = "+ filtro ; }
            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);
            
            adp.Fill(dst);
            cnx.Close();

            return dst;
        }
        public DataSet ObtenerPedidosClientes(string filtro)//este no se si es mejor como datatable
        {
            string query = "";

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }
        public DataSet ObtenerHistorialVentas(string filtro)//este no se si es mejor como datatable
        {
            string query = "";

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }


    }
}