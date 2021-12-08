using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string cstr = @"Data Source=LAPTOP-12NK0P7A\SQLEXPRESS;Initial Catalog=VAP_Project;Integrated Security=True";
            SqlConnection cnx = new SqlConnection(cstr);
            string query = "SELECT * FROM producto;";
            SqlDataAdapter adp = new SqlDataAdapter(query, cnx);
            DataSet dst = new DataSet();
            adp.Fill(dst);
            for (int i = 0; i < dst.Tables[0].Rows.Count; i++)
            {
                for (int j = 0; j < dst.Tables[0].Columns.Count; j++)
                {
                    Response.Write(dst.Tables[0].Rows[i][j] + "\t");
                }
                Console.WriteLine();
            }
            cnx.Close();
            Response.Write("se pudo");
            
        }
    }
}