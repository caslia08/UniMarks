<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TesterDBTable.aspx.cs" Inherits="WebApplication3.TesterDBTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
       .border_styling {
  border-top-style: none;
  border-right-style: none;
  border-bottom-style: solid;
  border-left-style: none;
}
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
   

    <asp:GridView ID="GridView1" runat="server"  DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="studentNumber"
         AllowPaging="True" PageSize="10" class="table table-responsive table-hover table-secondary" HeaderStyle-CssClass="table-primary" GridLines="Horizontal">
        
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
            <asp:TemplateField  HeaderText="finalamount">
                   <ItemTemplate>
                       <asp:Label  Text="HI I dunno what you do " runat="server" />
                   </ItemTemplate>
                   <FooterTemplate>
                       <asp:Button Text="Save" runat="server" />
                   </FooterTemplate>
               </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="jumbotron">
       <h2>Assessment Information</h2>
            <hr />
            <br />
        <fieldset>
            <div class="form-group">
                <label>Assessment ID</label>
                <br />
                <asp:TextBox ID="txtAssID" runat="server" class="form-control" ></asp:TextBox>
            </div>          

             <div class="form-group">
                <label for="AssDesc">Description</label>
                                 <br />

                <asp:TextBox ID="txtAssDesc" runat="server" TextMode="MultiLine" Rows="5" class="form-control"></asp:TextBox>
            </div>
              <div class="form-group">
                <label for="AssType">Assessment Type</label>
                                  <br />

                <asp:DropDownList ID="dropAssType" runat="server" class="form-control">
                      <asp:ListItem Text="Semester Test" Value="Semester Test" />
                      <asp:ListItem Text="Assignment" Value="Assignment" />
                      <asp:ListItem Text="Presentation" Value="Presentation" />
                      <asp:ListItem Text="Tutorial Test" Value="Tutorial Test" />
                </asp:DropDownList>             
            </div>

              <div class="form-group">
                <label for="AssDate">Date</label>
                                  <br />

                 <asp:TextBox ID="txtDate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="AssVenue">Venue</label>
                                <br />

                <asp:TextBox ID="txtAssVenue" runat="server" class="form-control"></asp:TextBox>
            </div>

             <div class="form-group">
                <label for="AssWeight">Assessment Weightage</label>
                                 <br />

                 <asp:DropDownList ID="dropAssWeight" runat="server" class="form-control">
                     <asp:ListItem Text="5%" Value="5"></asp:ListItem>
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
            <asp:Button ID="btnCreateAss" type="button" class="btn btn-outline-primary btn-lg btn-rounded-border" onclick="btnCreateAss_OnClick" runat="server" Text="Create" />
            <asp:Button ID="btnCancelAss" type="button" class="btn btn-outline-danger btn-lg btn-rounded-border"  runat="server" Text="Cancel" />
            <asp:Label ID="MessageLabel" runat="server" Text="Label"></asp:Label>
        </fieldset>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
