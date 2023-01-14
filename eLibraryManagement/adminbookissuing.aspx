<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="eLibraryManagement.adminbookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <!--Left Book Issuing-->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- Author Details -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>
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
                        <!-- Book Issuing form -->
                        <!-- row 1 -->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_bookID" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button class="btn btn-light" ID="btn_search" runat="server" Text="Search" OnClick="btn_search_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_username" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_title" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 3 -->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_startdate" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_enddate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Admin Actio button -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-block btn-lg" ID="btn_issue" runat="server" Text="Issue" OnClick="btn_issue_Click"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Button class="btn btn-success btn-block btn-lg" ID="btn_return" runat="server" Text="Return" OnClick="btn_return_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
                <br /><a href="homepage.aspx"><< Back to Homepage</a><br />
            </div>

            <!--Right Issued Book List-->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Issued Book List -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="source_bookissue" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grid_bookissue" runat="server" AutoGenerateColumns="False" DataSourceID="source_bookissue" OnRowDataBound="grid_bookissue_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="User ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="User Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Title" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issued Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
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
