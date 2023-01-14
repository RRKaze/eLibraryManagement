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
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            getBookandUserNames();
        }

        protected void btn_issue_Click(object sender, EventArgs e)
        {
            if (checkUserExists() && checkBookExists())
            {
                if (checkIssueEntryExist()) 
                {
                    Response.Write("<script>alert('This book has been issue to this user.');</script>");
                }
                else
                {
                    issueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Error in Book info or User info!');</script>");
            }
        }

        protected void btn_return_Click(object sender, EventArgs e)
        {
            if (checkUserExists() && checkBookExists())
            {
                if (checkIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This book entry does not exist. ');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Error in Book info or User info!');</script>");
            }
        }

        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("DELETE FROM book_issue_tbl " +
                    "WHERE book_id='" + txt_bookID.Text.Trim() + "' " +
                    "AND member_id='" + txt_userID.Text.Trim()+ "'; "
                    , con);
                int ret = cmd.ExecuteNonQuery();
                if (ret > 0 )
                {
                    cmd = new SqlCommand("UPDATE book_master_tbl " +
                    "SET current_stock=current_stock+1" +
                    "WHERE book_id='" + txt_bookID.Text.Trim() + "'"
                    , con);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                Response.Write("<script>alert('Book Returned Successfully!');</script>");
                grid_bookissue.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO book_issue_tbl (member_id,member_name,book_id,book_name,issue_date,due_date) " +
                    "VALUES (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)"
                    , con);

                cmd.Parameters.AddWithValue("@member_id", txt_userID.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", txt_username.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", txt_bookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txt_title.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", txt_startdate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", txt_enddate.Text.Trim());

                cmd.ExecuteNonQuery();

                cmd = new SqlCommand(
                    "UPDATE book_master_tbl " +
                    "SET current_stock = current_stock-1 " +
                    "WHERE book_id = '"+txt_bookID.Text.Trim()+"'"
                    , con);

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book Updated Successfully!');</script>");
                grid_bookissue.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkIssueEntryExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM book_issue_tbl " +
                    "WHERE member_id='" + txt_userID.Text.Trim() + "' " +
                    "AND book_id='"+txt_bookID.Text.Trim()+"' ", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
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
            }
            return false;
        }

        bool checkUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM member_master_tbl " +
                    "WHERE member_id='" + txt_userID.Text.Trim() + "' " +
                    "AND account_status != 'Inactive' ", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
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
            }
            return false;
        }

        bool checkBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM book_master_tbl " +
                    "WHERE book_id='" + txt_bookID.Text.Trim() + "' " +
                    "AND current_stock > 0 ", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
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
            }
            return false;
        }

        void getBookandUserNames()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_master_tbl WHERE book_id='"+txt_bookID.Text.Trim()+"'" , con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txt_title.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Book Id and Title not found!');</script>");
                }

                cmd = new SqlCommand("SELECT full_name FROM member_master_tbl WHERE member_id='" + txt_userID.Text.Trim() + "'", con);
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txt_username.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('User Id and Title not found!');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void grid_bookissue_RowDataBound(object sender, GridViewRowEventArgs e)
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