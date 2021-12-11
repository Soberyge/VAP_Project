using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class AgregarProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            bool okb = false;
            bool okn = false;
            if(fluBlanca.HasFile && fluNegra.HasFile)
            {
                string extencionB = System.IO.Path.GetExtension(fluBlanca.FileName);
                extencionB = extencionB.ToLower();
                if (extencionB == ".png" || extencionB == ".jpeg")
                {
                    okb = true;
                }
                else
                { lblBlanca.Text = "formato incorrecto"; }

                string extencionN = System.IO.Path.GetExtension(fluNegra.FileName);                
                extencionN = extencionN.ToLower();
                if(extencionN == ".png" || extencionN ==".jpeg")
                {
                    okn = true;
                }
                else
                { lblNegra.Text = "formato incorrecto"; }

                if(okb && okn)
                {
                    OperacionesBD opbd = new OperacionesBD();
                    opbd.CrearProducto(txtTipo.Text, txtConcepto.Text, txtMarca.Text, Convert.ToInt32(txtPrecio.Text), fluBlanca.FileBytes, fluNegra.FileBytes, "vigente");
                    
                }

            }
            else
            {
                lblBlanca.Text = "Cargue las dos imagenes";
            }
        }
    }
}