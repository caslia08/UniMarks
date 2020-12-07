 <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerViewAssessments.aspx.cs" Inherits="WebApplication3.LecturerViewAssessments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
          .lecturer-details-grid-container {
			display: grid;
			grid-template-columns: 1fr;
			grid-gap: 40px;
		}

		.material-icons.md-68 {
			font-size: 68px;
		}

		.grid-icon {
			place-self: center;
		}

		#links-to-stats-grid-container {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
			grid-gap: 20px;
		}

		.grid-button-container {
			border-radius: 7px;
			padding: 20px;
			background-color: rgb(233,236,239);
			border: solid;
			border-width: 1px;
			border-color: darkgrey;
			text-align: center;
		}

		.btn-rounded-border {
			border-radius: 8px;
			margin-top: 10px;
		}


    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#"><p id="txtModuleName" runat="server"></p></a></li>
        <li class="breadcrumb-item active"><a href="#">View Assessments</a></li>
    </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
      
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Module Assessments</h2>
        <hr />
        <br />
      <div><asp:Label ID="lblSearch" runat="server" Text="Search Assessment ID:"></asp:Label>
      <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox></div>
      <br />
      
      <asp:GridView ID="gridViewAssessments" runat="server" AutoGenerateColumns="False" DataKeyNames="assessmentID" DataSourceID="sqlAssessmentDataSource"
          AllowSorting="True" EnableViewState="false" OnPageIndexChanging="OnPaging" AutoPostBack="true" AllowPaging="True" class="table table-responsive table-hover" HeaderStyle-CssClass="table-primary" GridLines="Horizontal" BorderStyle="None" OnRowCommand="gridViewAssessments_RowCommand">
          <Columns>
              <asp:BoundField DataField="assessmentID" HeaderText="Assessment ID" ReadOnly="True" SortExpression="assessmentID" />
              <asp:BoundField DataField="assessmentName" HeaderText="Name" SortExpression="assessmentName" />
              <asp:BoundField DataField="assessmentDescription" HeaderText="Description" SortExpression="assessmentDescription" />
              <asp:BoundField DataField="assessmentType" HeaderText="Assessment Type" SortExpression="assessmentType" />
              <asp:BoundField DataField="assessmentDate" HeaderText="Date" SortExpression="assessmentDate" DataFormatString="{0:d}" HtmlEncode="False" />
              <asp:BoundField DataField="assessmentVenue" HeaderText="Venue" SortExpression="assessmentVenue" />
              <asp:BoundField DataField="classAverage" HeaderText="Class Average" SortExpression="classAverage"  />
              <asp:BoundField DataField="assessmentWeightage" HeaderText="Weightage" SortExpression="assessmentWeightage" />
               <asp:TemplateField>
                   <ItemTemplate>
                       <asp:Button ID="btnEditAss" runat="server" Text="Edit Assessment" class="btn btn-outline-primary btn-sm btn-rounded-border"
                           CommandName="EditStudents" CausesValidation="false" CommandArgument='<%# Eval("assessmentID") %>'
                            />
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField>
                   <ItemTemplate>
                       <asp:Button ID="btnAddMarks" runat="server" Text="View Marks" class="btn btn-outline-primary btn-sm btn-rounded-border"
                           CommandName="AddMarks" CausesValidation="false" CommandArgument='<%# Eval("assessmentID") %>'
                            />
                   </ItemTemplate>
               </asp:TemplateField>
          </Columns>

<HeaderStyle CssClass="table-primary"></HeaderStyle>
        </asp:GridView>

      <asp:SqlDataSource ID="sqlAssessmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" SelectCommand="SELECT [assessmentID], [assessmentName], [assessmentType], [assessmentDescription], [assessmentDate], [assessmentVenue], [classAverage], [assessmentWeightage] FROM [Assessment Information] WHERE ([moduleCode] = ?)">
          <SelectParameters>
              <asp:SessionParameter DefaultValue="MATT212" Name="moduleCode" SessionField="ModuleCode" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
 
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
          <script src="https://code.jquery.com/jquery-3.5.1.jss"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
       
        <script>
            $(document).ready(function () {
                $('.marks-table').DataTable();
            });
        </script>
      <br />
      <hr />
      <br />
       <div id="container">
            <div class="row justify-content-center">
                <div class="grid-button-container col-4">
                    <a href="AddAssessment.aspx" class="btn btn-outline-primary btn-lg btn-rounded-border" role="button">Add Assessment</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
