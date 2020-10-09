using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace GestionFincaRaices
{
    public partial class About : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mostrar_inmueble();
            }
        }

        void mostrar_inmueble()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSinmueble";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdInmueble.DataSource = cmd.ExecuteReader();
                gvdInmueble.DataBind();

            }
        }

        void guardarInmueble()
        {
            try
            {
                string Tipo = string.Empty;
                if (RadiotipoE.Checked)
                {
                    Tipo = "1";
                }
                else if (RadiotipoP.Checked)
                {
                    Tipo = "2";
                }
                else if (RadiotipoL.Checked)
                {
                    Tipo = "3";
                }
                else if (RadiotipoO.Checked)
                {
                    Tipo = "4";
                }
                else if (RadiotipoF.Checked)
                {
                    Tipo = "5";
                }

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO inmueble (nombre,codigo_postal,direccion,precio,tipo_inmueble_id) VALUES (@nombre,@codigo_postal,@direccion,@precio,@tipo_inmueble_id)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@nombre", (TxtNombreInmueble.FindControl("TxtNombreInmueble") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@codigo_postal", (TxtCodigoPostal.FindControl("TxtCodigoPostal") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@direccion", (TxtDireccionInmueble.FindControl("TxtDireccionInmueble") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@precio", (TxTPrecio.FindControl("TxTPrecio") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@tipo_inmueble_id", Tipo);
                    sqlCmd.ExecuteNonQuery();

                    lblSuccessMessage.Text = "Registro Con Exito";
                    lblSuccessMessage.Visible = true;
                    lblErrorMessage.Text = "";
                    lblErrorMessage.Visible = true;

                    sqlCmd.Parameters.Clear();
                }

            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void Btn_NuevaInmueble(object sender, EventArgs e)
        {
            pnlDatosInmuebles.Visible = false;
            pnlNuevaInmueble.Visible = true;
        }

        protected void Button_Click_inmueble(object sender, EventArgs e)
        {
            pnlNuevaInmueble.Visible = false;
            pnlDatosInmuebles.Visible = true;
            guardarInmueble();
            mostrar_inmueble();
        }
        protected void gvdPersona_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM inmueble WHERE inmueble_id=@inmueble_id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@inmueble_id", Convert.ToInt32(gvdInmueble.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    mostrar_inmueble();
                    lblSuccessMessage.Text = "Registro Eliminado";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }  
    }  
}
