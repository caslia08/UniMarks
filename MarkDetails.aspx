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
	</ol>
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

          <button type="button" class="btn btn-outline-primary btn-lg btn-rounded-border" data-toggle="modal" data-target="#myModal"> <i class="material-icons">flag</i>Flag mark</button>
        <!-- How much styling scripts does on one website??? -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <div id="myModal" class="modal fade" role="dialog">
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
                            <select class="form-control" id="AssType">
                                <option disabled selected>Select a reason for flagging</option>
                                <option>Incorrect mark captured on system</option>
                                <option>Incorrect tallying of mark</option>
                                <option>Disagree with mark obtained</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="AssDesc">Elaboration on selection</label>
                            <textarea class="form-control" id="AssDesc" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary " data-dismiss="modal">Submit</button>
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
