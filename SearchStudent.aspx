<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchStudent.aspx.cs" Inherits="WebApplication3.AdminHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	View Student
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .btn-rounded-border {
            border-radius: 8px;
        }
        .custome-table-props{
            background-color: white;
            margin: 10px;
        }
        .no-mark{
            color: grey;
            font-size:small;
        }
    </style>
	<script language="Javascript">
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
		<li class="breadcrumb-item"><a href="#">Search Lecturer</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	View Student
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>View Student</h2>
        <hr />
        <br />
 
		<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="studentNumber" DataSourceID="SqlDataSource1"
			class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" OnRowCommand="GridView1_RowCommand"
			>
			<Columns>
				<asp:BoundField DataField="studentNumber" HeaderText="studentNumber" ReadOnly="True" SortExpression="studentNumber" />
				<asp:BoundField DataField="firtsName" HeaderText="firtsName" SortExpression="firtsName" />
				<asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
				<asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
				<asp:BoundField DataField="emailAddress" HeaderText="emailAddress" SortExpression="emailAddress" />
				<asp:BoundField DataField="IDNumber" HeaderText="IDNumber" SortExpression="IDNumber" />
				<asp:BoundField DataField="dateOfRegistration" HeaderText="dateOfRegistration" SortExpression="dateOfRegistration" />
				<asp:BoundField DataField="yearOfStudy" HeaderText="yearOfStudy" SortExpression="yearOfStudy" />
				<asp:BoundField DataField="qualificationCode" HeaderText="qualificationCode" SortExpression="qualificationCode" />
				<asp:BoundField DataField="qualificationName" HeaderText="qualificationName" SortExpression="qualificationName" />
							                 <asp:TemplateField>
                   <ItemTemplate>
                    <asp:Button ID="btnEditSdnt" runat="server" Text="Edit Student" class="btn btn-outline-primary btn-sm btn-rounded-border"
                             CommandName="EditStudent" CausesValidation="false" CommandArgument='<%# Eval("studentNumber") %>' />
                   </ItemTemplate>
               </asp:TemplateField>
			</Columns>
		</asp:GridView>
       

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
       

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
