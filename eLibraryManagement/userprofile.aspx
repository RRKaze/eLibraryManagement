<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="eLibraryManagement.userprofile" %>

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
            <!--Profile card-->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- User Registration icon -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Profile</h4>
                                    <span>Account Status: </span>
                                    <asp:Label class="badge badge-pill badge-info" ID="label_status" runat="server" Text="TBA"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <!-- User Registration form -->
                        <div class="row">
                            <!-- row 1 -->
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_fullname" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_dob" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- row 2 -->
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_phone" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_email" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- row 3 -->
                            <div class="col">
                                <label>Street Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_address" runat="server" placeholder="Street Address"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- row 4 -->
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="dropdown_state" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="TBA" Value="TBA" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_city" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_zipcode" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- row 5 -->
                            <div class="col-md-4">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_userID" runat="server" placeholder="Member ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_oldpassword" runat="server" placeholder="Old Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_newpassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- User Update button -->
                        <div class="row">
                            <div class="col">
                                <br />
                                <div class="form-group">
                                    <asp:Button class="btn btn-info btn-block btn-lg" ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Homepage</a><br />
                <br />
            </div>

            <!--Book History card-->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <!-- Book Info icon -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book History</h4>
                                    <asp:Label class="badge badge-pill badge-info" ID="label_bookhistory" runat="server" Text="Book info"></asp:Label>
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
                                <asp:GridView class="table table-striped table-bordered" ID="grid_bookhistory" runat="server" OnRowDataBound="grid_bookhistory_RowDataBound">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>


</asp:Content>
