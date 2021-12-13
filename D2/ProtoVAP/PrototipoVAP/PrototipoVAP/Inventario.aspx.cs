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

        //public void guardarproducto()
        //{
        //    bool okb = false;
        //    bool okn = false;
        //    if (flublanca.hasfile && flunegra.hasfile)//controladores
        //    {
        //        string extencionb = system.io.path.getextension(flublanca.filename);
        //        extencionb = extencionb.tolower();
        //        if (extencionb == ".png"  extencionb == ".jpeg")
        //        {
        //            okb = true;
        //        }
        //        else
        //        { lblblanca.text = "formato incorrecto"; }//mensaje

        //        string extencionn = system.io.path.getextension(flunegra.filename);
        //        extencionn = extencionn.tolower();
        //        if (extencionn == ".png"  extencionn == ".jpeg")
        //        {
        //            okn = true;
        //        }
        //        else
        //        { lblnegra.text = "formato incorrecto"; }

        //        if (okb && okn)
        //        {
        //            string imgblanca = "imagenes/" + txttipo.text + txtconcepto.text + txtmarca.text + "blanco" + extencionb;
        //            flublanca.saveas(server.mappath(imgblanca));


        //            string imgnegro = "imagenes/" + txttipo.text + txtconcepto.text + txtmarca.text + "negro" + extencionb;
        //            flunegra.saveas(server.mappath(imgnegro));

        //            operacionesbd opbd = new operacionesbd();
        //            opbd.crearproducto(txttipo.text,
        //                txtconcepto.text, txtmarca.text,
        //                convert.toint32(txtprecio.text),
        //                imgblanca, imgnegro,
        //                "vigente");
        //        }

        //    }
        //    else
        //    {
        //        lblblanca.text = "cargue las dos imagenes";//mensaje
        //    }
        //}
    }
}