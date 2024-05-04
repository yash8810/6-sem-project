using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Configuration;

namespace Dsms
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        public double total;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");

            if (Session["total"] == null)
            {
                Response.Redirect("login.aspx");
            }

            con.Open();
            String Text = Session["username"].ToString();
            int uid = (int)Session["uid"];
            string query = "SELECT SUM(total) AS total FROM CartOne WHERE uid = @uid";
            SqlCommand com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("@uid", uid);
            object totalObj = com.ExecuteScalar();
            if (totalObj != null && totalObj != DBNull.Value)
            {
                double total = Convert.ToDouble(totalObj);
                // Convert the total to the required format for Razorpay (in paise)
                total *= 1;
                // Render the total into a hidden field
                totalAmount.Value = total.ToString();
                lblTotal.Text = "₹ " + total.ToString();
            }
            con.Close();

        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    double total = Convert.ToDouble(Session["total"]);

        //    // Fetch other form values
        //    string email = txtEmail.Text;
        //    string contact = txtContact.Text;
        //    string address = txtAddress.Text;
        //    string uname = "";

        //    // Check if uname session variable exists and is not null
        //    if (Session["uname"] != null)
        //    {
        //        uname = Session["uname"].ToString();
        //    }
        //    else
        //    {
        //        // Handle the case when the uname session variable is null
        //        // You can choose to redirect the user to a login page or display an error message
        //        // For demonstration, let's set uname to an empty string
        //        uname = "";
        //    }

        //    // Open connection
        //    con.Open();

        //    // Check if pincode exists
        //    int pin = Convert.ToInt32(txtPin.Text);
        //    string pinQuery = "SELECT * FROM Pincode WHERE Pincode = @pincode";
        //    SqlCommand pinCommand = new SqlCommand(pinQuery, con);
        //    pinCommand.Parameters.AddWithValue("@pincode", pin);
        //    SqlDataReader pinReader = pinCommand.ExecuteReader();

        //    if (pinReader.Read()) // Pincode exists
        //    {
        //        pinReader.Close();

        //        // Insert into tblOrderDetails
        //        string insertQuery = "INSERT INTO tblOrderDetails (uname, email, address, contact, total) VALUES (@uname, @email, @address, @contact, @total)";
        //        SqlCommand insertCommand = new SqlCommand(insertQuery, con);
        //        insertCommand.Parameters.AddWithValue("@uname", uname);
        //        insertCommand.Parameters.AddWithValue("@email", email);
        //        insertCommand.Parameters.AddWithValue("@address", address);
        //        insertCommand.Parameters.AddWithValue("@contact", contact);
        //        insertCommand.Parameters.AddWithValue("@total", total);
        //        insertCommand.ExecuteNonQuery();

        //        Label1.Visible = true;
        //        Label1.Text = "Order placed successfully!";
        //    }
        //    else // Pincode does not exist
        //    {
        //        pinReader.Close();
        //        Label1.Visible = true;
        //        Label1.Text = "Delivery is not available to this pincode!";
        //    }

        //    // Close connection
        //    con.Close();
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            // Retrieve total from the label
            double total = Convert.ToDouble(totalAmount.Value);

            // Retrieve other form values
            string email = txtEmail.Text;
            string contact = txtContact.Text;
            string address = txtAddress.Text;
            string uname = Session["uname"] != null ? Session["uname"].ToString() : "";

            // Open connection
            con.Open();

            // Check if pincode exists
            int pin = Convert.ToInt32(txtPin.Text);
            string pinQuery = "SELECT * FROM Pincode WHERE Pincode = @pincode";
            SqlCommand pinCommand = new SqlCommand(pinQuery, con);
            pinCommand.Parameters.AddWithValue("@pincode", pin);
            SqlDataReader pinReader = pinCommand.ExecuteReader();

            if (pinReader.Read()) // Pincode exists
            {
                pinReader.Close();

                // Insert into tblOrderDetails
                string insertQuery = "INSERT INTO tblOrderDetails (uname, email, address, contact, total) VALUES (@uname, @email, @address, @contact, @total)";
                SqlCommand insertCommand = new SqlCommand(insertQuery, con);
                insertCommand.Parameters.AddWithValue("@uname", Session["username"].ToString());
                insertCommand.Parameters.AddWithValue("@email", email);
                insertCommand.Parameters.AddWithValue("@address", address);
                insertCommand.Parameters.AddWithValue("@contact", contact);
                insertCommand.Parameters.AddWithValue("@total", total);
                insertCommand.ExecuteNonQuery();

                Label1.Visible = true;
                Label1.Text = "Order placed successfully!";
            }
            else // Pincode does not exist
            {
                pinReader.Close();
                Label1.Visible = true;
                Label1.Text = "Delivery is not available to this pincode!";
            }

            // Close connection
            con.Close();
        }

    }
}