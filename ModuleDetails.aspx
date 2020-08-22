<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleDetails.aspx.cs" Inherits="WebApplication3.ModuleDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Module Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
	    <style>
        #dashboard-grid-container{
            display: grid;
            grid-gap: 50px;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows:300px 300px 300px;
            margin-top: 50px;
        }
        .module-grid-item{
            background-color: rgba(148, 148, 147, 0.80);
            border-radius: 10px; 
        }
        .module-grid-item:hover{
            box-shadow: 15px 10px 20px 0px rgb(19, 80, 177)
        }
        .grid-heading{
            padding: 10px;
            background-color: rgb(238, 203, 11);
            text-align: center;
            color: rgb(19, 80, 177);
            height: 70px;
            font-weight: bold;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border-bottom: solid;
            border-bottom-color:rgb(19, 80, 177);
            border-bottom-width: 4px;
        }
        .module-img{
            width: 100%;
            height: 230px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            opacity: 0.7;
        }
		#centerHeading{
			  text-align: center;			 
		}

    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainHeading" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
        <h2 id ="centerHeading">Welome, First Name</h2>
    </div>
</asp:Content>
