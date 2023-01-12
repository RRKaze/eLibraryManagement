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
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Clicling Add button will add the new author id and name to the DB
        /// will check if id exist or not; then add or return
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                Response.Write("<script>alert('Author Exist Already. Can Not Add another Author with Same ID.')</script>");
            }
            else
            {
                addNewAuthor();
                clearForm();
            }

        }

        /// <summary>
        /// Updates the Author list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                updateAuthorInfo();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Author Does NOT Exist.')</script>");
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            if (checkAuthorExists())
            {
                deleteAuthorInfo();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Author Does NOT Exist.')</script>");
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            searchAuthorInfo();
        }

        bool checkAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id='"+txt_authorid.Text.Trim()+"';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);

                if(datatable.Rows.Count > 0)
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

        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO author_master_tbl" +
                    "(author_id,author_name)" +
                    "values" +
                    "(@author_id,@author_name);"
                    , con);
                cmd.Prepare();

                cmd.Parameters.AddWithValue("@author_id", txt_authorid.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txt_authorname.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added Successfully!');</script>");
                grid_author.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        void updateAuthorInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("UPDATE author_master_tbl " +
                    "SET author_name='"+ txt_authorname.Text.Trim() + "' " +
                    "WHERE author_id='"+ txt_authorid.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully!');</script>");
                grid_author.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deleteAuthorInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("DELETE FROM author_master_tbl " +
                    "WHERE author_id='" + txt_authorid.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted Successfully!');</script>");
                grid_author.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void searchAuthorInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id='" + txt_authorid.Text.Trim() + "';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);

                if (datatable.Rows.Count > 0)
                {
                    txt_authorname.Text = datatable.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author Not Found!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            txt_authorid.Text = "";
            txt_authorname.Text = "";
        }

    }
}