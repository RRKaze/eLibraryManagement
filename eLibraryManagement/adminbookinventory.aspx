<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="eLibraryManagement.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Book Name"></asp:TextBox>
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
                                            <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
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
                                            <asp:DropDownList class="form-control" ID="DropDownList6" runat="server">
                                                <asp:ListItem Text="English" Value="English" />
                                                <asp:ListItem Text="Spanish" Value="Spanish" />
                                                <asp:ListItem Text="Japanese" Value="Japanese" />
                                                <asp:ListItem Text="Korean" Value="Korean" />
                                                <asp:ListItem Text="German" Value="German" />
                                                <asp:ListItem Text="Danish" Value="Danish" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>


                                </div>
                                <div class="row"><!--4-->
                                    <div class="col">
                                        <label>Publisher Name</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
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
                                        <label>Publish Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <asp:ListBox class="form-control" ID="ListBox1" runat="server">
                                    <asp:ListItem Text="English" Value="English" />
                                    <asp:ListItem Text="Spanish" Value="Spanish" />
                                    <asp:ListItem Text="Japanese" Value="Japanese" />
                                    <asp:ListItem Text="Korean" Value="Korean" />
                                    <asp:ListItem Text="German" Value="German" />
                                    <asp:ListItem Text="Danish" Value="Danish" />
                                </asp:ListBox>
                            </div>
                        </div>
                        <!-- row 5 -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Edition"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Unit Cost</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Unit Cost" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 6 -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 7 -->
                        <div class="row">
                            <div class="col">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2" ReadOnly="true"></asp:TextBox>
                                    
                                </div>
                            </div>
                        </div>

                        <!-- Admin Action button -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="btn btn-success btn-block btn-lg" id="Button1" type="button" value="Add" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="btn btn-primary btn-block btn-lg" id="Button2" type="button" value="Update" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="btn btn-danger btn-block btn-lg" id="Button3" type="button" value="Delete" />
                                </div>
                            </div>
                        </div>
                        <a href="homepage.aspx"><< Back to Homepage</a>
                    </div>
                </div>
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
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>


</asp:Content>
