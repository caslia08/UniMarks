<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerAddMarks.aspx.cs" Inherits="WebApplication3.LecturerAddMarks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Edit Marks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
<style>.btn-rounded-border {
            border-radius: 8px;
        }</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">View Assessments</li>
        <li class="breadcrumb-item active">Edit Marks</li>
    </ol>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Edit Marks
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
 <div class="jumbotron">
            <h2>MAPV311 Student List</h2>
        <hr />
        <br />

            <form class="form-inline my-2 my-lg-0">
                <label for="exampleSelect1">Filter  </label>
                <select class="form-control my-2 my-sm-0" id="exampleSelect1">
                    <option>Select Option</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </form>
            <br />
            <table class="table table-hover custome-table-props marks-table">
            <thead>
                <tr>
                    <th>Student Number</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Assessment Mark (40)</th>
                </tr>
            </thead>
          <tbody>
                    <tr>
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">37</td>
                    </tr>

                    <tr>
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">15</td>
                    </tr>
                    <tr>
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True">27</td>
                    </tr>

                    <tr class="table-danger">
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr>
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True">30</td>
                    </tr>
                    <tr >
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">32</td>
                    </tr>

                    <tr>
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">16</td>
                    </tr>
                    <tr >
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True"> 36</td>
                    </tr>

                    <tr>
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">38</td>
                    </tr>

                    <tr">
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True"> 9</td>
                    </tr>
  
                </tbody>
        </table>

        <hr />
            <br />
            <button type="submit" class="btn btn-outline-primary btn-lg btn-rounded-border">Save Changes</button>
            <button type="button" class="btn btn-outline-danger btn-lg btn-rounded-border">Cancel</button>

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

<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
  
</asp:Content>
