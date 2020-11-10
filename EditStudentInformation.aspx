<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStudentInformation.aspx.cs" Inherits="WebApplication3.EditStudentInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Edit Student Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
	<style>
		/*add styles here later*/
	</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">STUDENT_NAME</a></li>
		<li class="breadcrumb-item active">Edit Student Information</li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Edit Student Information
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<h2>Student Information</h2>
		<hr />
		<br />
		<form>
			<fieldset>
				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">First Names</label>
					<asp:TextBox ID="firstNames" class="form-control is-invalid" runat="server"></asp:TextBox>
					<div class="invalid-feedback">First name is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Last Name</label>
					<input type="text" class="form-control is-invalid" id="inputInvalidLastName">
					<div class="invalid-feedback">Last name is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Student Number</label>
					<input type="text" onkeypress="return isNumberKey(event)" class="form-control is-invalid" id="inputInvalidStaffNumber">
					<div class="invalid-feedback">Staff number is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">ID Number</label>
					<input type="text" onkeypress="return isNumberKey(event)" class="form-control is-invalid" id="inputInvalidIdNumber">
					<div class="invalid-feedback">ID number is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Email address</label>
					<input type="email" class="form-control is-invalid" id="inputInvalidEmail">
					<div class="invalid-feedback">Email is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Cell Phone Number</label>
					<input type="text" onkeypress="return isNumberKey(event)" class="form-control is-invalid" id="inputInvalidCellNumber">
					<div class="invalid-feedback">Cell phone number is required</div>
				</div>

				<div class="form-group">
					<label for="AssDate">Date Registered</label>
					<input type="datetime-local" class="form-control" id="AssDate">
				</div>

				<div class="form-group">
					<label for="AssType">Year Of Study</label>
					<select class="form-control" id="YearOfStudy">
						<option>1.</option>
						<option>2.</option>
						<option>3.</option>
						<option>4.</option>
					</select>
				</div>

				<div class="form-group">
					<label for="AssType">FACULTY</label>
					<select class="form-control" id="Faculty">
						<option>FACULTY OF SCIENCE</option>
						<option>FACULTY OF HUMANITIES</option>
						<option>FACULTY OF BUSINESS AND ECONOMIC SCIENCES</option>
						<option>FACULTY OF EDUCATION</option>
						<option>FACULTY OF ENGINEERING, THE BUILT ENVIRONMENT AND TECHNOLOGY </option>
						<option>FACULTY OF HEALTH SCIENCES</option>
						<option>FACULTY OF LAW</option>
					</select>
				</div>

				<div class="jumbotron">
					<h2>Registered Modules</h2>
					<hr />
					<br />

					<table class="table table-hover custome-table-props marks-table">
						<thead>
							<tr>
								<th>Module Code</th>
								<th>Module Name</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>00000000000000000</td>
								<td>NAME</td>
								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View module</a></td>
							</tr>
							<tr>
								<td>00000000000000000</td>
								<td>NAME</td>
								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View module</a></td>
							</tr>
							<tr>
								<td>00000000000000000</td>
								<td>NAME</td>
								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View module</a></td>
							</tr>
							<tr>
								<td>00000000000000000</td>
								<td>NAME</td>
								<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">View module</a></td>
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

				<br />
				<hr />
				<br />
				<button type="submit" class="btn btn-outline-primary btn-lg">Save Changes</button>
				<button type="button" class="btn btn-outline-danger btn-lg">Cancel</button>
			</fieldset>
		</form>
	</div>
</asp:Content>
