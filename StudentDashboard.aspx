<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="WebApplication3.StudentDashboard" %>
 
<asp:Content ContentPlaceHolderID="Custom_styles_placeholder" runat="server"> 
    <style>
        .grid-container{
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
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="mainHeading" runat="server"> 
    Registered Modules
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <h2>Welome, First Name</h2>
            <p>
                Black i saw beyonces tizzles and my pizzle went crizzle you son of a bizzle sit amizzle, da bomb adipiscing elit. Its fo rizzle break it down velizzle, fo shizzle my nizzle volutpat, suscipizzle yo mamma, gravida vel, arcu. Pellentesque for sure bling bling. Sizzle erizzle.
            </p>
        </div>
    </div>
    
    <div class="grid-container">
        <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>WRR301-Project</h4>
            </div>
            <img src="Image/CS_logo.png" alt="module-image" class="module-img"/>
        </div>
              <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>MSCV101-Generic Engineering</h4>
            </div>
            <img src="Image/Engineering_logo.png" alt="module-image" class="module-img" />
        </div>
             <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>WRAV301-Advanced Programming</h4>
            </div>
            <img src="Image/CS_logo.png" alt="module-image" class="module-img" />
        </div>
        <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>BDSM101-Generic Business Module</h4>
            </div>
            <img src="Image/Business_logo.png" alt="module-image" class="module-img" />
        </div>
            <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>MAPV301-Partial Differential Equations</h4>
            </div>
            <img src="Image/Math_logo.png" alt="module-image"class="module-img" />
        </div>
              <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>WRDV301-Database systems</h4>
            </div>
            <img src="Image/CS_logo.png" alt="module-image" class="module-img"/>
        </div>
       
            <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>MAPV101-Graph Theory</h4>
            </div>
            <img src="Image/Math_logo.png" alt="module-image"class="module-img" />
        </div>
       <div class ="module-grid-item">
            <div class="grid-heading">
                <h4>BDSM102-Generic Business Module 2</h4>
            </div>
            <img src="Image/Business_logo.png" alt="module-image" class="module-img" />
        </div>
     </div>
    
</asp:Content>
