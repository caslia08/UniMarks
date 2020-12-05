<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="WebApplication3.MarkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Mark statistics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .blue-element{
            color:rgb(39, 128, 227) ;
        }
        .btn-rounded-border {
			border-radius: 8px;
			margin-top: 10px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
   <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">Module home</a></li>
        <li class="breadcrumb-item"><a href="#">Module assessments</a></li>
        <h1 runat="server" id="tester"></h1>
	
    </ol>
</asp:Content>
<asp:Content ID="mainHeading" ContentPlaceHolderID="mainHeading" runat="server">
    <p runat="server" ID ="mainHeadingP">Assessment name, Mark statistics</p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Mark stats</h2>
        <hr />
        <br />
        <h4>Aggregate functions</h4>
            
        <table class="table table-hover">
            <tbody>
                <tr>
                    <td class="blue-element">Your mark</td>
                    <td><p id="studentMark" runat="server"></p></td>
                </tr>
                <tr>
                    <td class="blue-element">Minimum mark</td>
                    <td><p id="minMark" runat="server"></p></td>
                </tr>
                <tr>
                    <td class="blue-element">Maximum mark</td>
                    <td><p id="maxMark" runat="server"></p></td>
                </tr>
                <tr>
                    <td class="blue-element">Average mark</td>
                    <td><p id="avgMark" runat="server"></p></td>
                </tr>
            </tbody>
        </table>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <button type="button" class="btn btn-outline-primary btn-lg btn-rounded-border" data-toggle="modal" data-target="#myModal" id="submitFlagBtn" runat="server">
            <i class="material-icons">flag</i>
            Flag mark
         </button>
          
        <div id="myModal" class="modal fade" role="dialog" >
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Flag mark</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label for="AssType">Reason for flag</label>
         
                                <asp:DropDownList ID="reasonForFlag" CssClass="form-control" runat="server" >
                                    <asp:ListItem>Incorrect mark captured on system</asp:ListItem>
                                    <asp:ListItem>Incorrect tallying of mark</asp:ListItem>
                                    <asp:ListItem>Disagree with mark obtained</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="AssDesc">Elaboration on selection</label>
                            <asp:TextBox ID="elaborationOnFlag" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Elaboration on reason for flag is required" ControlToValidate="elaborationOnFlag"></asp:RequiredFieldValidator>
                        </div>
                        
                        <div class="form-group">
                            <label for="AssDesc">Enter email password send notification</label>
                            <asp:TextBox ID="emailPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Email password is required" ControlToValidate="emailPassword"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="submit" runat="server" Text="Send" OnClick="submitFlagBtnClicked"  class="btn btn-outline-primary "/>
                        <button type="button" class="btn btn-outline-danger " data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <h3>View your peers progress</h3>
        <div class="form-group">
            <label for="chart-to-show">Select graph:</label>
            <select class="form-control" id="chart-to-show">
                <option disabled selected>Chose a chart to display</option>
                <option>Bar</option>
                <option>Pie</option>
                <option>Area</option>
            </select>
        </div>
        <canvas id="my-Bar-Chart" width="250" height="100" style="display: none"></canvas>
        <canvas id="my-Pie-Chart" width="250" height="100" style="display: none"></canvas>
        <canvas id="my-Line-Chart" width="250" height="100" style="display: none"></canvas>
    </div>
    <script>
        $(document).ready(function () {

            $('#chart-to-show').on('change', function() {
                if (this.value == 'Bar') {
                    $('#my-Bar-Chart').show();
                    $('#my-Pie-Chart').hide();
                    $('#my-Line-Chart').hide();
                }
                else if (this.value == 'Pie') {
                    $('#my-Bar-Chart').hide();
                    $('#my-Pie-Chart').show();
                    $('#my-Line-Chart').hide();
                }
                else {
                    $('#my-Bar-Chart').hide();
                    $('#my-Pie-Chart').hide();
                    $('#my-Line-Chart').show();
                }
            });
        });
     
    </script>
    <div>
        <asp:Literal ID="chartsBar" runat="server"></asp:Literal>
        <asp:Literal ID="chartsPie" runat="server"></asp:Literal>
        <asp:Literal ID="chartsLine" runat="server"></asp:Literal>
    </div>
</asp:Content>
