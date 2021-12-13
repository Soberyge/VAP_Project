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

        //public void GuardarProducto()
        //{
        //    bool okb = false;
        //    bool okn = false;
        //    if (fluBlanca.HasFile && fluNegra.HasFile)//controladores
        //    {
        //        string extencionB = System.IO.Path.GetExtension(fluBlanca.FileName);
        //        extencionB = extencionB.ToLower();
        //        if (extencionB == ".png"  extencionB == ".jpeg")
        //        {
        //            okb = true;
        //        }
        //        else
        //        { lblBlanca.Text = "formato incorrecto"; }//mensaje

        //        string extencionN = System.IO.Path.GetExtension(fluNegra.FileName);
        //        extencionN = extencionN.ToLower();
        //        if (extencionN == ".png"  extencionN == ".jpeg")
        //        {
        //            okn = true;
        //        }
        //        else
        //        { lblNegra.Text = "formato incorrecto"; }

        //        if (okb && okn)
        //        {
        //            string imgBlanca = "~/Imagenes/" + txtTipo.Text + txtConcepto.Text + txtMarca.Text + "Blanco" + extencionB;
        //            fluBlanca.SaveAs(Server.MapPath(imgBlanca));


        //            string imgNegro = "~/Imagenes/" + txtTipo.Text + txtConcepto.Text + txtMarca.Text + "Negro" + extencionB;
        //            fluNegra.SaveAs(Server.MapPath(imgNegro));

        //            OperacionesBD opbd = new OperacionesBD();
        //            opbd.CrearProducto(txtTipo.Text,
        //                txtConcepto.Text, txtMarca.Text,
        //                Convert.ToInt32(txtPrecio.Text),
        //                imgBlanca, imgNegro,
        //                "vigente");
        //        }

        //    }
        //    else
        //    {
        //        lblBlanca.Text = "Cargue las dos imagenes";//mensaje
        //    }
        //}
    }
}