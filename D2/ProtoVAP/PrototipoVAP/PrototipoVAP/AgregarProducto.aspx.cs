using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
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
            PasarInventario();
            Carrito.ListaCarrito.Add("1MB");
            Carrito.ListaCarrito.Add("1MN");
            Carrito.ConfirmarCompra(1, 1000);
            
        }

        public void PasarInventario()//pendiente
        {
            OperacionesBD op = new OperacionesBD();
            gvdInventario.DataSource = op.ObtenerInventario("");
            gvdInventario.DataBind();

            DataSet inventario = new DataSet();
            inventario = op.ObtenerCatalogo("");

            //tabla
            gvdInventario.DataSource = inventario;
            gvdInventario.DataBind();

            //Almacenado DE PRODUCTOS 
            for (int i = 0; i < inventario.Tables[0].Rows.Count; i++)
            {
                int id = Convert.ToInt32(inventario.Tables[0].Rows[i][0]);
                string concepto = inventario.Tables[0].Rows[i][2].ToString();
                string tipo = inventario.Tables[0].Rows[i][1].ToString();
                string marca = inventario.Tables[0].Rows[i][3].ToString();
                //string estado = inventario.Tables[0].Rows[i][4].ToString();
                int precio = Convert.ToInt32(inventario.Tables[0].Rows[i][4]);
                

                //p.Add(new Producto(id, concepto, tipo, marca, precio, imgb, imgn));

            }
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            GuardarProducto();
        }

        public void GuardarProducto()
        {
            bool okb = false;
            bool okn = false;
            if (fluBlanca.HasFile && fluNegra.HasFile)//controladores
            {
                string extencionB = System.IO.Path.GetExtension(fluBlanca.FileName);
                extencionB = extencionB.ToLower();
                if (extencionB == ".png" || extencionB == ".jpg")
                {
                    okb = true;
                }
                else
                { lblBlanca.Text = "formato incorrecto"; }//mensaje

                string extencionN = System.IO.Path.GetExtension(fluNegra.FileName);
                extencionN = extencionN.ToLower();
                if (extencionN == ".png" || extencionN == ".jpg")
                {
                    okn = true;
                }
                else
                { lblNegra.Text = "formato incorrecto"; }

                if (okb && okn)
                {
                    string imgBlanca = "Imagenes/" + txtTipo.Text + txtConcepto.Text + txtMarca.Text + "Blanco" + extencionB;
                    fluBlanca.SaveAs(Server.MapPath(imgBlanca));


                    string imgNegro = "Imagenes/" + txtTipo.Text + txtConcepto.Text + txtMarca.Text + "Negro" + extencionB;
                    fluNegra.SaveAs(Server.MapPath(imgNegro));

                    OperacionesBD opbd = new OperacionesBD();
                    opbd.CrearProducto(txtTipo.Text,
                        txtConcepto.Text, txtMarca.Text,
                        Convert.ToInt32(txtPrecio.Text),
                        imgBlanca, imgNegro,
                        "vigente");
                }

            }
            else
            {
                lblBlanca.Text = "Cargue las dos imagenes";//mensaje
            }
        }
       
    }
}