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
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">Module home page</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainHeading" runat="server">
    WRR301-Project, Assessments
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Module Assessments</h2>
        <hr />
        <br />
 
        <table class="table table-hover custome-table-props marks-table" >
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Assessment Type</th>
                    <th>Venue</th>
                    <th>Weightage</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Elaborations document</td>
                    <td>Provide initial UI design for proposed system</td> 
                    <td>2020/08/28</td>
                    <td>Documentation</td>
                    <td>Submit Via Moodle</td>
                    <td>To be determined</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                    <td>Semester Test 1</td>
                    <td>Closed book test based on work covered from week 1 to 4</td>
                    <td>2020/03/28</td>
                    <td>Semester Test</td>
                    <td>09_0205</td>
                    <td> 35%</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                   <td>Semester Test 2</td>
                    <td>Closed book test based on work covered from week 5 to 9</td>
                    <td>2020/05/10</td>
                    <td>Semester Test</td>
                    <td>09_0205</td>
                    <td> 25%</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View mark</a></td>
                </tr>
                   <tr>
                    <td>Research Assignment</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque cursus neque est, eu elementum leo aliquet et. Pellentesque tempus metus vehicula blandit ultrices.</td>
                    <td>2020/09/10</td>
                    <td>Assignment</td>
                    <td>Submit via Moodle</td>
                    <td> 10%</td>
                    <td class="no-mark">Not available</td>
                </tr>
            </tbody>
        </table>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
          <script src="https://code.jquery.com/jquery-3.5.1.jss"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
       
        <script>
            $(document).ready(function () {
                $('.marks-table').DataTable();
            });
        </script>
    </div>
  
</asp:Content>