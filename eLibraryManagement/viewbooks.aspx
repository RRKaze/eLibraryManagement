<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="eLibraryManagement.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h3>Book Inventory List</h3>
                </center>
                <br />
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <!-- Book Inventory List -->
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
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
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
            <center>
                <a href="homepage.aspx"><< Back to Home</a><span class="clearfix"></span><br />
            </center>
        </div>
    </div>
</asp:Content>
