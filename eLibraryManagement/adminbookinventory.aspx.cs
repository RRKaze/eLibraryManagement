using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryManagement
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; // the connection string to the db, defined in the web.config file
        string global_filepath;
        int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPushlisherValues();
            }
            grid_bookInventory.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                Response.Write("<script>alert('Same Book ID Existed Already! Please try Search and then Update.');</script>");
            }
            else
            {
                addBookByID();
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                updateBookByID();
            }
        }

        protected void tbn_delete_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                deleteBookByID();
                clearForm();
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            if (checkBookExists())
            {
                searchBookByID();
            }
        }

        void fillAuthorPushlisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl;", con);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dropdown_author.DataSource = dt;
                dropdown_author.DataValueField = "author_name";
                dropdown_author.DataBind();

                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl;", con);
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);
                dropdown_publisher.DataSource = dt;
                dropdown_publisher.DataValueField = "publisher_name";
                dropdown_publisher.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        void addBookByID()
        {
            try
            {
                // genre list 
                string genres = getAllGenre();

                // file uploader
                string filepath = getFilepath();

                // sql procedure
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }
                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO book_master_tbl " +
                    "(book_id,book_name,genre,author_name,publisher_name,publisher_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) " +
                    "values " +
                    "(@book_id,@book_name,@genre,@author_name,@publisher_name,@publisher_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link);"
                    , con);
                cmd.Prepare();

                cmd.Parameters.AddWithValue("@book_id", txt_bookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txt_title.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", dropdown_author.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@publisher_name", dropdown_publisher.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@publisher_date", txt_publishDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", dropdown_language.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@edition", txt_edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txt_unitCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txt_bookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txt_actualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txt_actualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Added Successfully!');</script>");
                grid_bookInventory.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
        }

        void updateBookByID()
        {
            try
            {
                string genres = getAllGenre();
                string filepath = getFilepath();

                int actual_stock = Convert.ToInt32(txt_actualStock.Text.Trim());
                int current_stock = Convert.ToInt32(txt_currentStock.Text.Trim());

                if (global_actual_stock != actual_stock)
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        txt_currentStock.Text = "" + current_stock;
                    }
                }

                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("UPDATE book_master_tbl " +
                    "SET book_name='" + txt_title.Text.Trim() + "' " +
                    ", genre='"+ genres + "' " +
                    ", author_name='" + dropdown_author.SelectedItem.Value + "' " +
                    ", publisher_name='" + dropdown_publisher.SelectedItem.Value + "' " +
                    ", publisher_date='" + txt_publishDate.Text.Trim() + "' " +
                    ", language='" + dropdown_language.SelectedItem.Value + "' " +
                    ", edition='" + txt_edition.Text.Trim() + "' " +
                    ", book_cost='" + txt_unitCost.Text.Trim() + "' " +
                    ", no_of_pages='" + txt_pages.Text.Trim() + "' " +
                    ", book_description='" + txt_bookDescription.Text.Trim() + "' " +
                    ", actual_stock='" + actual_stock.ToString() + "' " +
                    ", current_stock='" + current_stock.ToString() + "' " +
                    ", book_img_link='" + filepath + "' " +
                    "WHERE book_id='" + txt_bookID.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book Updated Successfully!');</script>");
                grid_bookInventory.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void deleteBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand
                    ("DELETE FROM book_master_tbl " +
                    "WHERE book_id='" + txt_bookID.Text.Trim() + "'; "
                    , con);

                cmd.ExecuteNonQuery();
                con.Close();

                clearForm();
                Response.Write("<script>alert('Book Deleted Successfully!');</script>");
                grid_bookInventory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void searchBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();//if connection is closed, we open it
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl WHERE book_id='" + txt_bookID.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txt_bookID.Text = dr.GetValue(0).ToString().Trim();
                        txt_title.Text = dr.GetValue(1).ToString();

                        string[] genres = dr.GetValue(2).ToString().Trim().Split(',');

                        for (int i = 0; i < genres.Length; i++)
                        {
                            for (int j = 0; i < list_genre.Items.Count; j++)
                            {
                                if (list_genre.Items[j].ToString() == genres[i])
                                {
                                    list_genre.Items[j].Selected = true;
                                    break;
                                }
                            }
                        }

                        dropdown_author.SelectedValue = dr.GetValue(3).ToString();
                        dropdown_publisher.SelectedValue = dr.GetValue(4).ToString();
                        txt_publishDate.Text = dr.GetValue(5).ToString().Trim();
                        dropdown_language.SelectedValue = dr.GetValue(6).ToString();
                        txt_edition.Text = dr.GetValue(7).ToString().Trim();
                        txt_unitCost.Text = dr.GetValue(8).ToString().Trim();
                        txt_pages.Text = dr.GetValue(9).ToString().Trim();
                        txt_bookDescription.Text = dr.GetValue(10).ToString().Trim();
                        txt_actualStock.Text = dr.GetValue(11).ToString().Trim();
                        txt_currentStock.Text = dr.GetValue(12).ToString().Trim();
                        txt_issuedBooks.Text = (Int32.Parse(dr.GetValue(11).ToString()) - Int32.Parse(dr.GetValue(12).ToString())).ToString();

                        global_filepath = dr.GetValue(13).ToString();
                    }
                }
                else
                {
                    // no user found
                    Response.Write("<script>alert('INVALID BOOK ID!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        bool checkBookExists()
        {
            string bookID = txt_bookID.Text.Trim();
            if (!bookID.Equals(""))
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon); // creating a connection to the db
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();//if connection is closed, we open it
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id = '" + bookID + "' OR book_name='"+txt_title.Text.Trim()+"';", con);
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
                    Response.Write("<script>alter('Error! ' + '" + ex + "');</script>");
                }
            }
            return false;
        }

        void clearForm()
        {
            txt_bookID.Text = "";
            txt_title.Text = "";
            txt_bookDescription.Text = "";
            txt_edition.Text = "";
            txt_pages.Text = "";
            txt_publishDate.Text = "";
            txt_unitCost.Text = "";
            txt_actualStock.Text = "";
            txt_currentStock.Text = "";
            txt_issuedBooks.Text = "";
            dropdown_author.ClearSelection();
            list_genre.ClearSelection();
            dropdown_language.ClearSelection();
            dropdown_publisher.ClearSelection();
        }

        string getAllGenre()
        {
            string genres = "";
            foreach (int i in list_genre.GetSelectedIndices())
            {
                genres = genres + list_genre.Items[i] + ",";
            }
            genres = genres.Remove(genres.Length - 1); // removes last comma
            return genres;
        }

        string getFilepath()
        {
            string filepath = "~/imgs/b1.jpg";
            string filename = Path.GetFileName(image_uploader.PostedFile.FileName);
            if(filename == "" || filename == null)
            {
                filepath = global_filepath;
            }
            else
            {
                image_uploader.SaveAs(Server.MapPath("imgs/" + filename));
                filepath = "~/imgs/" + filename;
            }
            return filepath;
        }
    }
}