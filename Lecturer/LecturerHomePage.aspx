<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerHomePage.aspx.cs" Inherits="WebApplication3.LecturerHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
	Lecturer Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
	<style>
		.lecturer-details-grid-container {
			display: grid;
			grid-template-columns: 1fr 1fr;
			grid-gap: 40px;
		}

		.material-icons.md-68 {
			font-size: 68px;
		}

		.grid-icon {
			place-self: center;
		}

		#links-to-stats-grid-container {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
			grid-gap: 20px;
		}

		.grid-button-container {
			border-radius: 7px;
			padding: 20px;
			background-color: rgb(233,236,239);
			border: solid;
			border-width: 1px;
			border-color: darkgrey;
			text-align: center;
		}

		.btn-rounded-border {
			border-radius: 8px;
			margin-top: 10px;
		}

		 .grid-container{
            display: grid;
            grid-gap: 50px;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows:300px;
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
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active"><a href="#">DashBoard</a></li>
	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
	Lecturer Profile
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
	<div class="jumbotron">
		<div class="container">
			<h2>Details</h2>
			<hr />
			<br />
			<div class="lecturer-details-grid-container">
				<div class="grid-icon">
					<i class="material-icons md-68">person</i>
				</div>
				<div class="grid-content">
					<h5 class="grid-content-heading">Personal Details:
					</h5>
					<table class="table table-hover">
						<tr>
							<td>Title:</td>
							<td id="txtTitle" runat="server"> </td>
						</tr>
						<tr>
							<td>Full Name:</td>
							<td id="txtFullName" runat="server">></td>
						</tr>
						<tr>
							<td>Email Address:</td>
							<td id="txtEmail" runat="server"></td>
						</tr>
						<tr>
							<td>ID Number:</td>
							<td id="txtID" runat="server"></td>
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
							<td>Department:</td>
							<td  id="txtFaculty" runat="server"></td>
						</tr>
						<tr>
							<td>Staff number:</td>
							<td  id="txtStaffNum" runat="server"></td>
						</tr>
						<tr>
							<td>Office number:</td>
							<td id="txtTel" runat="server"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<h2 class="text-center">Modules Taught </h2>
	 
	<div class="grid-container">    
        <asp:Button ID="btnHiddenLinearAlgebra" runat="server" OnClick="redirectToLinearAlgebra" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_LinearAlgebra(); return true;">
            <div class="grid-heading">
                <h4>Linear Algebra</h4>
            </div>
            <img src="/Image/Math_logo.png"  alt="module-image"class="module-img" />
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
            <img src="/Image/Math_logo.png" alt="module-image"class="module-img" />
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

        <asp:Button ID="Button2" runat="server" OnClick="redirectToComplexFunctions" Style="display: none" />
        <div class ="module-grid-item" onclick="javascript:DivClicked_ComplexFunctions(); return true;">
            <div class="grid-heading">
                <h4>Complex Functions</h4>
            </div>
            <img src="/Image/Math_logo.png" alt="module-image"class="module-img" />
        </div>
        
        <script>
            function DivClicked_ComplexFunctions()
            {
                var btnHidden = $('#<%= Button2.ClientID %>');
                if(btnHidden != null)
                {
                    btnHidden.click();
                }
            }
        </script>
     </div>
	<br />
</asp:Content>