﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="eLibraryManagement.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">
            <!--Left Author Details-->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <!-- Author Details -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/writer.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <!-- Author ID and Name form -->
                        <div class="row">
                            <!-- row 1 -->
                            <div class="col-md-6">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="ID" TextMode="Number"></asp:TextBox>
                                        <asp:Button class="btn btn-light" id="Button4" runat="server" Text="Search"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <!-- Admin Actio button -->
                        <div class="row">
                            <div class="col-md-4">
                                <br />
                                <div class="form-group">
                                    <input class="btn btn-success btn-block btn-lg" id="Button1" type="button" value="Add" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="form-group">
                                    <input class="btn btn-primary btn-block btn-lg" id="Button2" type="button" value="Update" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="form-group">
                                    <input class="btn btn-danger btn-block btn-lg" id="Button3" type="button" value="Delete" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Homepage</a><br />
                <br />
            </div>

            <!--Right Author List-->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <!-- Author List -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
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

</asp:Content>
