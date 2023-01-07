<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="eLibraryManagement.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <!-- User Registration icon -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="110px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Registration</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><hr /></div>
                        </div>
                        <!-- User Registration form -->
                        <div class="row"> <!-- row 1 -->
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> <!-- row 2 -->
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> <!-- row 3 -->
                            <div class="col">
                                <label>Street Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Street Address"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> <!-- row 4 -->
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="TBA" Value="TBA" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row"> <!-- row 5 -->
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- User Registration buttom -->
                        <div class="row">
                            <div class="col">
                                <br />
                                <div class="form-group">
                                    <input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Homepage</a><br /><br />
            </div>
        </div>
    </div>


</asp:Content>
