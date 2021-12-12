using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;


namespace PrototipoVAP
{
    public partial class Catalogo : System.Web.UI.Page
    {        
        ArrayList p = new ArrayList();
        
        string json = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Buscar();
        }

        public void Buscar()
        {
            DataSet catalogo = new DataSet();
            DataSet TodaVariante = new DataSet();
            OperacionesBD op = new OperacionesBD();
            catalogo = op.ObtenerCatalogo(Globales.busqueda);
            Globales.busqueda = "";

            //Almacenado DE PRODUCTOS 
            for (int i = 0; i < catalogo.Tables[0].Rows.Count; i++)
            {
                ArrayList v = new ArrayList();
                int id = Convert.ToInt32(catalogo.Tables[0].Rows[i][0]);
                string concepto = catalogo.Tables[0].Rows[i][2].ToString();
                string tipo = catalogo.Tables[0].Rows[i][1].ToString();
                string marca = catalogo.Tables[0].Rows[i][3].ToString();
                decimal precio = Convert.ToDecimal(catalogo.Tables[0].Rows[i][4]);
                byte[] imgb = (byte[])catalogo.Tables[0].Rows[i][5];
                byte[] imgn = (byte[])catalogo.Tables[0].Rows[i][6];

                TodaVariante = op.ObtenerVariante(id);

                for (int j = 0; j < TodaVariante.Tables[0].Rows.Count; j++)
                {
                    string idvar = TodaVariante.Tables[0].Rows[j][0].ToString();
                    string color = TodaVariante.Tables[0].Rows[j][1].ToString();
                    string talla = TodaVariante.Tables[0].Rows[j][2].ToString();
                    int cantidad = Convert.ToInt32(TodaVariante.Tables[0].Rows[j][3]);
                    v.Add(new Variantes(idvar, talla, color, cantidad));
                }

                p.Add(new Producto(id, concepto, tipo, marca, precio, imgb, imgn, v));
            }

            //ARREGLO A JSON
            json = JsonConvert.SerializeObject(p, Formatting.Indented);            
        }

        //MANDAR PRODUCTOS A LA VISTA
        protected string MyProperty { get { return json; } }
    }
}