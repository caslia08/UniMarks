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
        .module-img {
            width: 100%;
            height: 230px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            opacity: 0.7;
        }

        .material-icons.md-68 {
            font-size: 68px;
        }

        .grid-icon {
            place-self: center;
        }
        .student-details-grid-container {
            display: grid;
            grid-template-columns: 1fr 3fr;
            grid-gap: 40px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="mainHeading" runat="server"> 
    Registered Modules
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <h2 id="firstNameHeading" runat="server"></h2>
            <hr />
            <br />
            <div class="student-details-grid-container">
                <div class="grid-icon">
                    <i class="material-icons md-68">person</i>
                </div>
                <div class="grid-content">
                    <h5 class="grid-content-heading">Personal Details:
                    </h5>
                    <table class="table table-hover">
                        <tr>
                            <td>Title:</td>
                            <td><p id ="title" runat="server"></p></td>
                        </tr>
                        <tr>
                            <td>Full name:</td>
                            <td id ="fullName" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Email address:</td>
                            <td id="emailAddress" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Id number:</td>
                            <td id="IDNumber" runat="server"></td>
                        </tr>
                    </table>
                </div>
                <div class="grid-icon">
					<i class="material-icons md-68">account_balance</i>
				</div>
                <div class="grid-content">
                    <h5 class="grid-content-heading">Institutional Details:
                    </h5>
                    <table class="table table-hover">
                        <tr>
                            <td>Qualification Name:</td>
                            <td id="qualificatinName" runat="server"></td>
                        </tr>
                        <tr>
                            <td>Student number:</td>
                            <td id="studNum" runat="server"></td>
                        </tr>
                         <tr>
                            <td>Qualification code:</td>
                            <td id="qualificationCode" runat="server"></td>
                        </tr>
                 <%--      <tr>
                            <td>Qualification name:</td>
                            <td id="qualificationName" runat="server">Bsc General</td>
                        </tr>--%>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <div class="grid-container">
   <%--     <asp:Literal ID="dashboardCards" runat="server"></asp:Literal>--%>
        
        <asp:Button ID="btnHiddenLinearAlgebra" runat="server" OnClick="redirectToLinearAlgebra" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_LinearAlgebra(); return true;">
            <div class="grid-heading">
                <h4>Linear Algebra</h4>
            </div>
            <img src="Image/Math_logo.png" alt="module-image"class="module-img" />
        </div>
        
        <script>
            function DivClicked_LinearAlgebra()
            {
                var btnHidden = $('#<%= btnHiddenLinearAlgebra.ClientID %>');
                if(btnHidden != null)
                {
                    btnHidden.click();
                }
            }
        </script>


        <asp:Button ID="Button1" runat="server" OnClick="redirectToRealAnalysis" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_RealAnalysis(); return true;">
            <div class="grid-heading">
                <h4>Real Analysis</h4>
            </div>
            <img src="Image/Math_logo.png" alt="module-image"class="module-img" />
        </div>
        
        <script>
            function DivClicked_RealAnalysis()
            {
                var btnHidden = $('#<%= Button1.ClientID %>');
                if(btnHidden != null)
                {
                    btnHidden.click();
                }
            }
        </script>

        <asp:Button ID="Button2" runat="server" OnClick="redirectToComputerArchitecture2" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_ComputerArchitecture2(); return true;">
            <div class="grid-heading">
                <h4>Computer Architecture 2.2</h4>
            </div>
            <img src="Image/CS_logo.png" alt="module-image"class="module-img" />
        </div>
        
        <script>
            function DivClicked_ComputerArchitecture2()
            {
                var btnHidden = $('#<%= Button2.ClientID %>');
                if(btnHidden != null)
                {
                    btnHidden.click();
                }
            }
        </script>

        <asp:Button ID="Button3" runat="server" OnClick="redirectToAdvancedProgramming" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_AdvancedProgramming(); return true;">
            <div class="grid-heading">
                <h4>Advanced Programming 3.1</h4>
            </div>
            <img src="Image/CS_logo.png" alt="module-image"class="module-img" />
        </div>
        
        <script>
            function DivClicked_AdvancedProgramming()
            {
                var btnHidden = $('#<%= Button3.ClientID %>');
                if(btnHidden != null)
                {
                    btnHidden.click();
                }
            }
        </script>

    <%--    <div class ="module-grid-item">
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
        </div>--%>
     </div>
    
</asp:Content>
