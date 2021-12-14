using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrototipoVAP
{
    public partial class Inventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscarInventario_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {

        }

//        public void guardarproducto()
//        {
//            bool okb = false;
//            bool okn = false;
//            if (fluBlanca.HasFile && fluNegra.HasFile)//controladores
//            {
//                string extencionb = System.IO.Path.GetExtension(fluBlanca.FileName);
//                extencionb = extencionb.ToLower();
//                if (extencionb == ".png" || extencionb == ".jpeg")
//                {
//                    okb = true;
//                }
//                else
//                { //lblblanca.text = "formato incorrecto"; }//mensaje

//                string extencionn = System.IO.Path.GetExtension(fluNegra.FileName);
//                extencionn = extencionn.ToLower();
//                if (extencionn == ".png" || extencionn == ".jpeg")
//                {
//                    okn = true;
//                }
//                else
//                { //lblnegra.text = "formato incorrecto"; }

//                if (okb && okn)
//                {
//                    string imgblanca = "imagenes/" + txttipo.text + txtConcepto.Text + txtMarca.Text + "blanco" + extencionb;
//                    fluBlanca.SaveAs(Server.MapPath(imgblanca));


//                    string imgnegro = "imagenes/" + txttipo.text + txtConcepto.Text + txtMarca.Text + "negro" + extencionb;
//                    fluNegra.SaveAs(Server.MapPath(imgnegro));

//                    OperacionesBD opbd = new OperacionesBD();
//                    opbd.CrearProducto(txtTipo.Text,
//                        txtConcepto.Text, txtMarca.Text,
//                        Convert.ToInt32(txtPrecio.Text),
//                        imgblanca, imgnegro,
//                        "vigente");
//                }

//            }
//            else
//            {
//                //lblblanca.text = "cargue las dos imagenes";//mensaje
//            }
//        }
    }
}