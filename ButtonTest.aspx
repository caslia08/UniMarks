<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ButtonTest.aspx.cs" Inherits="WebApplication3.ButtonTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
	<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>


