using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Dsms
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["loggedin"] != null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                con.Open();
                string query = "select * from tblUser where email='" + txtEmail.Text + "' and password='" + txtPassword.Text + "'";
                SqlCommand com = new SqlCommand(query, con);
                SqlDataReader dr = com.ExecuteReader();

                if (dr.Read() == true)
                {
                    string role = dr.GetValue(4).ToString();
                    int uid = (int)dr.GetValue(0);
                    string cust = "customer";
                    string admin = "admin";
                    if(role == cust)
                    {
                        Session["loggedin"] = "loggedin";
                        Session["uid"] = uid;
                        Session["username"] = dr.GetValue(1).ToString();
                        Response.Redirect("index.aspx");
                    }
                    else if(role == admin)
                    {
                        Session["adminloggedin"] = "adminloggedin";
                        Session["username"] = dr.GetValue(1).ToString();
                        Response.Redirect("admin/index.aspx");
                    }
                }
                else
                {
                    Session["loggedin"] = "";
                    Session["username"] = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Invalid Credential!', 'error');", true);
                }
                con.Close();
        }
    }
}