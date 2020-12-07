using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class LecturerModuleStatistics : System.Web.UI.Page
    {
        string moduleName;
        string moduleCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            moduleName = Session["ModuleName"].ToString();
            moduleCode = Session["ModuleCode"].ToString();
            txtModuleName.InnerText += moduleCode; 
            moduleHeading.InnerText += moduleCode + " " + moduleName; 
        }

        protected void btnViewStudents_Click(object sender, EventArgs e)
        {
            Session["ModuleCode"] = moduleCode;
            Response.Redirect("~/Lecturer/LecturerStudentView.aspx");
            //TODO add legit session variable
        }

        protected void btnViewAssessments_Click(object sender, EventArgs e)
        {
            Session["ModuleCode"] = moduleCode;
            Response.Redirect("~/Lecturer/LecturerViewAssessments.aspx");
        }
    }
}