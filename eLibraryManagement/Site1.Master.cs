using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    btn_userlogin.Visible = true;
                    btn_signup.Visible = true;
                    btn_logout.Visible = false;
                    btn_hello.Visible = false;

                    btn_adminlogin.Visible = true;
                    btn_authormng.Visible = false;
                    btn_publishmng.Visible = false;
                    btn_bookinventory.Visible = false;
                    btn_bookissue.Visible = false;
                    btn_usermng.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    btn_userlogin.Visible = false;
                    btn_signup.Visible = false;
                    btn_logout.Visible = true;
                    btn_hello.Visible = true;
                    btn_hello.Text = "Hello! " + Session["fullname"].ToString();

                    btn_adminlogin.Visible = true;
                    btn_authormng.Visible = false;
                    btn_publishmng.Visible = false;
                    btn_bookinventory.Visible = false;
                    btn_bookissue.Visible = false;
                    btn_usermng.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    btn_userlogin.Visible = false;
                    btn_signup.Visible = false;
                    btn_logout.Visible = true;
                    btn_hello.Visible = true;
                    btn_hello.Text = "Hello! " + Session["fullname"].ToString();

                    btn_adminlogin.Visible = false;
                    btn_authormng.Visible = true;
                    btn_publishmng.Visible = true;
                    btn_bookinventory.Visible = true;
                    btn_bookissue.Visible = true;
                    btn_usermng.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_adminlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void btn_authormng_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void btn_publishmng_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void btn_bookinventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void btn_bookissue_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void btn_usermng_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }

        protected void btn_userlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            btn_userlogin.Visible = true;
            btn_signup.Visible = true;
            btn_logout.Visible = false;
            btn_hello.Visible = false;

            btn_adminlogin.Visible = true;
            btn_authormng.Visible = false;
            btn_publishmng.Visible = false;
            btn_bookinventory.Visible = false;
            btn_bookissue.Visible = false;
            btn_usermng.Visible = false;

            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Response.Redirect("homepage.aspx");
        }
    }
}