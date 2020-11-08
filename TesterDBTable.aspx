<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TesterDBTable.aspx.cs" Inherits="WebApplication3.TesterDBTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>

    </style>
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
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="studentNumber"
        class="">
        <Columns>
            <asp:BoundField DataField="studentNumber" HeaderText="studentNumber" ReadOnly="True" SortExpression="studentNumber" />
            <asp:BoundField DataField="firtsName" HeaderText="firtsName" SortExpression="firtsName" />
            <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="emailAddress" HeaderText="emailAddress" SortExpression="emailAddress" />
            <asp:BoundField DataField="IDNumber" HeaderText="IDNumber" SortExpression="IDNumber" />
            <asp:BoundField DataField="dateOfRegistration" HeaderText="dateOfRegistration" SortExpression="dateOfRegistration" />
            <asp:BoundField DataField="yearOfStudy" HeaderText="yearOfStudy" SortExpression="yearOfStudy" />
            <asp:BoundField DataField="qualificationCode" HeaderText="qualificationCode" SortExpression="qualificationCode" />
            <asp:BoundField DataField="qualificationName" HeaderText="qualificationName" SortExpression="qualificationName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
