<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlagMarkForm.aspx.cs" Inherits="WebApplication3.FlagMarkForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron">
       <h2>Assessment Information</h2>
            <hr />
            <br />
    <form>
        <fieldset>
           
            <div class="form-group has-danger">
                <label class="form-control-label" for="AssNameDanger">Name</label>
                <input type="text" class="form-control is-invalid" id="inputInvalid">
                <div class="invalid-feedback">Assessment name is required</div>
            </div>

            <div class="form-group">
                <label for="AssDesc">Reason for flag</label>
                <textarea class="form-control" id="AssDesc" rows="4"></textarea>
            </div>

            <hr />
            <br />
            <button type="submit" class="btn btn-outline-primary btn-lg">Send flag notification</button>
            <button type="button" class="btn btn-outline-danger btn-lg">Cancel</button>
        </fieldset>
    </form>
   </div>
</asp:Content>
