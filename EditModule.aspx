<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditModule.aspx.cs" Inherits="WebApplication3.EditModule" %>

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
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">MODULE_NAME</a></li>
		<li class="breadcrumb-item active">Edit Module Details</li>
	</ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
	Edit Module
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<h2>Module Information</h2>
		<hr />
		<br />
		<form>
			<fieldset>

				<div class="form-group has-danger">
					<label class="form-control-label">Module Code</label>
					<asp:TextBox ID="mdCode" class="form-control is-valid" runat="server" Enabled="false"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Full Module Name</label>
					<asp:TextBox ID="moduleName" class="form-control is-valid" runat="server"></asp:TextBox>
				</div>


				<div class="form-group has-danger">
					<label class="form-control-label">Module Lecturer Number</label>
					<asp:DropDownList ID="lecutureDrop" class="form-control" runat="server"></asp:DropDownList>
				</div>


				<div class="form-group">
					<label for="AssDesc">Module students</label>

					<asp:GridView ID="studentView" runat="server" AutoGenerateColumns="False" AllowSorting="True"
						class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" Width="100%"
						GridLines="Horizontal" BorderStyle="None">
						<Columns>
							<asp:BoundField DataField="studentNumber" HeaderText="studentNumber" ReadOnly="True" SortExpression="studentNumber" />
							<asp:BoundField DataField="firstName" HeaderText="firtsName" SortExpression="firtsName" />
							<asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
							<asp:BoundField DataField="emailAddress" HeaderText="emailAddress" SortExpression="emailAddress" />
						</Columns>

						<HeaderStyle CssClass="table-primary"></HeaderStyle>
					</asp:GridView>

				</div>

				<div class="form-group">
					<label for="AssDesc">Module assesments</label>

					<asp:GridView ID="moduleAssesmentView" class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" runat="server" AutoGenerateColumns="False">
						<Columns>
							<asp:BoundField DataField="assessmentID" HeaderText="assessmentID" SortExpression="assessmentID" />
							<asp:BoundField DataField="assessmentName" HeaderText="assessmentName" SortExpression="assessmentName" />
							<asp:BoundField DataField="assessmentType" HeaderText="assessmentType" SortExpression="assessmentType" />
							<asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
						</Columns>
						<HeaderStyle CssClass="table-primary"></HeaderStyle>
					</asp:GridView>
				</div>

				<br />
				<hr />
				<br />
				<asp:Button ID="saveBtn" class="btn btn-outline-primary btn-lg btn-rounded-border" runat="server" Text="Save" OnClick="saveBtn_Click" />
				<asp:Button ID="cancelBtn" class="btn btn-outline-danger btn-lg" runat="server" Text="Cancel" OnClick="cancelBtn_Click" />
			</fieldset>
		</form>


		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Form submission</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<h3>Form submission unccessessful.</h3>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Rety</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
