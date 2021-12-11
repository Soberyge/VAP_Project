using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class PantallaCatalogo : System.Web.UI.Page
    {

        ArrayList p = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet catalogo = new DataSet();
            OperacionesBD op = new OperacionesBD();
            catalogo = op.ObtenerCatalogo(txtBuscar.Text, ddlTipo.SelectedIndex,ddlOrden.SelectedIndex);
            gdvCatalgo.DataSource = catalogo;
           
            //Almacenado DE PRODUCTOS 
            for (int i = 0; i < catalogo.Tables[0].Rows.Count; i++)
            {
                int id = Convert.ToInt32(catalogo.Tables[0].Rows[i][0]);
                string concep = catalogo.Tables[0].Rows[i][2].ToString();
                string tipo = catalogo.Tables[0].Rows[i][1].ToString();
                int precio = Convert.ToInt32(catalogo.Tables[0].Rows[i][4]);
                string imgb = catalogo.Tables[0].Rows[i][5].ToString();

                p.Add(new Producto(id, concep, tipo, precio, imgb));                
            }

            //VER PRODUCTOS
            foreach(Producto pro in p)
            {
                //los 0 o campos vacios es porque no fueron declarados
                Response.Write(pro.ToString());
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }


    }
}