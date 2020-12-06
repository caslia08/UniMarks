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
        string moduleName = "MAPV212"; 
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO add session variable thing to load info
        }

        protected void btnViewStudents_Click(object sender, EventArgs e)
        {
            Session["ModuleCode"] = moduleName;
            Response.Redirect("~/Lecturer/LecturerStudentView.aspx");
            //TODO add legit session variable
        }

        protected void btnViewAssessments_Click(object sender, EventArgs e)
        {
            Session["ModuleCode"] = moduleName;
            Response.Redirect("~/Lecturer/LecturerViewAssessments.aspx");
        }
    }
}