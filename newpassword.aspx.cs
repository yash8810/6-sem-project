    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Dsms
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["otpsent"] == null)
            {
                Response.Redirect("index.aspx");
            } 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uid = Request.QueryString["uid"];
            if (txtPass.Text == txtRepass.Text)
            {
                con.Open();
                SqlCommand com = new SqlCommand("update tblUser set password='" + txtPass.Text + "' where uid='" + uid.ToString() + "'", con);
                com.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Success!', 'Password Reset Successfully!', 'success').then(function() {window.location.href = 'login.aspx'}); ", true);
                Session["otpsent"] = null;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Failed!', 'Both Password Must Be Same!', 'success');", true);
            }
        }
    }
}