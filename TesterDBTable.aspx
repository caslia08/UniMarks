<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TesterDBTable.aspx.cs" Inherits="WebApplication3.TesterDBTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavListElements" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Login_LogoutButton" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BreadCrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="mainHeading" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
