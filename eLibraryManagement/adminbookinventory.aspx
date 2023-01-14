<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="eLibraryManagement.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                    <img id="imgview" width="100px" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>
                        <!-- Member Details Form -->
                        <!-- row 1 -->
                        <div class="row">
                            <div class="col">
                                <hr />
                                <asp:FileUpload onchange="readURL(this);" class="form-group" ID="image_uploader" runat="server" />
                            </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_bookID" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="btn_search" runat="server" OnClick="btn_search_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Book Title</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_title" runat="server" placeholder="Book Title"></asp:TextBox>
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
                                            <asp:DropDownList class="form-control" ID="dropdown_author" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"><!--4-->
                                    <div class="col">
                                        <label>Publisher Name</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="dropdown_publisher" runat="server"></asp:DropDownList>
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
                                <asp:ListBox class="form-control" ID="list_genre" runat="server" SelectionMode="Multiple" Rows="5">
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
                                    <asp:TextBox CssClass="form-control" ID="txt_bookDescription" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    
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
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-size="X-Large"></asp:Label>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">

                                                                Author:
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                &nbsp;| Genre:
                                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                                &nbsp;| Language:
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("language") %>'></asp:Label>

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-12">

                                                                Publisher :
                                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                &nbsp;| Publish Date:
                                                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("publisher_date") %>'></asp:Label>
                                                                &nbsp;| Pages:
                                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                &nbsp;| Edition:&nbsp;
                                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("edition") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">

                                                                Cost:
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                &nbsp;| Actual Stock:
                                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                &nbsp;| Available:
                                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">

                                                                Description:
                                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <asp:Image ID="img" CssClass="img-fluid" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        <asp:Localize ID="Localize1" runat="server"></asp:Localize>
                                                    </div>
                                                </div>
                                            </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
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
