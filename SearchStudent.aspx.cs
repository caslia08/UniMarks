using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                String studentNumber = e.CommandArgument.ToString();
                Response.Redirect("EditStudentInformation.aspx?studentNumber=" + studentNumber);
            }
        }
    }
}