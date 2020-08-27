<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerStudentView.aspx.cs" Inherits="WebApplication3.LecturerStudentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    View Students
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item"><a href="#">Module Statistics</a></li>
        <li class="breadcrumb-item active">View Student List</li>
    </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
    Student List
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
            <h2>MAPV311 Student List</h2>
        <hr />
        <br />

            
        <table class="table table-hover custome-table-props marks-table" >
            <thead>
                <tr>
                    <th>Student Number</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>215632236</td>
                    <td>Jane</td>
                    <td>Doe</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm" role="button">View Profile</a></td>
                </tr>
                   <tr>
                    <td>217965324</td>
                    <td>John</td>
                    <td>Doe</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm" role="button">View Profile</a></td>
                </tr>
                   <tr>
                    <td>214563323</td>
                    <td>Mark</td>
                    <td>Webber</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm" role="button">View Profile</a></td>
                </tr>
                   <tr>
                    <td>214563258</td>
                    <td>Jonathan</td>
                    <td>Strauss</td>
                    <td><a href"#" class="btn btn-outline-primary btn-sm" role="button">View Profile</a></td>
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
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
