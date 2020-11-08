<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAssessment.aspx.cs" Inherits="WebApplication3.Edit_Assessment" %>
<%@ PreviousPageType VirtualPath="~/LecturerViewAssessments.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Edit Assessment
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
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">View Assessments</li>
          <li class="breadcrumb-item active">Edit Assessment</li>
    </ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Edit Assessment
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
   <div class="jumbotron">
       <h2>Assessment Information</h2>
            <hr />
            <br />
    
            <div class="form-group">
                <label for="txtAssID">ID</label>
                <asp:TextBox ID="txtAssID" runat="server" class="form-control" placeholder="Assessment ID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAssID" ErrorMessage="Assessment ID Required"></asp:RequiredFieldValidator>
            </div>     


            <div class="form-group">
                <label for="txtAssName">
                Name</label>
                <asp:TextBox ID="txtAssName" runat="server" class="form-control" placeholder="Assessment Name"></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="txtAssDesc">Description</label>
                <asp:TextBox ID="txtAssDesc" runat="server" class="form-control" placeholder="Assessment Description" TextMode="MultiLine" Rows="5"></asp:TextBox>
            </div>

              <div class="form-group">
                <label for="txtAssDate">Date</label>
                <asp:TextBox ID="txtAssDate" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="dropAssType" >Assessment Type</label>
                 <asp:DropDownList ID="dropAssType" class="form-control" runat="server">
                     <asp:ListItem Text="Semester Test" Value="Semester Test"></asp:ListItem>
                     <asp:ListItem Text="Assignment" Value="Assignment"></asp:ListItem>
                     <asp:ListItem Text="Presentation" Value="Presentation"></asp:ListItem>
                     <asp:ListItem Text ="Tutorial Test" Value="Tutorial Test"></asp:ListItem>
                 </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtAssVenue">Venue</label>
                <asp:TextBox ID="txtAssVenue" runat="server" class="form-control" placeholder="Assessment Venue" ></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="AssWeight">Assessment Weightage</label>
                 <asp:DropDownList ID="dropAssWeight" class="form-control" runat="server">
                     <asp:ListItem Text="5%"  Value="5"></asp:ListItem>
                     <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                     <asp:ListItem Text="15%" Value="15"></asp:ListItem>
                     <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                     <asp:ListItem Text="25%" Value="25"></asp:ListItem>
                     <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                     <asp:ListItem Text="35%" Value="35"></asp:ListItem>
                     <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                     <asp:ListItem Text="45%" Value="45"></asp:ListItem>
                 </asp:DropDownList>
             </div>
            <br />
            <hr />
            <br />
       <asp:Button ID="btnSaveChanges"  class="btn btn-outline-primary btn-lg btn-rounded-border" runat="server" Text="Save Changes" />
       <asp:Button ID="btnCancelAss" class="btn btn-outline-danger btn-lg btn-rounded-border" runat="server" Text="Cancel" />
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
   </div>

</asp:Content>

