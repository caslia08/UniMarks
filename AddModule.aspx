<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddModule.aspx.cs" Inherits="WebApplication3.EditModuleDetials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Add Module 
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
	Add Module 
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<h2>Module Information</h2>
		<hr />
		<br />
		<form>
			<fieldset>
				<div class="form-group has-danger">
					<label class="form-control-label" for="AssNameDanger">Full Module Name</label>
					<asp:TextBox ID="moduleName" class="form-control is-invalid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label">Module Code</label>
					<asp:TextBox ID="moduleCode" class="form-control is-invalid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group has-danger">
					<label class="form-control-label">Module Lecturer Number</label>
					<asp:TextBox ID="moduleLecture" class="form-control is-invalid" runat="server"></asp:TextBox>
				</div>

				<div class="form-group">
					<label for="AssDesc">Description</label>
					<asp:TextBox ID="moduleDsc" runat="server" class="form-control" placeholder="Module Description" TextMode="MultiLine" Rows="5"></asp:TextBox>					
				</div>

				<div class="form-group">
					<%--<label for="AssDesc">Module students</label>--%>
					<asp:GridView ID="studentView" class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" runat="server" AutoGenerateColumns="False">
						<Columns>
							<asp:BoundField DataField="studentNumber" HeaderText="studentNumber" ReadOnly="True" SortExpression="studentNumber" />
							<asp:BoundField DataField="firtsName" HeaderText="firtsName" SortExpression="firtsName" />
							<asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
						</Columns>
						<HeaderStyle CssClass="table-primary"></HeaderStyle>
					</asp:GridView>				

				</div>

				<div class="form-group">
					<%--<label for="AssDesc">Module assesments</label>--%>

					<asp:GridView ID="moduleAssesmentView" class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" runat="server" AutoGenerateColumns="False">
						<Columns>
							<asp:BoundField DataField="assessmentID" HeaderText="assessmentID" SortExpression="assessmentID" />
						</Columns>
						<HeaderStyle CssClass="table-primary"></HeaderStyle>
					</asp:GridView>				


				</div>


				<br />
				<hr />
				<br />
				<asp:Button ID="createBnt" class="btn btn-outline-primary btn-lg btn-rounded-border" runat="server" Text="Create" OnClick="createBnt_Click" />
				<asp:Button ID="cancelBnt" class="btn btn-outline-danger btn-lg" runat="server" Text="Cancel" OnClick="cancelBnt_Click" />
			</fieldset>
		</form>

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

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
