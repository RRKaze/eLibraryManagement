<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="eLibraryManagement.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--This section is the big image on the top of the main content container
        img-fluid makes sure that the image is automatically adjusted according to screen size-->
    <section>
        <img src="imgs/home-bg.jpg" class="img-fluid"/>
    </section>
    <!--This section is the three feature icon in the middle of the main content container-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Three Primary Features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/digital-inventory.png" />
                    <h4>Digital Book Inventory</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/search-online.png" />
                    <h4>Search Books</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/defaulters-list.png" />
                    <h4>Defaulters List</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <!--This section is the bottom image on the bottom of the main content container-->
    <section>
        <img src="imgs/in-homepage-banner.jpg" class="img-fluid"/>
    </section>
    <!--This section is the three feature icon in the bottom of the main content container-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Features</h2>
                    <p><b>Three Primary Features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/sign-up.png" />
                    <h4>Sign Up</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/search-online.png" />
                    <h4>Search Online</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/library.png" />
                    <h4>Visit Us</h4>
                    <p>A digital collection, also known as a digital library, is any collection of files that has been digitally preserved and 
                        is accessible on the internet or through software. 
                        A digital library may contain manuscripts, newspapers, books, journals, images, audio, and video.</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
