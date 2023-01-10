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

    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// When the sign up button is clicked, should save data to DB
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('MEMBER ID EXIST ALREADY!')</script>");
            }
            else
            {
                signUpNewUser();
            }
            
        }

        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id = '"+ txt_id.Text.Trim() + "';", con);
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

        void signUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO member_master_tbl" +
                    "(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status)" +
                    "values" +
                    "(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status);"
                    , con);

                cmd.Parameters.AddWithValue("@full_name", txt_fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_contact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", dropdown_state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txt_zipcode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_address.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txt_id.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txt_password.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}