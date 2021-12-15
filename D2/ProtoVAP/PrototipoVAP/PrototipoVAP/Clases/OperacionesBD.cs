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
        //Usuarios---------------------
        public Cliente VerificarUsuario(string correo, string pass)
        {
            Cliente cliente = new Cliente();

            DataSet dst = new DataSet();
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "ComprobarPass";
                cmd.Parameters.Add("@correo", SqlDbType.VarChar).Value = correo;
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.Connection = con;
                con.Open();
                sda.Fill(dst);
                con.Close();
            }
            if (dst.Tables[0].Rows[0][6].ToString() == pass)
            { 
                cliente.IdCliente = Convert.ToInt32(dst.Tables[0].Rows[0][0]);
                cliente.Nombre = dst.Tables[0].Rows[0][1].ToString();
                cliente.Apellidos = dst.Tables[0].Rows[0][2].ToString();
                cliente.Celular = Convert.ToInt64(dst.Tables[0].Rows[0][3]);
                cliente.Correo = dst.Tables[0].Rows[0][4].ToString();
            }

            return cliente;
        }
        public bool VerificarAdmin()
        {
            bool existe = false;

            return existe;
        }

        public bool RegistrarUsuario(string nombre, string apellido, string tel, string correo, string pass)
        {
            bool registrado = false;
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CrearProducto";
                cmd.Parameters.Add("@nombre_cliente", SqlDbType.Int).Value = nombre;
                cmd.Parameters.Add("@apellidos_cliente", SqlDbType.VarChar).Value = apellido;
                cmd.Parameters.Add("@celular_cliente", SqlDbType.VarChar).Value = tel;
                cmd.Parameters.Add("@correo_cliente", SqlDbType.BigInt).Value = correo;
                cmd.Parameters.Add("@contraseña_cliente", SqlDbType.VarChar).Value = pass;

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                registrado = true;
            }
            return registrado;
        }

        public DataSet ObtenerInfoCliente(int idCliente)
        {
            string query = "select txt_nombre_cliente, " +
                            "txt_apellidos_cliente, " +
                            "int_celular_cliente, " +
                            "txt_correo_cliente " +
                            "from cliente" +
                            "where id_cliente ='" + idCliente + "'";
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);
            cnx.Close();

            return dst;
        }


        public bool EditarInfoUsuario(int idcliente, string nom, string ape, string cel, string correo)
        {
            bool editado = false;
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CrearProducto";
                cmd.Parameters.Add("@idcliente", SqlDbType.Int).Value = idcliente;
                cmd.Parameters.Add("@nomCliente", SqlDbType.VarChar).Value = nom;
                cmd.Parameters.Add("@ApeCliente", SqlDbType.VarChar).Value = ape;
                cmd.Parameters.Add("@celClietne", SqlDbType.BigInt).Value = cel;
                cmd.Parameters.Add("@correoCliente", SqlDbType.VarChar).Value = correo;

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                editado = true;
            }

            return editado;
        }

        public DataSet ObtenerPedidosDelCliente(int idCliente)//pendiente
        {
            string query = "Select * from variantes_producto where id_prenda = ";

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }

        //Cosas de productos------------------------------
        public bool CrearProducto(string tipo, string concepto, string marca, int precio, string imgB, string imgN, string estado)
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
                cmd.Parameters.Add("@img_blanco_prenda", SqlDbType.VarChar).Value = imgB;
                cmd.Parameters.Add("@img_negro_prenda", SqlDbType.VarChar).Value = imgN;
                cmd.Parameters.Add("@txt_estado_prenda", SqlDbType.VarChar).Value = estado;
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }

            return ok;
        }

        public DataSet ObtenerVariante(int idProducto)
        {
            string query = "Select * from variantes_producto where id_prenda = " + idProducto;

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }



        public bool CrearVariante(int idprenda, string color, string talla, int cantidad)
        {
            bool ok = false;
            string idvariante = idprenda + talla + color;

            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CrearProducto";
                cmd.Parameters.Add("@txt_color_prenda", SqlDbType.VarChar).Value = color;
                cmd.Parameters.Add("@txt_talla_prenda", SqlDbType.VarChar).Value = talla;
                cmd.Parameters.Add("@int_cantidad_prenda", SqlDbType.Int).Value = cantidad;
                cmd.Parameters.Add("@idVariante", SqlDbType.VarChar).Value = idvariante;
                cmd.Parameters.Add("@idprenda", SqlDbType.Int).Value = idprenda;

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }
            return ok;
        }

        public DataSet ObtenerCatalogo(string filtro)//este no se si es mejor como datatable
        {
            string query = "SELECT * FROM producto where txt_estado_prenda = 'vigente' ";
            if (filtro != "")
            {
                query += " and txt_concepto_prenda like '%" + filtro + "%' or txt_tipo_prenda like '%" + filtro + "'";
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
                "producto.txt_estado_prenda as 'Estado'," +
                "producto.dec_precio_prenda as 'Precio' " +
                "from producto;";

            if (filtro != "")
            { query += " where producto.txt_concepto_prenda like '%" + filtro + "%' or producto.id_prenda = " + filtro; }
            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();

            return dst;
        }
        public DataSet ObtenerPedidosClientes(string filtro)
        {
            string query = "";

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }
        public DataSet ObtenerHistorialVentas(string filtro)
        {
            string query = "";

            DataSet dst = new DataSet();
            SqlConnection cnx = new SqlConnection(Conexion.cstr);
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);

            adp.Fill(dst);
            cnx.Close();
            return dst;
        }

        //Carrito--------------
        public bool CreaVentaNueva(int idClente, string fecha, float total)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CreaVentaNueva";
                cmd.Parameters.Add("@fecha_pedido", SqlDbType.Date).Value = fecha;
                cmd.Parameters.Add("@total_pedido", SqlDbType.Decimal).Value = total;
                cmd.Parameters.Add("@id_cliente", SqlDbType.Int).Value = idClente;

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }
            return ok;
        }
        public bool AgrgarProductoVenta(int cantidad, string variante)
        {
            bool ok = false;
            using (SqlConnection con = new SqlConnection(Conexion.cstr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AgrgarProductoVenta";
                cmd.Parameters.Add("@cantidad", SqlDbType.Int).Value = cantidad;
                cmd.Parameters.Add("@idVariante", SqlDbType.VarChar).Value = variante;

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                ok = true;
            }
            return ok;
        }


    }
}