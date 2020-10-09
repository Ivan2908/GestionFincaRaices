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
    public partial class Contact : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                mostrar_clientes();
            }
        }

        void mostrar_clientes()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSpersona";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdPersona.DataSource = cmd.ExecuteReader();
                gvdPersona.DataBind();
            }
        }

        protected void Btn_NuevaPersona(object sender, EventArgs e)
        {
            pnlDatosPersonas.Visible = false;
            pnlNuevaPersona.Visible = true;
        }

        void guardarPersona()
        {
            try
            {
                string genero = string.Empty;
                if (RadioSexoM.Checked)
                {
                    genero = "Masculino";
                }
                else
                {
                    genero = "Femenino";
                }

                string tipoPersona = string.Empty;
                if (RadioButton1.Checked)
                {
                    tipoPersona = "1";
                }
                else if (RadioButton2.Checked)
                {
                    tipoPersona = "2";
                }
                else if (RadioButton3.Checked)
                {
                    tipoPersona = "3";
                }

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO persona (tipo_persona_id,nombre,cedula,edad,sexo,telefono,direccion) VALUES (@tipo_persona_id,@nombre,@cedula,@edad,@sexo,@telefono,@direccion)";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@tipo_persona_id", tipoPersona);
                    sqlCmd.Parameters.AddWithValue("@nombre", (TxtNombre.FindControl("TxtNombre") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@cedula", (TxtCedula.FindControl("TxtCedula") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@edad", (TxtEdad.FindControl("TxtEdad") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@sexo", genero);
                    sqlCmd.Parameters.AddWithValue("@telefono", (TxTtelefono.FindControl("TxTtelefono") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@direccion", (TxtDireccion.FindControl("TxtDireccion") as TextBox).Text.Trim());
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

        protected void Button_Click(object sender, EventArgs e)
        {
            pnlDatosPersonas.Visible = true;
            pnlNuevaPersona.Visible = false;
            guardarPersona();
            mostrar_clientes();
        }

        protected void gvdPersona_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM persona WHERE persona_id=@persona_id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@persona_id", Convert.ToInt32(gvdPersona.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    mostrar_clientes();
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

        protected void gvdPersona_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvdPersona.EditIndex = e.NewEditIndex;
            mostrar_clientes();
        }

        protected void gvdPersona_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE persona SET nombre=@nombre,cedula=@cedula,edad=@edad,telefono=@telefono,direccion=@direccion WHERE persona_id=@persona_id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@nombre", (gvdPersona.Rows[e.RowIndex].FindControl("txtNombreEditar") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@cedula", (gvdPersona.Rows[e.RowIndex].FindControl("txtCedulaEditar") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@edad", (gvdPersona.Rows[e.RowIndex].FindControl("txtEdadEditar") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@telefono", (gvdPersona.Rows[e.RowIndex].FindControl("txtTelefonoEditar") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@direccion", (gvdPersona.Rows[e.RowIndex].FindControl("txtDireccionEditar") as TextBox).Text.Trim());                 
                    sqlCmd.Parameters.AddWithValue("@persona_id", Convert.ToInt32(gvdPersona.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvdPersona.EditIndex = -1;
                    mostrar_clientes();
                    lblSuccessMessage.Text = "Campos Actualizados";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvdPersona_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvdPersona.EditIndex = -1;
            mostrar_clientes();
        }
    }
}