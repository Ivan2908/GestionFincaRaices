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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mostrar_gvdInquipF();
                mostrar_inmueble();
                mostrar_facturamorosos();            
            }
        }

        void mostrar_gvdInquipF()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSContratoFecha";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdInquipF.DataSource = cmd.ExecuteReader();
                gvdInquipF.DataBind();

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
                gvdTodoInmuebles.DataSource = cmd.ExecuteReader();
                gvdTodoInmuebles.DataBind();

            }
        }

        void mostrar_facturamorosos()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SPSFacturaMoroso";
                cmd.Connection = sqlCon;
                sqlCon.Open();
                gvdInquiMorosos.DataSource = cmd.ExecuteReader();
                gvdInquiMorosos.DataBind();

            }
        }

        protected void gvdInquipF_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}