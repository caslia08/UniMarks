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
					<label class="form-control-label" for="AssNameDanger">Student Number</label>
					<asp:TextBox ID="studentNum" class="form-control is-valid" Enabled="false" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">ID Number</label>
					<asp:TextBox ID="idNumber" class="form-control is-valid" Enabled="false" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">First Names</label>
					<asp:TextBox ID="firstNames" class="form-control is-valid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Last Name</label>
					<asp:TextBox ID="lastName" class="form-control is-valid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Email address</label>
					<asp:TextBox ID="email" class="form-control is-valid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Title</label>
					<asp:TextBox ID="title" class="form-control is-valid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group">
					<label for="AssType">Year Of Study</label>
					<asp:DropDownList ID="yearOfStudy" class="form-control" runat="server">
						<asp:ListItem>One</asp:ListItem>
						<asp:ListItem>Two</asp:ListItem>
						<asp:ListItem>Three</asp:ListItem>
						<asp:ListItem>Four</asp:ListItem>

					</asp:DropDownList>

				</div>

				<div class="form-group">
					<label for="AssType">FACULTY</label>
					<asp:DropDownList ID="faculty" class="form-control" runat="server">
						<asp:ListItem>FACULTY OF SCIENCE</asp:ListItem>
						<asp:ListItem>FACULTY OF HUMANITIE</asp:ListItem>
						<asp:ListItem>FACULTY OF BUSINESS AND ECONOMIC SCIENCE</asp:ListItem>
						<asp:ListItem>FACULTY OF EDUCATION</asp:ListItem>
						<asp:ListItem>FACULTY OF ENGINEERING, THE BUILT ENVIRONMENT AND TECHNOLOGY</asp:ListItem>
						<asp:ListItem>FACULTY OF HEALTH SCIENCES</asp:ListItem>
						<asp:ListItem>FACULTY OF LAW</asp:ListItem>
					</asp:DropDownList>
				</div>

				<div class="jumbotron">
					<h2>Registered Modules</h2>
					<hr />
					<br />
					<%--<asp:GridView ID="moduleView" class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" runat="server" AutoGenerateColumns="False">--%>

					<asp:GridView ID="moduleView" runat="server" AutoGenerateColumns="False" AllowSorting="True"
						class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" Width="100%"
						GridLines="Horizontal" BorderStyle="None">
						<Columns>
							<asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
						</Columns>
						<HeaderStyle CssClass="table-primary"></HeaderStyle>
					</asp:GridView>



				</div>

				<br />
				<hr />
				<br />
				<asp:Button ID="submit" class="btn btn-outline-primary btn-lg" runat="server" Text="Save Changes" OnClick="submit_Click" />
				<asp:Button ID="cancle" class="btn btn-outline-danger btn-lg" runat="server" Text="Cancel" OnClick="cancle_Click" />
			</fieldset>
		</form>
	</div>
</asp:Content>
