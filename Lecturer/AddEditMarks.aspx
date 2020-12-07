<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditMarks.aspx.cs" Inherits="WebApplication3.Lecturer.AddEditMarks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    View Marks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <style>
        .gridview {
    width: 100%; 
    word-wrap:break-word;
    table-layout: fixed;
}
        .btn-rounded-border {
            border-radius: 8px;
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
        <li class="breadcrumb-item"><a href="#"><p id="txtModuleName" runat="server"></p></a></li>
        <li class="breadcrumb-item"><a href="#">View Assessments</a></li>
        <li class="breadcrumb-item active"><a href="#">Add/Edit Marks</a></li>
    </ol> </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
    View Marks
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Assessment Marks</h2>
        <h3><p id="txtHeader" runat="server"></p></h3>
        <hr />
        <br />

        <asp:GridView ID="gridViewMarks" runat="server" AutoGenerateColumns="False" DataKeyNames="studentNumber" DataSourceID="sqlMarksSource"
          AllowSorting="True"  AllowPaging="True" OnPageIndexChanging="OnPaging" AutoPostBack="True" class="table table-responsive table-hover"  HeaderStyle-CssClass="table-primary" GridLines="Horizontal" BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="studentNumber" HeaderText="Student Number" ReadOnly="True" SortExpression="studentNumber" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                <asp:BoundField DataField="surname" HeaderText="Last Name" SortExpression="surname" />
                <asp:TemplateField HeaderText="Mark" SortExpression="markCaptured">
                       <ItemTemplate>
                           <asp:TextBox ID="txtMarks" runat="server" TextMode="Number" min="0" max="100" step="1" Text='<%# Bind("markCaptured") %>' CssClass="form-control"  />
                           <asp:RangeValidator ID="markRangeValidator" runat="server" ControlToValidate="txtMarks" ErrorMessage="Mark must be between 0 and 100" ForeColor="Red" Type="Integer" Display="Dynamic" MinimumValue="0" MaximumValue="100"></asp:RangeValidator>
                           <asp:RequiredFieldValidator ID="requiredMarValidator" runat="server" ErrorMessage="Mark is required" ControlToValidate="txtMarks" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>      
                       </ItemTemplate>
                </asp:TemplateField>
            </Columns> 
        </asp:GridView>
        <asp:SqlDataSource ID="sqlMarksSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ConnectionString1.ProviderName %>"
            SelectCommand="SELECT Student.studentNumber, Student.firstName, Student.surname, [Assessment Results].markCaptured FROM (([Assessment Results] INNER JOIN Student ON [Assessment Results].studentNumber = Student.studentNumber) INNER JOIN Student Student_1 ON [Assessment Results].studentNumber = Student_1.studentNumber) WHERE ([Assessment Results].assessmentID = ?)">
            <SelectParameters>
              <asp:SessionParameter DefaultValue="1008" Name="assessmentID" SessionField="AssessmentID" Type="String" />
          </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Button ID="btnUpdate" class="btn btn-outline-primary btn-lg btn-rounded-border" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
    <asp:Button ID="btnCancel" class="btn btn-outline-danger btn-lg btn-rounded-border" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
     

</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
       <script src="//ajax.googleapis.com/ajax/libs/JQuery /?.?.?/JQuery .min.js" type="text/javascript"> </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script src="datatable.js"></script>
</asp:Content>