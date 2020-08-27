﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAssessment.aspx.cs" Inherits="WebApplication3.AddAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Add Assessment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Custom_styles_placeholder" runat="server">
    <style>
         .btn-rounded-border {
            border-radius: 8px;
        }
        /*add styles here later*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login_LogoutButton" runat="server">
    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Logout</button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BreadCrumbs" runat="server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">DashBoard</a></li>
        <li class="breadcrumb-item"><a href="#">MAPV311</a></li>
        <li class="breadcrumb-item active">Add Assessment</li>
    </ol>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="mainHeading" runat="server">
    Add Assessment
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
   <div class="jumbotron">
       <h2>Assessment Information</h2>
            <hr />
            <br />
    <form>
        <fieldset>
            
            <div class="form-group">
                <label for="AssName">Name</label>
                <input type="text" class="form-control" id="AssName" aria-describedby="emailHelp" placeholder="Assessment Name">
            </div>

             <div class="form-group">
                <label for="AssDesc">Description</label>
                <textarea class="form-control" id="AssDesc" rows="4"></textarea>
            </div>

              <div class="form-group">
                <label for="AssDate">Date</label>
                <input type="datetime-local" class="form-control" id="AssDate" placeholder="Select Date">
            </div>

             <div class="form-group">
                <label for="AssType">Assessment Type</label>
                <select class="form-control" id="AssType">
                    <option>Semester Test</option>
                    <option>Assignment</option>
                    <option>Presentation</option>
                    <option>Tutorial Test</option>
                </select>
            </div>

            <div class="form-group">
                <label for="AssVenue">Venue</label>
                <input type="text" class="form-control" id="AssVenue" aria-describedby="emailHelp" placeholder="Assessment Venue">
            </div>

             <div class="form-group">
                <label for="AssWeight">Assessment Weightage</label>
                <select class="form-control" id="AssWeight">
                    <option>To Be Determined</option>
                    <option>5%</option>
                    <option>10%</option>
                    <option>15%</option>
                    <option>20%</option>
                    <option>25%</option>
                    <option>30%</option>
                    <option>35%</option>
                    <option>40%</option>
                </select>
             </div>
            <br />

            <hr />
            <br />
            <button type="submit" class="btn btn-outline-primary btn-lg btn-rounded-border">Create</button>
            <button type="button" class="btn btn-outline-danger btn-lg btn-rounded-border">Cancel</button>
        </fieldset>
    </form>
   </div>

</asp:Content>
