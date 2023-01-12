using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryManagement
{
    public partial class adminusermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {
            grid_userlist.DataBind();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (isIDGoodAndExists())
            {
                getUserInfo();
            }
            else
            {
                Response.Write("<script>alert('User Not Found.')</script>");
            }
        }

        protected void btn_approve_Click(object sender, EventArgs e)
        {
            if (isIDGoodAndExists())
            {
                updateUserStatusByID("Active");
            }
        }

        protected void btn_pending_Click(object sender, EventArgs e)
        {
            if (isIDGoodAndExists())
            {
                updateUserStatusByID("Pending");
            }
        }

        protected void btn_decline_Click(object sender, EventArgs e)
        {
            if (isIDGoodAndExists())
            {
                updateUserStatusByID("Inactive");
            }
        }

        protected void btn_deleteuser_Click(object sender, EventArgs e)
        {
            if (isIDGoodAndExists())
            {
                deleteUserByID();
            }
        }

        bool isIDGoodAndExists()
        {
            string userID = txt_userID.Text.Trim();
            if (!userID.Equals(""))
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();//if connection is closed, we open it
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id = '" + userID + "';", con);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable datatable = new DataTable();
                    adapter.Fill(datatable);

                    if (datatable.Rows.Count > 0) // if member entry exists
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "')</script>");
                    return false;
                }
            }
            return false;
        }

        void getUserInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + txt_userID.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txt_userID.Text = dr.GetValue(8).ToString();
                        txt_userfullname.Text = dr.GetValue(0).ToString();
                        txt_userstatus.Text = dr.GetValue(10).ToString();
                        txt_dob.Text = dr.GetValue(1).ToString();
                        txt_phone.Text = dr.GetValue(2).ToString();
                        txt_email.Text = dr.GetValue(3).ToString();
                        txt_state.Text = dr.GetValue(4).ToString();
                        txt_city.Text = dr.GetValue(5).ToString();
                        txt_zipcode.Text = dr.GetValue(6).ToString();
                        txt_address.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    // no user found
                    Response.Write("<script>alert('INVALID USERNAME!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updateUserStatusByID(string status)
        {
            string userID = txt_userID.Text.Trim();
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + userID + "';", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txt_userstatus.Text = status;
                grid_userlist.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deleteUserByID()
        {
            string userID = txt_userID.Text.Trim();
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("DELETE FROM member_master_tbl " +
                    "WHERE member_id='" + userID + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();

                clearForm();
                Response.Write("<script>alert('User Deleted Successfully!');</script>");
                grid_userlist.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            txt_userID.Text = "";
            txt_userfullname.Text = "";
            txt_userstatus.Text = "";
            txt_dob.Text = "";
            txt_phone.Text = "";
            txt_email.Text = "";
            txt_state.Text = "";
            txt_city.Text = "";
            txt_zipcode.Text = "";
            txt_address.Text = "";
        }
    }
}