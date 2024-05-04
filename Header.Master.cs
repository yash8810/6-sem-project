using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dsms
{
    public partial class Header : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");
            if (Session["loggedin"] == null)
            {
                btnProfile.Visible = false;
                btnCart.Visible = false;
                btnLogout.Visible = false;
            }
            else
            {
                btnProfile.Visible = true;
                btnCart.Visible = true;
                btnLogout.Visible = true;
                btnLogin.Visible = false;
                btnProfile.Text = Session["username"].ToString();
            }
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("product.aspx");
        }

        protected void btnGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect("gallery.aspx");
        }

        protected void btnAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx#about");
        }

        protected void btnExpertise_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx#food");
        }

        protected void btnReviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx#blogs");
        }

        protected void btnContactus_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx#footer");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["loggedin"] = null;
            Session["username"] = null;
            Session["uid"] = null;
            btnLogout.Visible = false;
            btnProfile.Visible = false;
            btnLogin.Visible = true;
            btnCart.Visible = false;
            Response.Redirect("index.aspx");
        }
    }
}