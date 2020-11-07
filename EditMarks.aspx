<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditMarks.aspx.cs" Inherits="WebApplication3.EditMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Edit Marks
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
        <li class="breadcrumb-item active">Edit Marks</li>
    </ol>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Edit Marks
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Assessment Marks</h2>
        <h3>MAPV311 Semester Test 1</h3>
        <hr />
        <br />
        <div class="container">
            <div class="row">
                  <div class="col-auto mr-auto">
                    <form class="form-inline">
                        <label class="my-1 mr-2" for="inlineFormCustomSelectPref">Show</label>
                        <select class="custom-select my-1 mr-sm-2" id="selectOptions">
                            <option value="1">10</option>
                            <option value="2">25</option>
                            <option value="3">50</option>
                            <option value="4">100</option>
                        </select>
                        <div class="my-1 mr-sm-2">
                            <label class="my-1 mr-sm-2 label" for="customControlInline">Entries</label>
                        </div>
                    </form>
                </div>
                <div class="col-auto">
                    <div class="form-group row">
                        <label class="col-form-label col-sm-2" for="myInput">Search</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Search for Student">
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
        <br />
        <div class="table-responsive">
            <table class="table " id="markTable">
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
                        <td contenteditable="True">23</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">40</td>
                    </tr>
                    <tr class="table-danger">
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True" class="text-danger"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>Enter Mark</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">35</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True">20</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">15</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">23</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215632489</td>
                        <td>Jane</td>
                        <td>Doe</td>
                        <td contenteditable="True">40</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>219563248</td>
                        <td>Jean</td>
                        <td>Dough</td>
                        <td contenteditable="True">27</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>217563245</td>
                        <td>Jeans</td>
                        <td>Though</td>
                        <td contenteditable="True">35</td>
                    </tr>

                    <tr class="table-secondary">
                        <td>215659822</td>
                        <td>Another</td>
                        <td>Name</td>
                        <td contenteditable="True">20</td>
                    </tr>
                    <tr class="table-secondary">
                        <td>214563269</td>
                        <td>John</td>
                        <td>Doe</td>
                        <td contenteditable="True">36</td>
                    </tr>
  
                </tbody>
            </table>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-auto mr-auto">
                    <button type="submit" class="btn btn-outline-primary btn-lg">Save Changes</button>
            <button type="button" class="btn btn-outline-danger btn-lg">Cancel</button>
                </div>
                <div class="col-auto">
                    <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link" href="#">&laquo;</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                </li>
            </ul>

                </div>
            </div>
        </div>
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
