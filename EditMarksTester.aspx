<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditMarksTester.aspx.cs" Inherits="WebApplication3.EditMarksTester" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
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
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">View Assessments</li>
        <li class="breadcrumb-item active">Add Marks</li>
    </ol>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
    Edit Marks
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
        <h2>Assessment Marks</h2>
        <h3>MAPV311 Semester Test 1</h3>
        <hr />
        <br />

           
        <asp:GridView ID="gridViewMarks" AutoGenerateEditButton="true"  runat="server" class="table table-responsive table-hover gridview" HeaderStyle-CssClass="table-primary" GridLines="Horizontal" BorderStyle="None" OnRowDataBound="gridViewMarks_RowDataBound" OnRowCancelingEdit="gridViewMarks_RowCancelingEdit" OnRowEditing="gridViewMarks_RowEditing" OnRowUpdating="gridViewMarks_RowUpdating" OnRowUpdated="gridViewMarks_RowUpdated"
            >
            <HeaderStyle CssClass="table-primary"></HeaderStyle>
        </asp:GridView>
    </div>
    <div class ="jumbotron text-danger">
          <asp:Label ID ="Warning" Text=" " class="text-danger" runat="server" ></asp:Label>
      </div>

    <asp:Button ID="btnSubmit" class="btn btn-outline-primary btn-lg btn-rounded-border" runat="server" Text="Submit"/>
    <asp:Button ID="btnCancel" class="btn btn-outline-danger btn-lg btn-rounded-border" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
     
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
      <script src="//ajax.googleapis.com/ajax/libs/JQuery /?.?.?/JQuery .min.js" type="text/javascript"> </script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <script src="datatable.js"></script>
</asp:Content>
