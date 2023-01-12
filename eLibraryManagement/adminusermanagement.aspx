<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="eLibraryManagement.adminusermanagement" %>

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
            <!--Left Member Details-->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- Member Details -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>
                        <!-- Member Details Form -->
                        <!-- row 1 -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="btn_search" runat="server" OnClick="btn_search_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_userfullname" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_userstatus" runat="server" placeholder="Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-success" ID="btn_approve" runat="server" OnClick="btn_approve_Click"> <i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning" ID="btn_pending" runat="server" OnClick="btn_pending_Click"> <i class="fas fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger" ID="btn_decline" runat="server" OnClick="btn_decline_Click"> <i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- row 2 -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_dob" runat="server" placeholder="DOB" ReadOnly="True" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_phone" runat="server" placeholder="Phone" ReadOnly="True" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_email" runat="server" placeholder="Email Address" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 3 -->
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_address" runat="server" placeholder="Full Address" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- row 4 -->
                        <div class="row">
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_city" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_state" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_zipcode" runat="server" placeholder="Zip Code" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- Admin Actio button -->
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-block btn-lg" ID="btn_deleteuser" runat="server" Text="Delete User Permanently" OnClick="btn_deleteuser_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Homepage</a>
            </div>

            <!--Right Member List-->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Issued Book List -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="source_userlist" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="grid_userlist" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="source_userlist">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="User ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Phone #" SortExpression="contact_no" />
                                        <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="dob" Visible="False" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="pincode" HeaderText="pincode" SortExpression="pincode" Visible="False" />
                                        <asp:BoundField DataField="full_address" HeaderText="full_address" SortExpression="full_address" Visible="False" />
                                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
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
