<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerHomePage.aspx.cs" Inherits="WebApplication3.AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Lecturer profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
	<style>
		.lecturer-details-grid-container {
			display: grid;
			grid-template-columns: 1fr 3fr;
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
			grid-template-columns: 1fr 1fr;
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
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">Profile</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Lecturer  profile
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<div class="container">
			<h2>Personal Details</h2>
			<hr />
			<br />
			<div class="lecturer-details-grid-container">
				<div class="grid-icon">
					<i class="material-icons md-68">person</i>
				</div>
				<div class="grid-content">
					<h5 class="grid-content-heading">Personal Details:
					</h5>
					<table class="table table-hover">
						<tr>
							<td>Title:</td>
							<td>Mr</td>
						</tr>
						<tr>
							<td>Full name:</td>
							<td>Commander Shepard</td>
						</tr>
						<tr>
							<td>Email address:</td>
							<td>INeedAJob@IhateWebProgramming.ac.za</td>
						</tr>
						<tr>
							<td>Id number:</td>
							<td>1010101010101010</td>
						</tr>

					</table>
				</div>
				<div class="grid-icon">
					<i class="material-icons md-68">account_balance</i>
				</div>
				<div class="grid-content">
					<h5 class="grid-content-heading">Institutional Details:
					</h5>
					<table class="table table-hover">
						<tr>
							<td>Department:</td>
							<td>FACULTY OF SCIENCE</td>
						</tr>
						<tr>
							<td>Staff number:</td>
							<td>1010101010101010</td>
						</tr>
						<tr>
							<td>Office number:</td>
							<td>+27-000000000</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="jumbotron">
		<h2>Modules and Assesments</h2>
		<hr />
		<br />
		<form>
			<fieldset>


				<div class="form-group">
					<label for="AssDesc">Current Modules</label>

					<table class="table table-hover custome-table-props module-ass">
						<thead>
							<tr>
								<th>Module Code</th>
								<th>Module Name</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>MMMMMM </td>
								<td>Namedadadada </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Assesment</a></td>
							</tr>
							<tr>
								<td>MMMMMM </td>
								<td>Name </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Assesment</a></td>
							</tr>
							<tr>
								<td>MMMMMM </td>
								<td>Name </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Assesment</a></td>
						</tbody>
					</table>
					<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
					<script src="https://code.jquery.com/jquery-3.5.1.jss"></script>
					<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
					<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

					<script>
						$(document).ready(function () {
							$('.module-ass').DataTable(); /*Nice*/
						});
					</script>
				</div>
				
				<br />
				<hr />
				<br />

				<div class="form-group">
					<label for="AssDesc">Flagged Marks</label>

					<table class="table table-hover custome-table-props module-students">
						<thead>
							<tr>
								<th>Assessment Name</th>
								<th>Student Number</th>
								<th>Student Last Name</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00000000000000</td>
								<td>00000000000000</td>
								<td>LORD JASSON </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Studnet</a></td>
							</tr>
							<tr>
								<td>00000000000000</td>
								<td>00000000000000</td>
								<td>Basson </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Studnet</a></td>
							</tr>
							<tr>
								<td>00000000000000</td>
								<td>00000000000000</td>
								<td>Porter </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Studnet</a></td>
						</tbody>
					</table>

					<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
					<script src="https://code.jquery.com/jquery-3.5.1.jss"></script>
					<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
					<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

					<script>
						$(document).ready(function () {
							$('.module-students').DataTable();
						});
					</script>

				</div>
			</fieldset>
		</form>
	</div>

	<div id="links-to-stats-grid-container">
		<div class="grid-button-container">
			<a href="EditAdminInformation.aspx" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Add Student</a>
		</div>
		<div class="grid-button-container">
			<a href="EditAdminInformation.aspx" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Edit Your Profile</a>
		</div>
	</div>
</asp:Content>
