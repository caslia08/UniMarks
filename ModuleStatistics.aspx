<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModuleStatistics.aspx.cs" Inherits="WebApplication3.ModuleStatistics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Module statistics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .blue-element {
            color: rgb(39, 128, 227);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">Module home</a></li>
                <li class="breadcrumb-item active">Module Statistics</li>

	</ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Module Statistics
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Mark Breakdown</h2>
        <hr />
        <br />

         <table class="table table-hover">
            <tbody>
                <tr>
                    <td class="blue-element">Your average mark</td>
                    <td>79%</td>
                </tr>
                <tr>
                    <td class="blue-element">Class average</td>
                    <td>55%</td>
                </tr>
                <tr>
                    <td class="blue-element">Number of assessments complete</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td class="blue-element">Number of assessments missed</td>
                    <td>0</td>
                </tr>
            </tbody>
        </table>
        <hr />
        <br />
        <h3>Your module progress</h3>
          <div class="form-group">
            <label for="chart-to-show">Select graph:</label>
            <select class="form-control" id="chart-to-show">
                <option>Line</option>
                <option>Bar</option>
            </select>
        </div>
        <h4>Click on legend text to filter chart</h4>
        <canvas id="my-Line-Chart" width="250" height="100"></canvas>
        <canvas id="my-Bar-Chart" width="250" height="100" style="display:none"></canvas>
    </div>

     <script>
        $(document).ready(function () {
            $('#chart-to-show').on('change', function() {
                if (this.value == 'Bar') {
                    $('#my-Bar-Chart').show();
                    $('#my-Line-Chart').hide();
                }
                else {
                    $('#my-Bar-Chart').hide();
                    $('#my-Line-Chart').show();
                }
            });
        });
    </script>

    <script>
        let myLineChart = document.getElementById('my-Line-Chart').getContext('2d');

        let averageLineCharts = new Chart(myLineChart, {
            type: 'line',
            data: {
                labels: ['Tutorial test 1', 'Class quiz 1', 'Semester test 1', 'Tutorial test 2', 'Tutorial test 3'],
                datasets: [{
                    data: [50, 69, 88, 79, 64],
                    label: 'Your marks',
                    borderColor: 'rgba(0, 125, 255, 0.6)',
                    fill: false
                },
                {
                    data: [55, 50, 85, 64, 77],
                    label: 'Class average marks (2020)',
                    borderColor: 'rgba(204, 0, 0, 0.6)',
                    fill: false
                },
                {
                    data: [60, 55, 87, 65, 78],
                    label: 'Class average marks (2019)',
                    borderColor: 'rgba(255, 255, 0, 0.6)',
                    fill: false
                },
                {
                    data: [62, 65, 90, 45, 38],
                    label: 'Class average marks (2018)',
                    borderColor: 'rgba(0, 255, 0, 0.6)',
                    fill: false
                }]
            },
            options: {
                legend: {
                    display: true,
                    position: 'right'
                },
                title: {
                    display: true,
                    text: 'Assessment marks',
                    fontSize: 25
                },
                scales: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        });

        let myBarChart = document.getElementById('my-Bar-Chart').getContext('2d');

        let averageBarCharts = new Chart(myBarChart, {
            type: 'bar',
            data: {
                labels: ['Tutorial test 1', 'Class quiz 1', 'Semester test 1', 'Tutorial test 2', 'Tutorial test 3'],
                datasets: [{
                    data: [50, 69, 88, 79, 64],
                    label: 'Your marks',
                    backgroundColor: 'rgba(0, 125, 255, 0.6)',
                    fill: false
                },
                {
                    data: [55, 50, 85, 64, 77],
                    label: 'Class average marks (2020)',
                    backgroundColor: 'rgba(204, 0, 0, 0.6)',
                    fill: false
                },
                {
                    data: [60, 55, 87, 65, 78],
                    label: 'Class average marks (2019)',
                    backgroundColor: 'rgba(255, 255, 0, 0.6)',
                    fill: false
                },
                {
                    data: [62, 65, 90, 45, 38],
                    label: 'Class average marks (2018)',
                    backgroundColor: 'rgba(0, 255, 0, 0.6)',
                    fill: false
                }]
            },
            options: {
                legend: {
                    display: true,
                    position: 'right'
                },
                title: {
                    display: true,
                    text: 'Assessment marks',
                    fontSize: 25
                },
                scales: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</asp:Content>
