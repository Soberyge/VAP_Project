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
                string concepto = catalogo.Tables[0].Rows[i][2].ToString();
                string tipo = catalogo.Tables[0].Rows[i][1].ToString();
                string marca = catalogo.Tables[0].Rows[i][3].ToString();
                int precio = Convert.ToInt32(catalogo.Tables[0].Rows[i][4]);
                byte[] imgb = (byte[])catalogo.Tables[0].Rows[i][5];
                byte[] imgn = (byte[])catalogo.Tables[0].Rows[i][6];

                p.Add(new Producto(id, concepto, tipo,marca, precio, imgb, imgn));  
                
            }

            //VER PRODUCTOS
            foreach(Producto pro in p)
            {
                //los 0 o campos vacios es porque no fueron declarados
                Response.Write(pro.Id);
                Response.Write(pro.Concepto);
                Response.Write(pro.Tipo);
                Response.Write(pro.Marca);
                Response.Write(pro.Precio);
                Response.Write(pro.ImgBlanco.ToString());
                Response.Write(pro.ImgNegro.ToString());

            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }


    }
}