using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace Dsms
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        static int sendOtp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["loggedin"] != null)
            {
                Response.Redirect("index.aspx");
            }
            txtPassword.Enabled = false;
            txtOtp.Enabled = false;
            btnRegister.Enabled = false;
            if (IsPostBack)
            {
                if(ViewState["username"] != null)
                {
                    txtUsername.Text = ViewState["username"].ToString();
                }
                if (ViewState["email"] != null)
                {
                    txtEmail.Text = ViewState["email"].ToString();
                }
               
            }
        }

        protected void btnOtp_Click(object sender, EventArgs e)
        {
            con.Open();
            string select = "select * from tblUser where username='" + txtUsername.Text + "'";
            SqlCommand result = new SqlCommand(select, con);
            SqlDataReader dr = result.ExecuteReader();

            if (dr.Read() == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Username Already Taken!', 'error');", true);

            }
            else
            {
                dr.Close();
                string email = "select * from tblUser where email='" + txtEmail.Text + "'";
                SqlCommand emailresult = new SqlCommand(email, con);
                SqlDataReader reader = emailresult.ExecuteReader();
                if (reader.Read() == true)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Email Already Taken!', 'error');", true);
                }
                else
                {
                            ViewState["username"] = txtUsername.Text;
                            ViewState["email"] = txtEmail.Text;
                            Random random = new Random();
                            sendOtp = random.Next(1000, 9999);
                            reader.Close();
                            String toEmail = txtEmail.Text;
                            String username = txtUsername.Text;
                            String emailbody = "Hello " + username + "! Here is your One Time Password For Registration : <b>" + sendOtp + "</b>.<br><br>Thank You For Interacting With Munchbags!!<br><br> Have A Good Day!";
                            MailMessage mm = new MailMessage("munchbagsstorein@gmail.com", toEmail);
                            mm.Body = emailbody;
                            mm.IsBodyHtml = true;
                            mm.Subject = "One Time Password For Registration!";
                            mm.Priority = MailPriority.High;
                            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                            SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                            SMTP.UseDefaultCredentials = false;
                            SMTP.Credentials = new NetworkCredential()
                            {
                                UserName = "munchbagsstorein@gmail.com",
                                Password = "bweuohvxpvykicxj"
                            };
                            SMTP.EnableSsl = true;
                            SMTP.Send(mm);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Check Email!', 'Your OTP is sent to your email!', 'success');", true);
                            txtOtp.Enabled = true;
                            txtPassword.Enabled = true;
                            btnRegister.Enabled = true;
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

                if (sendOtp == Convert.ToInt32(txtOtp.Text))
                {
                    if (txtPassword.Text.Length < 6)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Password Must be greater than 6 character!', 'error');", true);
                    }
                    else
                    {
                        con.Open();
                        string query = "insert into tblUser(username,email,password,role,date) values ('" + txtUsername.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','customer',GETDATE())";
                        SqlCommand com = new SqlCommand(query, con);
                        com.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Success!', 'Registered Successfully!', 'success').then(function() {window.location.href = 'login.aspx'}); ", true);
                        con.Close();
                    }
                }
                else
                {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Error!', 'Invalid OTP!', 'error');", true);
            }
        }
    }
}