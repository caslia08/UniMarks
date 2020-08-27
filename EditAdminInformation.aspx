<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAdminInformation.aspx.cs" Inherits="WebApplication3.EditAdminInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Edit Admin Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
		<style>
	  .btn-rounded-border {
			border-radius: 8px;
			margin-top: 10px;
		}
        /*add styles here later*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="AdminHomePage.aspx">Profile</a></li>			
		<li class="breadcrumb-item active">Edit Admin Profile</li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Edit Admin Information
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
		<div class="jumbotron">
		<h2>Admin Information</h2>
		<hr />
		<br />
		<form>
			<fieldset>
				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">First Names</label>
					<input type="text" class="form-control is-invalid" id="inputInvalidFirstName">
					<div class="invalid-feedback">First name is required</div>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Last Name</label>
					<input type="text" class="form-control is-invalid" id="inputInvalidLastName">
					<div class="invalid-feedback">Last name is required</div>
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
					<label class="form-control-label" for="AssNameDanger">Staff Number</label>
					<input type="text" onkeypress="return isNumberKey(event)" class="form-control is-invalid" id="inputInvalidStaffNumber">
					<div class="invalid-feedback">Staff number is required</div>
				</div>
				
				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Office Number</label>
					<input type="text" onkeypress="return isNumberKey(event)" class="form-control is-invalid" id="inputInvalidCellNumber">
					<div class="invalid-feedback">Cell phone number is required</div>
				</div>

				<div class="form-group">
					<label for="AssType">FACULTY</label>
					<select class="form-control" id="AssType">
						<option>FACULTY OF SCIENCE</option>
						<option>FACULTY OF HUMANITIES</option>
						<option>FACULTY OF BUSINESS AND ECONOMIC SCIENCES</option>
						<option>FACULTY OF EDUCATION</option>
						<option>FACULTY OF ENGINEERING, THE BUILT ENVIRONMENT AND TECHNOLOGY </option>
						<option>FACULTY OF HEALTH SCIENCES</option>
						<option>FACULTY OF LAW</option>
					</select>
				</div>
											
				<br />
				<hr />
				<br />
				<button type="submit" class="btn btn-outline-primary btn-lg btn-rounded-border">Save Changes</button>
				<button type="button" class="btn btn-outline-danger btn-lg btn-rounded-border">Cancel</button>
			</fieldset>
		</form>
	</div>
</asp:Content>
