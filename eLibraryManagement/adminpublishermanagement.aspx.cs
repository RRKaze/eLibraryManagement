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
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                Response.Write("<script>alert('Publisher Exist Already! Can not add another publisher with same ID.')</script>");
            }
            else
            {
                addPublisherInfo();
                clearForm();
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                updatePublisherInfo();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Publisher Does NOT Exist!')</script>");
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                deletePublisherInfo();
                clearForm();
            }
            else
            {
                Response.Write("<script>alert('Publisher Does NOT Exist!')</script>");
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            searchPublisherInfo();
        }

        bool checkPublisherExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id='" + txt_publisherID.Text.Trim() + "';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);

                if (datatable.Rows.Count > 0)
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

        void addPublisherInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO publisher_master_tbl " +
                    "(publisher_id,publisher_name) " +
                    "values " +
                    "(@publisher_id,@publisher_name);"
                    , con);
                cmd.Prepare();

                cmd.Parameters.AddWithValue("@publisher_id", txt_publisherID.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txt_publisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Added Successfully!');</script>");
                grid_publisher.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void updatePublisherInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("UPDATE publisher_master_tbl " +
                    "SET publisher_name='" + txt_publisherName.Text.Trim() + "' " +
                    "WHERE publisher_id='" + txt_publisherID.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Updated Successfully!');</script>");
                grid_publisher.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        void deletePublisherInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("DELETE FROM publisher_master_tbl " +
                    "WHERE publisher_id='" + txt_publisherID.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully!');</script>");
                grid_publisher.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        void searchPublisherInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl WHERE publisher_id='" + txt_publisherID.Text.Trim() + "';", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable datatable = new DataTable();
                adapter.Fill(datatable);

                if (datatable.Rows.Count > 0)
                {
                    txt_publisherName.Text = datatable.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Publisher Not Found!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void clearForm()
        {
            txt_publisherID.Text = "";
            txt_publisherName.Text = "";
        }
    }
}