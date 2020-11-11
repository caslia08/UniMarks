<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMarks.aspx.cs" Inherits="WebApplication3.AddMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Add Marks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">View Assessments</li>
        <li class="breadcrumb-item active">Add Marks</li>
    </ol>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Add Marks
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Assessment Marks</h2>
        <h3>MAPV311 Semester Test 1</h3>
        <hr />
        <br />
        <asp:GridView ID="gridViewMarks" runat="server"></asp:GridView>
        <%--<div class="table-responsive">
            <table class="table table-hover" id="markTable">
                <thead>
                    <tr class="table-primary">
                        <th scope="col">Student Number</th>
                        <th scope="col">First Name</th>
                        <th scope="col">LastName</th>
                        <th scope="col">Assessment Mark (40)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="table-secondary">
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True">Enter Mark</td>
                    </tr>
  
                </tbody>
            </table>
        </div>--%>
    </div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/JQuery /?.?.?/JQuery .min.js" type="text/javascript"> </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script src="datatable.js"></script>
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("markTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</asp:Content>
