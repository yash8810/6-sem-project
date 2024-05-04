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
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string username = Session["username"].ToString();
                con.Open();
                string query = "select * from tblUser where username= '" + username + "'";
                SqlCommand com = new SqlCommand(query, con);
                SqlDataReader dr = com.ExecuteReader();

                if (dr.Read() == true)
                {
                    txtemail.Text = dr.GetString(2);
                    txtuname.Text = dr.GetString(1);
                    txtdate.Text = dr.GetDateTime(5).ToString();
                }
                dr.Close();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string query = "select * from tblUser where username='"+username+"'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader dr = com.ExecuteReader();
            if(dr.Read() == true)
            {
                if(txtOldpass.Text == dr.GetString(3))
                {
                    if (txtNewpass.Text.Length > 6)
                    {
                        dr.Close();
                        string pass = "update tblUser set password='"+txtNewpass.Text+"' where username='"+txtuname.Text+"'";
                        SqlCommand result = new SqlCommand(pass, con);
                        result.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Success!', 'Password Updated Successfully!', 'success');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Password Must Be Greater Than 6 Characters!', 'error');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Invalid Old Password!', 'error');", true);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("vieworders.aspx");
        }
    }
}