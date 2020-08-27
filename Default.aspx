<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

    
<asp:Content ContentPlaceHolderID="pageTitle" runat="server">
About
</asp:Content>
<asp:Content ContentPlaceHolderID="Custom_styles_placeholder" runat="server"> 
        <style>

        </style>
    </asp:Content>

   <asp:Content ContentPlaceHolderID="mainHeading" runat="server">
    </asp:Content>

    <asp:Content ID="Content1" ContentPlaceHolderID="Login_LogoutButton" runat="server">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Login </button>
    </asp:Content>
    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron">
            <h1>About UniMarks </h1>
            <hr />
            <p class="lead">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at mi sit amet felis pellentesque porta sit amet in ipsum. Suspendisse sagittis ultricies efficitur. Mauris nulla libero, finibus a fringilla quis, condimentum non diam. Proin ultrices purus quam, vel dapibus sapien vehicula id. Sed a feugiat nunc, sed viverra enim. Maecenas dolor nunc, laoreet ut tellus sed, interdum suscipit ipsum. Vestibulum mi nibh, pretium et blandit et, interdum in risus. Pellentesque vel elementum tortor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut cursus accumsan rhoncus. Maecenas ultricies sit amet erat quis fringilla. Sed tempus eu sem non mollis. Proin id dolor tempus, dictum ligula vel, lacinia leo. Etiam nec lectus sed libero feugiat euismod. Integer malesuada, eros facilisis tempor sagittis, augue arcu lobortis est, sed porttitor odio odio eu purus.

            <p class="lead">Nulla vitae lorem quis nisi convallis eleifend. Etiam iaculis mauris at cursus malesuada. Vestibulum vel blandit mi, in pulvinar leo. Cras quis nunc tellus. Vestibulum quis tincidunt augue, eu congue ex. Praesent in euismod nunc, id pulvinar libero. Pellentesque facilisis euismod leo, eget pretium augue rhoncus ultricies. Suspendisse nec felis non urna porttitor condimentum. Sed nec lobortis diam. Etiam auctor sollicitudin suscipit. Nunc finibus dui non elit congue tristique.</p>

            <p class="lead">Integer diam ex, suscipit quis ullamcorper non, imperdiet eget orci. Quisque id ligula interdum, tincidunt ante in, blandit nisl. Ut est arcu, varius quis erat a, dapibus molestie lorem. Sed a tortor odio. Proin ac aliquet erat, sit amet egestas lorem. Suspendisse in diam dui. Cras eu arcu rutrum, consequat risus a, dapibus libero. Fusce placerat leo dolor, tristique posuere ex vehicula vitae.</p>
        </div>

        <div class="row">
        <div class="col-md-4">
            <h2>Track your Progress</h2>
            <p>
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. 
                Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo
            </p>
           
        </div>
        <div class="col-md-4">
            <h2>Contact Lectures</h2>
            <p>
                Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                commodo consequat.            </p>
        </div>
        <div class="col-md-4">
            <h2>Do Better</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                commodo consequat.
            </p>
            
        </div>
    </div>

</asp:Content>
