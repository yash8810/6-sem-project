using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Dsms.report;
using Microsoft.Reporting.WebForms;
using System.Net.Mail;
using System.Net;

namespace Dsms
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        int id;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            if (Session["loggedin"] == "")
            {
                Response.Redirect("login.aspx");
            }
            int uid = Convert.ToInt32(Session["uid"].ToString());
            
            if (Session["email"] != null)
            {
                con.Open();
                string expecteddate = DateTime.Now.AddDays(2).ToString();
                string oid = "select max(onum) as ID from tblOrderDetails ";
                SqlCommand cm = new SqlCommand(oid, con);
                SqlDataReader dr = cm.ExecuteReader();
                if (dr.Read())
                {
                    id = Convert.ToInt32(dr["Id"].ToString()) + 1;
                }
                string uname = Session["username"].ToString();
                string email = Session["email"].ToString();
                string address = Session["address"].ToString();
                string contact = Session["contact"].ToString();
                float total = (float)Convert.ToDouble(Session["total"].ToString());
                double c = (double)Convert.ToDouble(contact);
                string date = DateTime.Now.ToString();
                string query = "insert into tblOrderDetails(uname,email,address,contact,date,total) values ('" + uname + "','" + email + "','" + address + "','" + c + "','" + date + "','"+total+"')";
                SqlCommand cmd = new SqlCommand(query, con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {   
                    foreach (GridViewRow gr in gvProduct.Rows)
                    {
                        string query1 = "insert into tblOrderProduct(oid,pname,price,quantity,total,date,ptype) values ('" + id + "','" + gr.Cells[0].Text + "','" + gr.Cells[1].Text + "','" + gr.Cells[2].Text + "','" + gr.Cells[3].Text + "','" + gr.Cells[5].Text + "','" + gr.Cells[4].Text + "')";
                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.ExecuteNonQuery();

                        string pname = gr.Cells[0].Text;
                        int quantity = Convert.ToInt32(gr.Cells[2].Text);
                        string ptype = gr.Cells[4].Text;
                        double kg = 0;
                        if (ptype == "250gm")
                        {
                            kg = quantity * 0.25;
                        }
                        else if (ptype == "500gm")
                        {
                            kg = quantity * 0.5;
                        }
                        else if (ptype == "1kg")
                        {
                            kg = quantity * 1;
                        }
                        else
                        {
                            kg = quantity;
                        }
                        string stk = "update tblStock set stock=stock-'" + kg + "' where pname='" + pname + "'";
                        SqlCommand stkcmd = new SqlCommand(stk, con);
                        stkcmd.ExecuteNonQuery();
                    }
                    //tocustomer
                    String to = Session["email"].ToString();
                    String un = Session["username"].ToString();
                    String body = "Hello " + un + "! Your Order is Placed to patel's dryfruit and masala.<br><br>Your order will be delivered by " + DateTime.Now.AddDays(2).ToShortDateString() + "<br><br>Thank You For Interacting With Patel's Dryfruits And Masala!!<br><br> Have A Good Day!";
                    MailMessage m = new MailMessage("pateldryfruit27@gmail.com", to);
                    m.Body = body;
                    m.IsBodyHtml = true;
                    m.Subject = "Order Confirmation!";
                    m.Priority = MailPriority.High;
                    SmtpClient SMTP1 = new SmtpClient("smtp.gmail.com", 587);
                    SMTP1.DeliveryMethod = SmtpDeliveryMethod.Network;
                    SMTP1.UseDefaultCredentials = false;
                    SMTP1.Credentials = new NetworkCredential()
                    {
                        UserName = "pateldryfruit27@gmail.com",
                        Password = "bibsroqiopajinnm"
                    };
                    SMTP1.EnableSsl = true;
                    SMTP1.Send(m);

                    //toadmin
                    String toEmail = "20bmiit031@gmail.com";
                    String username = "Admin";
                    String emailbody = "Hello " + username + "! New Order is Placed to patel's dryfruit and masala.<br><br>Check it Out Fast! ";
                    MailMessage mm = new MailMessage("pateldryfruit27@gmail.com", toEmail);
                    mm.Body = emailbody;
                    mm.IsBodyHtml = true;
                    mm.Subject = "New Order!";
                    mm.Priority = MailPriority.High;
                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                    SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                    SMTP.UseDefaultCredentials = false;
                    SMTP.Credentials = new NetworkCredential()
                    {
                        UserName = "pateldryfruit27@gmail.com",
                        Password = "bibsroqiopajinnm"
                    };
                    SMTP.EnableSsl = true;
                    SMTP.Send(mm);
                    string query2 = "delete from tblCart where uid='" + uid + "'";
                    SqlCommand cmd2 = new SqlCommand(query2,con);
                    cmd2.ExecuteNonQuery();
                    
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            Label1.Text = DateTime.Now.AddDays(2).ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["email"] = "";
            Session["address"] = "";
            Session["contact"] = "";
            Response.Redirect("index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("report/PrintInvoice.aspx?id="+ id);
        }
    }
}