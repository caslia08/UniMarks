using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication3.Models;

namespace WebApplication3.Account
{
    public partial class Login : Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    RegisterHyperLink.NavigateUrl = "Register";
        //    // Enable this once you have account confirmation enabled for password reset functionality
        //    //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
        //    OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        //    var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        //    if (!String.IsNullOrEmpty(returnUrl))
        //    {
        //        RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        //    }
        //}

        //protected void LogIn(object sender, EventArgs e)
        //{
        //    if (IsValid)
        //    {
        //        // Validate the user password
        //        var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        //        var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

        //        // This doen't count login failures towards account lockout
        //        // To enable password failures to trigger lockout, change to shouldLockout: true
        //        var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

        //        switch (result)
        //        {
        //            case SignInStatus.Success:
        //                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        //                break;
        //            case SignInStatus.LockedOut:
        //                Response.Redirect("/Account/Lockout");
        //                break;
        //            case SignInStatus.RequiresVerification:
        //                Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
        //                                                Request.QueryString["ReturnUrl"],
        //                                                RememberMe.Checked),
        //                                  true);
        //                break;
        //            case SignInStatus.Failure:
        //            default:
        //                FailureText.Text = "Invalid login attempt";
        //                ErrorMessage.Visible = true;
        //                break;
        //        }
        //    }
        //}

        protected void btnSignIn_Click(object sender, EventArgs e)
        {

            string CS;
            CS = ConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString;
            OleDbConnection dbconn = new OleDbConnection(CS);

            string sqlcmd = "SELECT * FROM [Users]  WHERE [emailAddress] = @email AND [password] = @pass";

            OleDbCommand cmd1 = new OleDbCommand(sqlcmd, dbconn);

            cmd1.Parameters.AddWithValue("@email", txtEmail.Text);
            string pw = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
            cmd1.Parameters.AddWithValue("@pass", pw);
            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = cmd1;
            DataSet userSet = new DataSet();
            info.Fill(userSet);

            if ((userSet.Tables[0].Rows.Count) > 0)
            {
                FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, false);
                Session["Email"] = txtEmail.Text;
                DataRow datarow = userSet.Tables[0].Rows[0];
                int userType = int.Parse(datarow.Field<string>("userRoleCode"));
                Session["User"] = userType;
                switch (userType)
                {
                    case 0:
                        Response.Redirect("~/AdminHomePage.aspx");
                        break;
                    case 1:
                        Response.Redirect("~/Lecturer/LecturerHomePage.aspx");
                        break;
                    case 2:
                        string ll = txtEmail.Text.Substring(1, txtEmail.Text.IndexOf("@") - 1);

                        Session["StudNum"] = long.Parse(ll);

                        Response.Redirect("~/StudentDashboard.aspx");
                        break;
                }
            }
            else
                Response.Write("<script>alert('Incorrect Login information received');</script>");
        }
    }
}