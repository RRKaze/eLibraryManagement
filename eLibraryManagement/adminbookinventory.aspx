<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="eLibraryManagement.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <!--Left Book Details-->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- Member Details -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>
                        <!-- Member Details Form -->
                        <!-- row 1 -->
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload class="form-group" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_bookID" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="validator_id" runat="server" ControlToValidate="txt_bookID" ErrorMessage="ID is Required!"></asp:RequiredFieldValidator>
                                    <asp:LinkButton class="btn btn-primary" ID="btn_search" runat="server" OnClick="btn_search_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Book Title</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_title" runat="server" placeholder="Book Title"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="validator_title" runat="server" ControlToValidate="txt_title" ErrorMessage="Title is Required!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <!-- row 3&4 -->
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row"><!--3-->
                                    <div class="col">
                                        <label>Language</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="dropdown_language" runat="server">
                                                <asp:ListItem Text="English" Value="English" />
                                                <asp:ListItem Text="Spanish" Value="Spanish" />
                                                <asp:ListItem Text="Japanese" Value="Japanese" />
                                                <asp:ListItem Text="Korean" Value="Korean" />
                                                <asp:ListItem Text="German" Value="German" />
                                                <asp:ListItem Text="Danish" Value="Danish" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col">
                                        <label>Author Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txt_author" runat="server" placeholder="Author Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"><!--4-->
                                    <div class="col">
                                        <label>Publisher Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txt_publisher" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label>Publish Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txt_publishDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <asp:ListBox class="form-control" ID="list_genre" runat="server">
                                    <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                    <asp:ListItem Text="Fiction" Value="Fiction" />
                                    <asp:ListItem Text="Children’s" Value="Children’s" />
                                    <asp:ListItem Text="Graphic Novel" Value="Graphic Novel" />
                                    <asp:ListItem Text="Short Story" Value="Short Story" />
                                    <asp:ListItem Text="Literary Fiction" Value="Literary Fiction" />
                                    <asp:ListItem Text="Contemporary Fiction" Value="Contemporary Fiction" />
                                    <asp:ListItem Text="Romance" Value="Romance" />
                                    <asp:ListItem Text="Historical Fiction" Value="Historical Fiction" />
                                    <asp:ListItem Text="Thriller & Suspense" Value="Thriller & Suspense" />
                                    <asp:ListItem Text="Horror" Value="Horror" />
                                    <asp:ListItem Text="Mystery" Value="Mystery" />
                                    <asp:ListItem Text="Action & Adventure" Value="Action & Adventure" />
                                    <asp:ListItem Text="Dystopian" Value="Dystopian" />
                                    <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                    <asp:ListItem Text="Memoir & Autobiography" Value="Memoir & Autobiography" />
                                    <asp:ListItem Text="Food & Drink" Value="Food & Drink" />
                                    <asp:ListItem Text="Art & Photography" Value="Art & Photography" />
                                    <asp:ListItem Text="Self-help" Value="Self-help" />
                                    <asp:ListItem Text="History" Value="History" />
                                    <asp:ListItem Text="Travel" Value="Travel" />
                                    <asp:ListItem Text="True Crime" Value="True Crime" />
                                    <asp:ListItem Text="Humor" Value="Humor" />
                                    <asp:ListItem Text="Essays" Value="Essays" />
                                    <asp:ListItem Text="Science&Technology" Value="Science & Technology" />
                                    <asp:ListItem Text="Humanities & Social Sciences" Value="Humanities & Social Sciences" />
                                    <asp:ListItem Text="Guide/How-to" Value="Guide/How-to" />
                                    <asp:ListItem Text="Religion & Spirituality" Value="Religion & Spirituality" />
                                </asp:ListBox>
                            </div>
                        </div>
                        <!-- row 5 -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_edition" runat="server" placeholder="Edition"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Unit Cost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_unitCost" runat="server" placeholder="Unit Cost"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_pages" runat="server" placeholder="Pages"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 6 -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_actualStock" runat="server" placeholder="Actual Stock"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_currentStock" runat="server" placeholder="Current Stock" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_issuedBooks" runat="server" placeholder="Issued Books" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 7 -->
                        <div class="row">
                            <div class="col">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_bookDescription" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>

                        <!-- Admin Action button -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btn_add" runat="server" Text="Add" OnClick="btn_add_Click" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-warning btn-block btn-lg" ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-block btn-lg" ID="tbn_delete" runat="server" Text="Delete" OnClick="tbn_delete_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Homepage</a>
            </div>

            <!--Right Book Inventory List-->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Book Inventory List -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="source_bookInventory" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grid_bookInventory" runat="server" DataKeyNames="book_id" DataSourceID="source_bookInventory" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="Book Id" ReadOnly="True" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Title" SortExpression="book_name" />
                                        <asp:BoundField DataField="author_name" HeaderText="Author" SortExpression="author_name" />
                                        <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                                        <asp:BoundField DataField="edition" HeaderText="Edition" SortExpression="edition" />
                                        <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" />
                                        <asp:BoundField DataField="no_of_pages" HeaderText="Page" SortExpression="no_of_pages" Visible="False" />
                                        <asp:BoundField DataField="book_cost" HeaderText="Unit Cost" SortExpression="book_cost" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="Publisher" SortExpression="publisher_name" Visible="False" />
                                        <asp:BoundField DataField="current_stock" HeaderText="Current Stock" SortExpression="current_stock" />
                                        <asp:BoundField DataField="publisher_date" HeaderText="publisher_date" SortExpression="publisher_date" Visible="False" />
                                        <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" Visible="False" />
                                        <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" Visible="False" />
                                        <asp:BoundField DataField="book_img_link" HeaderText="book_img_link" SortExpression="book_img_link" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>


</asp:Content>
