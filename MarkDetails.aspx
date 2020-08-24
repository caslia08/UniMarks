<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="WebApplication3.MarkDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Mark statistics
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
        .blue-element{
            color:rgb(39, 128, 227) ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
   <button class="btn btn-secondary my-2 my-sm-0" type="submit">logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="mainHeading" runat="server">
    Assessment name, Mark statistics
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Some subheading</h2>
        <hr />
        <br />
        <h4>Aggregate functions</h4>
        <table class="table table-hover">
            <tbody>
                <tr>
                    <td class="blue-element">Your mark</td>
                    <td>79%</td>
                </tr>
                <tr>
                    <td class="blue-element">Minimum mark</td>
                    <td>39%</td>
                </tr>
                <tr>
                    <td class="blue-element">Maximum mark</td>
                    <td>99%</td>
                </tr>
                <tr>
                    <td class="blue-element">Average mark</td>
                    <td>60%</td>
                </tr>
            </tbody>
        </table>
        <br />
        <h3>View your peers progress</h3>
        <div class="form-group">
            <label for="chart-to-show">Select graph:</label>
            <select class="form-control" id="chart-to-show">
                <option disabled selected>Chose a chart to display</option>
                <option>Bar</option>
                <option>Pie</option>
                <option>Line</option>
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
    <script>
        let myBarChart = document.getElementById('my-Bar-Chart').getContext('2d');

        let marksBarChart = new Chart(myBarChart, {
            type: 'bar',
            data: {
                labels: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100'],
                datasets: [{
                    label:'',
                    data: [0, 0, 0, 1, 5, 6,4,3,1,1],
                  backgroundColor: [
                        'rgba(153, 0, 0, 0.6)',
                        'rgba(204, 0, 0, 0.6)',
                        'rgba(255, 0, 0, 0.6)',
                        'rgba(255, 48, 48, 0.6)',
                        'rgba(0, 0, 153, 0.6)',
                        'rgba(0, 125, 255, 0.6)',
                        'rgba(0, 204, 204, 0.6)',
                        'rgba(0,153 , 0, 0.6)',
                        'rgba(0, 255, 0, 0.6)',
                        'rgba(204, 255, 153, 0.6)'


                    ],
                    borderColor: [
                        'rgba(153, 0, 0, 0.1)',
                        'rgba(204, 0, 0, 0.1)',
                        'rgba(255, 0, 0, 0.1)',
                        'rgba(255, 48, 48, 0.1)',
                        'rgba(0, 0, 153, 0.1)',
                        'rgba(0, 125, 255, 0.1)',
                        'rgba(0, 204, 204, 0.1)',
                        'rgba(0,153 , 0, 0.1)',
                        'rgba(0, 255, 0, 0.1)',
                        'rgba(204, 255, 153, 0.1)'
                    ],
                    borderWidth: 1,
                    hoverBorderWidth:2, 
                    hoverBorderColor: '#000' 
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Marks distrabution',
                    fontSize: 25
                },
                legend: {
                    display: false
                },
                scales: {
                        xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'percentage range'
                        }
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Number of people'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                
                }
            }
        });

         let myPieChart = document.getElementById('my-Pie-Chart').getContext('2d');

        let marksPieChart = new Chart(myPieChart, {
            type: 'pie',
            data: {
                labels: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100'],
                datasets: [{
                    label:'',
                    data: [0, 0, 0, 1, 5, 6,4,3,1,1],
                    backgroundColor: [
                        'rgba(153, 0, 0, 0.6)',
                        'rgba(204, 0, 0, 0.6)',
                        'rgba(255, 0, 0, 0.6)',
                        'rgba(255, 48, 48, 0.6)',
                        'rgba(0, 0, 153, 0.6)',
                        'rgba(0, 125, 255, 0.6)',
                        'rgba(0, 204, 204, 0.6)',
                        'rgba(0,153 , 0, 0.6)',
                        'rgba(0, 255, 0, 0.6)',
                        'rgba(204, 255, 153, 0.6)'


                    ],
                    borderColor: [
                        'rgba(153, 0, 0, 0.1)',
                        'rgba(204, 0, 0, 0.1)',
                        'rgba(255, 0, 0, 0.1)',
                        'rgba(255, 48, 48, 0.1)',
                        'rgba(0, 0, 153, 0.1)',
                        'rgba(0, 125, 255, 0.1)',
                        'rgba(0, 204, 204, 0.1)',
                        'rgba(0,153 , 0, 0.1)',
                        'rgba(0, 255, 0, 0.1)',
                        'rgba(204, 255, 153, 0.1)'
                    ],
                    borderWidth: 1,
                    hoverBorderWidth:2, 
                    hoverBorderColor: '#000' 
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Marks distrabution',
                    fontSize: 25
                },
                legend: {
                    display: true,
                    position:'right'

                },
                scales: {
                    ticks: {
                        beginAtZero: true
                    }
                }
            }
        });

       let myLineChart = document.getElementById('my-Line-Chart').getContext('2d');

        let marksLineChart = new Chart(myLineChart, {
            type: 'line',
            data: {
                labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
                datasets: [{
                    label:'',
                    data: [63, 48,78,90,66,69,88,99,38,85],
                  backgroundColor: [
                    'rgba(0, 125, 255, 0.6)',

                    ],
                    borderColor: [
                      'rgba(0, 125, 255, 0.6)',
                    ],
                    borderWidth: 1,
                    hoverBorderWidth:2, 
                    hoverBorderColor: '#000' 
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'Marks distrabution (Percentages optained)',
                    fontSize: 25
                },
                legend: {
                    display: false
                },
                scales: {
                        xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'students'
                        }
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Percentage optained'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                
                }
            }
        });

    </script>
</asp:Content>
