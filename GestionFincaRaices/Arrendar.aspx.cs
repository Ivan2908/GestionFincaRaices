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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mostrar_contrato();
                mostrar_factura();
            }
        }

        void mostrar_contrato()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSContrato";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdContrato.DataSource = cmd.ExecuteReader();
                gvdContrato.DataBind();

            }
        }

        void mostrar_factura()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSFactura";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdFactura.DataSource = cmd.ExecuteReader();
                gvdFactura.DataBind();

            }
        }

        protected void Btn_NuevoArriendo(object sender, EventArgs e)
        {
            pnlDatosContratos.Visible = false;
            pnlNuevaContrato.Visible = true;
            pnlNuevaFactura.Visible = false;
        }

        void guardarContrato()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "INSERT INTO contrato (inmueble_id,persona_id) VALUES (@inmueble_id,@persona_id)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@inmueble_id", (TxtCodigoInmueble.FindControl("TxtCodigoInmueble") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@persona_id", (TxtCodigoCliente.FindControl("TxtCodigoCliente") as TextBox).Text.Trim());
                sqlCmd.ExecuteNonQuery();

                lblSuccessMessage.Text = "Registro Con Exito";
                lblSuccessMessage.Visible = true;
                lblErrorMessage.Text = "";
                lblErrorMessage.Visible = true;

                sqlCmd.Parameters.Clear();
            }
        }

        void guardarEstado()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "UPDATE inmueble SET estado=@estado WHERE inmueble_id=@inmueble_id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@estado", "Arrendado");
                sqlCmd.Parameters.AddWithValue("@inmueble_id", (TxtCodigoInmueble.FindControl("TxtCodigoInmueble") as TextBox).Text.Trim());
                sqlCmd.ExecuteNonQuery();
            }
        }

        void guardarFactura()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "INSERT INTO factura (contrato_id,total,estado) VALUES (@contrato_id,@total,@estado)";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@contrato_id", (TxtCodigoContrato.FindControl("TxtCodigoContrato") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@total", (TxtTotalFactura.FindControl("TxtTotalFactura") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@estado", (TxtEstado.FindControl("TxtEstado") as TextBox).Text.Trim());

                sqlCmd.ExecuteNonQuery();

                lblSuccessMessage.Text = "Registro Con Exito";
                lblSuccessMessage.Visible = true;
                lblErrorMessage.Text = "";
                lblErrorMessage.Visible = true;

                sqlCmd.Parameters.Clear();
            }
        }

        protected void gvdContrato_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string query = "DELETE FROM contrato WHERE contrato_id=@contrato_id";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@contrato_id", Convert.ToInt32(gvdContrato.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                mostrar_contrato();

            }
        }

        protected void Button_Click_contrato(object sender, EventArgs e)
        {
            pnlNuevaContrato.Visible = false;
            pnlDatosContratos.Visible = true;
            pnlNuevaFactura.Visible = false;
            guardarContrato();
            guardarEstado();
            mostrar_contrato();
            mostrar_factura();
        }

        protected void Button_registrarFactura_Click(object sender, EventArgs e)
        {
            pnlDatosContratos.Visible = false;
            pnlNuevaContrato.Visible = false;
            pnlNuevaFactura.Visible = true;
        }

        protected void ButtonGuardarFactura_Click(object sender, EventArgs e)
        {
            pnlNuevaContrato.Visible = false;
            pnlDatosContratos.Visible = true;
            pnlNuevaFactura.Visible = false;
            guardarFactura();
            mostrar_factura();
            mostrar_contrato();
        }
    }
}