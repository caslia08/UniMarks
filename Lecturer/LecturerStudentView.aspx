<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerStudentView.aspx.cs" Inherits="WebApplication3.LecturerStudentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    View Students
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item"><a href="#">Module Statistics</a></li>
        <li class="breadcrumb-item active">View Student List</li>
    </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
    Student List
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
       <div class="jumbotron">
        <h2>Module Assessments</h2>
        <hr />
        <br />
      <div><asp:Label ID="lblSearch" runat="server" Text="Search:"></asp:Label>
      <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox></div>
      <br />
      
      <asp:GridView ID="gridViewStudents" runat="server" AutoGenerateColumns="False" DataKeyNames="studentNumber" DataSourceID="sqlViewStudentSource"
          AllowSorting="True"  AllowPaging="True" OnPageIndexChanging="OnPaging" class="table table-responsive table-hover"  HeaderStyle-CssClass="table-primary" GridLines="Horizontal" BorderStyle="None" OnRowCommand="gridViewStudents_RowCommand">
          <Columns>
              <asp:BoundField DataField="studentNumber" HeaderText="Student Number" ReadOnly="True" SortExpression="studentNumber" />
              <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
              <asp:BoundField DataField="surname" HeaderText="Last Name" SortExpression="surname" />
               <asp:TemplateField>
                   <ItemTemplate>
                       <asp:Button ID="btnViewProgress" runat="server" Text="View Progress" class="btn btn-outline-primary btn-sm btn-rounded-border"
                           CommandName="ViewProgress" CausesValidation="false" CommandArgument='<%# Eval("studentNumber") %>'
                            />
                   </ItemTemplate>
               </asp:TemplateField>
          </Columns>

<HeaderStyle CssClass="table-primary"></HeaderStyle>
        </asp:GridView>

     <asp:SqlDataSource ID="sqlViewStudentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>" 
         SelectCommand="SELECT Student.studentNumber, Student.firstName, Student.surname FROM Student INNER JOIN ModuleTaken ON Student.studentNumber = ModuleTaken.studentNumber WHERE (ModuleTaken.moduleCode = ?)">
          <SelectParameters>
              <asp:SessionParameter DefaultValue="MATT212" Name="ModuleCode" SessionField="ModuleCode" Type="String" />
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
