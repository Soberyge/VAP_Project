using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet catalogo = new DataSet();
            OperacionesBD op = new OperacionesBD();
            catalogo = op.ObtenerCatalogo(txtBuscar.Text, ddlTipo.SelectedIndex,ddlOrden.SelectedIndex);
            gdvCatalgo.DataSource = catalogo;
            for (int i = 0; i < catalogo.Tables[0].Rows.Count; i++)
            {
                for (int j = 0; j < catalogo.Tables[0].Columns.Count; j++)
                {
                    Response.Write(catalogo.Tables[0].Rows[i][j] + "\t");
                }
                Console.WriteLine();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}