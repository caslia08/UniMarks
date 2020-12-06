using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebApplication3
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                int userType = (int)Session["User"];

                switch (userType)
                {
                    case 0:
                        DropDownList1.Visible = false;
                        DropDownList1.Enabled = false;
                        break;
                    case 1:
                        DropDownList1.Visible = false;
                        DropDownList1.Enabled = false;
                        break;
                    case 2:
                        DropDownList1.Items.Add(new ListItem("Modules", "Modules"));
                        DropDownList1.Items.Add(new ListItem("ss", "fff"));

                        break;
                }
            }
            else
            {
                DropDownList1.Items.Add(new ListItem("Modules", "Modules"));
                DropDownList1.Items.Add(new ListItem("ss", "fff"));
                //DropDownList1.Visible = false;
                //DropDownList1.Enabled = false;
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void LinkContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");

        }

        protected void LinkAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void LinkDash_Click(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                int userType = (int)Session["User"];

                switch (userType)
                {
                    case 0:
                        Response.Redirect("~/AdminHomePage.aspx");
                        break;
                    case 1:
                        Response.Redirect("~/Lecturer/LecturerHomePage.aspx");
                        break;
                    case 2:
                        Response.Redirect("~/StudentDashboard.aspx");
                        break;
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int a = 2;
        }
    }
}