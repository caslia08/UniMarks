<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditLecturerInformation.aspx.cs" Inherits="WebApplication3.EditLecturerInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Edit Lecturer Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
	<style>
        /*add styles here later*/
    </style>
	<script language=Javascript>
      function isNumberKey(evt)
      {
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
        <li class="breadcrumb-item"><a href="#">LECTURER_NAME</a></li>        
        <li class="breadcrumb-item active">Edit Lecturer Information</li>
    </ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Edit Lecturer Information
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
    <h2>Module Information</h2>
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
                <label class="form-control-label" for="AssNameDanger">Staff Number</label>
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
                <label for="AssDesc">Module assesment</label>
                <label for="AssDesc">Table of students -- @NOTE will complete when alias commits her addmarks page. I need dem styles lolzz</label>
            </div>


			<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
				<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
				<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
				<SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
				<SortedAscendingCellStyle BackColor="#F7F7F7" />
				<SortedAscendingHeaderStyle BackColor="#4B4B4B" />
				<SortedDescendingCellStyle BackColor="#E5E5E5" />
				<SortedDescendingHeaderStyle BackColor="#242121" />
			</asp:GridView>


			<br />
            <hr />
            <br />
            <button type="submit" class="btn btn-outline-primary btn-lg">Save Changes</button>
            <button type="button" class="btn btn-outline-danger btn-lg">Cancel</button>
        </fieldset>
    </form>
   </div>

</asp:Content>
