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
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('User session expired!')</script>");
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    getUserBookHistoryData();
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalData();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('User session expired!')</script>");
                Response.Redirect("homepage.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            }
        }

        void updateUserPersonalDetails()
        {
            try
            {
                string password = "";
                if (txt_newpassword.Text.Trim() != "")
                {
                    password = txt_newpassword.Text.Trim();
                }
                else
                {
                    password = txt_oldpassword.Text.Trim();
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl " +
                    "SET full_name=@full_name," +
                    "dob=@dob," +
                    "contact_no=@contact_no," +
                    "email=@email," +
                    "state=@state," +
                    "city=@city," +
                    "pincode=@pincode," +
                    "full_address=@full_address," +
                    "password=@password," +
                    "account_status=@account_status " +
                    "WHERE member_id='" + Session["username"].ToString() + "';", con);

                cmd.Parameters.AddWithValue("@full_name", txt_fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_phone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", dropdown_state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txt_zipcode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_address.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", label_status.Text);

                int ret = cmd.ExecuteNonQuery();
                con.Close();
                if(ret > 0)
                {
                    Response.Write("<script>alert('Your Account Detail has been Updated Successully!')</script>");
                    getUserPersonalData();
                    getUserBookHistoryData();
                }
                else
                {
                    Response.Write("<script>alert('Invalid entry with the form, please check!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void getUserPersonalData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);

                txt_fullname.Text = datatable.Rows[0]["full_name"].ToString();
                txt_dob.Text = datatable.Rows[0]["dob"].ToString();
                txt_phone.Text = datatable.Rows[0]["contact_no"].ToString();
                txt_email.Text = datatable.Rows[0]["email"].ToString();
                txt_address.Text = datatable.Rows[0]["full_address"].ToString();
                dropdown_state.SelectedValue = datatable.Rows[0]["state"].ToString().Trim();
                txt_city.Text = datatable.Rows[0]["city"].ToString();
                txt_zipcode.Text = datatable.Rows[0]["pincode"].ToString();
                txt_userID.Text = datatable.Rows[0]["member_id"].ToString();
                txt_oldpassword.Text = datatable.Rows[0]["password"].ToString();

                label_status.Text = datatable.Rows[0]["account_status"].ToString().Trim();
                switch (label_status.Text)
                {
                    case "Active":
                        label_status.Attributes.Add("class", "badge badge-pill badge-success");
                        break;
                    case "Pending":
                        label_status.Attributes.Add("class", "badge badge-pill badge-warning");
                        break;
                    case "Inactive":
                        label_status.Attributes.Add("class", "badge badge-pill badge-danger");
                        break;
                    default:
                        label_status.Attributes.Add("class", "badge badge-pill badge-info");
                        break;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void getUserBookHistoryData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl WHERE member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);
                grid_bookhistory.DataSource = datatable;
                grid_bookhistory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void grid_bookhistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime datetime = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > datetime)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}