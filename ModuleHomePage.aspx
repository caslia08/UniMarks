<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleHomePage.aspx.cs" Inherits="WebApplication3.ModuleHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Module Home page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .lecturer-details-grid-container{
            display: grid;
            grid-template-columns: 1fr 3fr;
            grid-gap: 40px;
        }
        .material-icons.md-68 { font-size: 68px; }
        .grid-icon{
            place-self: center;
        }
        #links-to-stats-grid-container{
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 20px;
        }
        .grid-button-container{
            border-radius: 7px;
            padding: 20px;
            background-color: rgb(233,236,239);
            border: solid;
            border-width: 1px;
            border-color: darkgrey;
            text-align: center;
        }
        .btn-rounded-border{
            border-radius: 8px;
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainHeading" runat="server">
    WRR301, Project
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <div class="container">
            <h2>General Details</h2>
            <hr />
            <br />
            <div class ="lecturer-details-grid-container">
                <div class="grid-icon">
                    <i class="material-icons md-68">person</i>
                </div>
                <div class="grid-content">
                    <h5 class="grid-content-heading">
                        Lecturer details:
                    </h5>
                    <table class="table table-hover">
                        <tr>
                            <td>Title:</td>
                            <td>Mrs</td>
                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td>Janine Nel</td>
                        </tr>
                           <tr>
                            <td>Department:</td>
                            <td>Computer Sciences</td>
                        </tr>
                        <tr>
                            <td>Email address:</td>
                            <td>Janine_Nel@mandela.ac.za</td>
                        </tr>
                          <tr>
                            <td>Office number:</td>
                            <td>041 504 2080</td>
                        </tr>
                    </table>
                </div>
                  <div class="grid-icon">
                  <i class="material-icons md-68">group</i>
                </div>
                <div class="grid-content">
                    <h5 class="grid-content-heading">
                        Number of registered students:
                    </h5>
                    <p>
                        78
                    </p>
                </div>
                  <div class="grid-icon">
                 <i class="material-icons md-68">web</i>
                </div>
                <div class="grid-content">
                    <h5 class="grid-content-heading">
                        External resources:
                    </h5>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action">Moodle site</a>
                        <a href="#" class="list-group-item list-group-item-action">UML concepts refresher</a>
                        <a href="#" class="list-group-item list-group-item-action">Visio tutorials</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="links-to-stats-grid-container">
        <div class="grid-button-container">
            <h5>Click button below to view the modules assessments</h5>
               <a href"#" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Module Assessments</a>
        </div>
        <div class="grid-button-container">
            <h5>Click button below to view the modules statistical information</h5>
            <a href"#" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Module Statistics</a>
        </div>
    </div>
    <br />
</asp:Content>
