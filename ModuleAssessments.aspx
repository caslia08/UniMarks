<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleAssessments.aspx.cs" Inherits="WebApplication3.ModuleAssessments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Module Assessments
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .btn-rounded-border {
            border-radius: 8px;
        }
        .custome-table-props{
            background-color: white;
            margin: 10px;
        }
        .no-mark{
            color: grey;
            font-size:small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainHeading" runat="server">
    WRR301-Project, Assessments
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Module assessments</h2>
        <hr />
        <br />
 
        <table class="table table-hover custome-table-props" >
            <thead>
                <tr>
                    <th>Assessment description</th>
                    <th>Type of assessment</th>
                    <th>Assessment date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Elaborations document - Provide initial UI design for proposed system</td>
                    <td>Documentation</td>
                    <td>2020/08/28</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel suscipit ante, quis tincidunt elit.</td>
                    <td>Quiz</td>
                    <td>2020/03/28</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. quis tincidunt elit.</td>
                    <td>Tutorial test</td>
                    <td>2020/05/07</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel suscipit ante, quis tincidunt elit.</td>
                    <td>Tutorial test</td>
                    <td>2020/10/28</td>
                    <td class="no-mark">Not available</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>