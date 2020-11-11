<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMarksTester.aspx.cs" Inherits="WebApplication3.AddMarksTester" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Add Marks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <style>
        .gridview {
    width: 100%; 
    word-wrap:break-word;
    table-layout: fixed;
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">View Assessments</li>
        <li class="breadcrumb-item active">Add Marks</li>
    </ol>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Add Marks
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Assessment Marks</h2>
        <h3>MAPV311 Semester Test 1</h3>
        <hr />
        <br />
        <asp:GridView ID="gridViewMarks"  runat="server" AllowPaging="True" class="table table-responsive table-hover gridview" HeaderStyle-CssClass="table-primary" GridLines="Horizontal" BorderStyle="None" OnRowDataBound="gridViewMarks_RowDataBound" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowUpdating="gridViewMarks_RowUpdating" >
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="studentNumber" HeaderText="Student Number" SortExpression="studentNumber" ReadOnly="true" />
                <asp:BoundField DataField="surname" HeaderText="Last Name" SortExpression="surname" ReadOnly="True" />
                <asp:BoundField DataField="firtsName" HeaderText="First Name" SortExpression="firtsName" ReadOnly="True"/>
                <asp:BoundField DataField="markCaptured" HeaderText="Mark"  SortExpression="markCaptured" ReadOnly="false"/>
            </Columns>
            <HeaderStyle CssClass="table-primary"></HeaderStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Student.studentNumber, Student.surname, Student.firtsName, [Assessment Results].markCaptured FROM Student INNER JOIN[Assessment Results] ON Student.[studentNumber] = [Assessment Results].[studentNumber] WHERE ([Assessment Results].assessmentID = ?)" UpdateCommand="UPDATE [Assessment Results] SET (markCaptured = ?) ">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="98405" Name="?" QueryStringField="AssID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/JQuery /?.?.?/JQuery .min.js" type="text/javascript"> </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script src="datatable.js"></script>
</asp:Content>

