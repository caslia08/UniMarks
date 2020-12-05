<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2></h2>
    <div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image">
        <img src="../Image/Students.jpg" />
    </div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Welcome back!</h3>
                  <div class="form-label-group">
                      <label for="inputEmail">Email address</label>
                      <br />
                      <asp:TextBox runat="server" TextMode="Email" class="form-control" ID ="txtEmail" placeholder="Email address" ></asp:TextBox>
                  </div>

                  <div class="form-label-group">
                      <label for="inputPassword">Password</label>
 <br />
                      <asp:TextBox runat="server" TextMode="Password" class="form-control" ID ="txtPassword" placeholder="Password" ></asp:TextBox>                  </div>

                  <div class="custom-control custom-checkbox mb-3">
                      <input type="checkbox" class="custom-control-input" id="customCheck1">
                      <label class="custom-control-label" for="customCheck1">Remember password</label>
                  </div>
                <button id="btnLogin" class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" onclick="btnLogin_Click" >Sign in</button>
                <div class="text-center">
                  <a class="small" href="#">Forgot password?</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


      <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Form submission</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body">
                        <h3>Form submission successful</h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary " data-dismiss="modal">Continue</button>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
