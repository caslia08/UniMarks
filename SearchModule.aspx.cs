﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class SearchModule1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridViewAssessments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditModule")
            {
                String assessmentID = e.CommandArgument.ToString();
                Response.Redirect("EditModule.aspx?ModuleCode=" + assessmentID);
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddModule.aspx");
        }
    }
}