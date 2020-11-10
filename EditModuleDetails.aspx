<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditModuleDetails.aspx.cs" Inherits="WebApplication3.EditModuleDetials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Edit Module Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
    	.btn-rounded-border {
    		border-radius: 8px;
    	}

    	.custome-table-props {
    		background-color: white;
    		margin: 10px;
    	}

    	.no-mark {
    		color: grey;
    		font-size: small;
    	}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">MODULE_NAME</a></li>
		<li class="breadcrumb-item active">Edit Module Details</li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Edit Module Details
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<h2>Module Information</h2>
		<hr />
		<br />
			<fieldset>
				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Full Module Name</label>
					<asp:TextBox ID="ddddddddd" class="form-control is-invalid" runat="server"></asp:TextBox>
					<div class="invalid-feedback">Module name is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label">Module Code</label>
					<input type="text" class="form-control is-invalid" id="inputInvalidCode">
					<div class="invalid-feedback">Module code is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label">Module Lecturer</label>
					<input type="text" class="form-control is-invalid" id="inputInvalidLecturer">
					<div class="invalid-feedback">Module lecturer is required</div>
				</div>

				<div class="form-group">
					<label for="AssDesc">Description</label>
					<textarea class="form-control" id="AssDesc" rows="4"></textarea>
				</div>

				<div class="form-group">
					<label for="AssDesc">Module students</label>

					<table class="table table-hover custome-table-props module-students">
						<thead>
							<tr>
								<th>Student Number</th>
								<th>Last Name</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00000000000000</td>
								<td>LORD JASSON </td> <%--Was here--%>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Studnet</a></td>
							</tr>
							<tr>
								<td>00000000000000</td>
								<td>Basson </td>

								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View Studnet</a></td>
							</tr>
							<tr>
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

				<div class="form-group">
					<label for="AssDesc">Module assesments</label>

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

				<asp:Button ID="Button1" runat="server" Text="Button" />
				<br />
				<hr />
				<br />
			</fieldset>
	</div>
</asp:Content>