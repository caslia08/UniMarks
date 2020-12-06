<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LecturerStudentProgress.aspx.cs" Inherits="WebApplication3.LecturerStudentProgress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
Student Progress
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .blue-element {
            color: rgb(39, 128, 227);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
     <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#"><p id="txtModuleName" runat="server"></p></a></li>
        <li class="breadcrumb-item"><a href="#">Student List</a></li>
        <li class="breadcrumb-item active"><a href="#"><p id="txtStudNamePrg" runat="server"></p></a></li>

    </ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
Student Progress</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><p id="studentFullname" runat="server"></p> Mark Breakdown</h2>
        <hr />
        <br />

         <table class="table table-hover">
            <tbody>
                <tr>
                    <td class="blue-element"><p id="studentName" runat="server"></p> </td>
                    <td><p id="studentMark" runat="server"></p></td>
                </tr>
                <tr>
                    <td class="blue-element">Class average</td>
                    <td><p id="classAverage" runat="server"></p></td>
                <tr>
                    <td class="blue-element">Number of assessments complete</td>
                    <td><p id="numberAssComplete" runat="server"></p></td>
                </tr>
                <tr>
                    <td class="blue-element">Number of assessments missed</td>
                    <td><p id="missedAssessments" runat="server"></p></td>
                </tr>
            </tbody>
        </table>
        <hr />
        <br />
        
        <h3><p id="moduleProgressName" runat="server"></p></h3>
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

            $('#chart-to-show').on('change', function () {
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

