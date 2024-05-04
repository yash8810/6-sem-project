using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace Dsms
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        static int sendOtp = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string email = "select * from tblUser where email='" + txtEmail.Text + "'";
            SqlCommand emailresult = new SqlCommand(email, con);
            SqlDataReader reader = emailresult.ExecuteReader();
            if (reader.Read() == true)
            {
                int uid = reader.GetInt32(0);
                Random random = new Random();
                sendOtp = random.Next(1000, 9999);
                String toEmail = txtEmail.Text;
                String emailbody = "Hello! Click Here to Reset Your Password! <b> https://localhost:44397/newpassword.aspx?uid=" + uid + "</b>.<br><br> Have A Good Day!";
                MailMessage mm = new MailMessage("munchbagsstorein@gmail.com", toEmail);
                mm.Body = emailbody;
                mm.IsBodyHtml = true;
                mm.Subject = "Reset Link for Forget Password!";
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "k", "swal('Check Email!', 'Activation link is sent to your gmail!', 'success');", true);
                Session["otpsent"] = true;
            }
        }
    }
}
    
