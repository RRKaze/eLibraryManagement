<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="eLibraryManagement.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function ()
        {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <!--Left Publisher Details-->
            <div class="col-md-6">
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
                                    <img width="100px" src="imgs/publisher.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <!-- Publisher ID and Name form -->
                        <div class="row">
                            <!-- row 1 -->
                            <div class="col-md-6">
                                <label>Publisher ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_publisherID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-light" id="btn_search" runat="server" Text="Search" OnClick="btn_search_Click"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_publisherName" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- Admin Actio button -->
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" id="btn_add" runat="server" Text="Add" OnClick="btn_add_Click"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg" id="btn_update" runat="server" Text="Update" OnClick="btn_update_Click"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-block btn-lg" id="btn_delete" runat="server" Text="Delete" OnClick="btn_delete_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Homepage</a><br />
                <br />
            </div>

            <!--Right Publisher List-->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <!-- Publisher List -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="source_publisher" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grid_publisher" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="source_publisher">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

</asp:Content>
