<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditLecturerInformation.aspx.cs" Inherits="WebApplication3.EditLecturerInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Search Lecturers
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
	<script language="Javascript">
		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : evt.keyCode;
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
			return true;
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">Search Module</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Search Module
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<h2>Search Lecturer</h2>
		<hr />
		<br />

		<table class="table table-hover custome-table-props marks-table">
			<thead>
				<tr>
					<th>Module Code</th>
					<th>Module Name</th>
					<th>Module Lecturer</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>00000000000</td>
					<td>NAME</td>
					<td>NAME</td>
					<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">Edit Module Details</a></td>
				</tr>
				<tr>
					<td>00000000000</td>
					<td>NAME</td>
					<td>NAME</td>
					<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">Edit Module Details</a></td>
				</tr>
				<tr>
					<td>00000000000</td>
					<td>NAME</td>
					<td>NAME</td>
					<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">Edit Module Details</a></td>
				</tr>
				<tr>
					<td>00000000000</td>
					<td>NAME</td>
					<td>NAME</td>
					<td><a href="#" class="btn btn-outline-primary btn-sm btn-rounded-border" role="button">Edit Module Details</a></td>
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
