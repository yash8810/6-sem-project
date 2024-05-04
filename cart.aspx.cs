using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace Dsms
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=HARSHIL\\SQLEXPRESS;Initial Catalog=dbDsms;Integrated Security=True;MultipleActiveResultSets=True");

        double total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            if (Session["loggedin"] == null)
            {

                Response.Redirect("login.aspx");
            }
            calculateSum();
        }
        public void calculateSum()
        {
            if (GridView1.DataSource != null)
            {

                if (GridView1.Rows.Count > 0)
                {
                    int uid = (int)Session["uid"];
                    DataTable dt = new DataTable();
                    string query = "select * from CartOne where uid='" + uid + "'";
                    SqlCommand com = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = com;
                    DataSet ds = new DataSet();
                    sda.Fill(dt);
                    GridView1.FooterRow.Cells[4].Text = "Grand Total : ";
                    GridView1.FooterRow.Cells[5].Text = dt.Compute("Sum(total)", "").ToString();
                    total = Convert.ToDouble(dt.Compute("Sum(total)", "").ToString());
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["total"] = total.ToString();
            Response.Redirect("userdetails.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}