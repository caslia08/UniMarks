<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchModule.aspx.cs" Inherits="WebApplication3.SearchModule1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Search Module
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
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
		<li class="breadcrumb-item"><a href="#">Search Lecturer</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
	Search Module
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
	   <div class="jumbotron">
        <h2>Search Module</h2>
        <hr />
        <br />

      <asp:GridView ID="gridViewAssessments" runat="server" AutoGenerateColumns="False" DataKeyNames="moduleCode" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True"
		  class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" OnRowCommand="gridViewAssessments_RowCommand"
		  >
          <Columns>
               <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" ReadOnly="True" SortExpression="moduleCode" />
			   <asp:BoundField DataField="moduleName" HeaderText="moduleName" SortExpression="moduleName" />
			   <asp:BoundField DataField="moduleMarks" HeaderText="moduleMarks" SortExpression="moduleMarks" />
			                 <asp:TemplateField>
                   <ItemTemplate>
                       <asp:Button ID="btnEditAss" runat="server" Text="Edit Module" class="btn btn-outline-primary btn-sm btn-rounded-border"
                             CommandName="EditModule" CausesValidation="false" CommandArgument='<%# Eval("moduleCode") %>' />
                            
                   </ItemTemplate>
               </asp:TemplateField>
          </Columns>

		<HeaderStyle CssClass="table-primary"></HeaderStyle>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Module]"></asp:SqlDataSource>

		          <div id="container">
            <div class="row justify-content-center">
                <div class="grid-button-container col-4">
                    <a href="AddModule.aspx" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Add Module</a>
                </div>
            </div>

        </div>

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
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
