<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerViewAssessments.aspx.cs" Inherits="WebApplication3.LecturerViewAssessments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
          .lecturer-details-grid-container {
			display: grid;
			grid-template-columns: 1fr;
			grid-gap: 40px;
		}

		.material-icons.md-68 {
			font-size: 68px;
		}

		.grid-icon {
			place-self: center;
		}

		#links-to-stats-grid-container {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
			grid-gap: 20px;
		}

		.grid-button-container {
			border-radius: 7px;
			padding: 20px;
			background-color: rgb(233,236,239);
			border: solid;
			border-width: 1px;
			border-color: darkgrey;
			text-align: center;
		}

		.btn-rounded-border {
			border-radius: 8px;
			margin-top: 10px;
		}
    </style>
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
        <li class="breadcrumb-item active">Assessments</li>
    </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
      
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
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
                    <th></th>
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
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Edit Assessment</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Add Marks</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Marks</button></td>

                </tr>
                <tr>
                    <td>Semester Test 1</td>
                    <td>Closed book test based on work covered from week 1 to 4</td>
                    <td>2020/03/28</td>
                    <td>Semester Test</td>
                    <td>09_0205</td>
                    <td>35%</td>
                   <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Assessment</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Add Marks</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Marks</button></td>
                </tr>
                <tr>
                    <td>Semester Test 2</td>
                    <td>Closed book test based on work covered from week 5 to 9</td>
                    <td>2020/05/10</td>
                    <td>Semester Test</td>
                    <td>09_0205</td>
                    <td>25%</td>
                   <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Assessment</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Add Marks</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Marks</button></td>
                </tr>
                <tr>
                    <td>Research Assignment</td>
                    <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque cursus neque est, eu elementum leo aliquet et. Pellentesque tempus metus vehicula blandit ultrices.</td>
                    <td>2020/09/10</td>
                    <td>Assignment</td>
                    <td>Submit via Moodle</td>
                    <td>10%</td>
                   <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" >Edit Assessment</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Add Marks</button></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary btn-sm btn-rounded-border" disabled>Edit Marks</button></td>
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
      <br />
      <hr />
      <br />
       <div id="container">
            <div class="row justify-content-center">
                <div class="grid-button-container col-4">
                    <a href="LecturerStudentView.aspx" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Add Assessment</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
