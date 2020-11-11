using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class EditModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populateStudentTable();
            populateAssessmentTable();
        }

        private void populateStudentTable()
        {
            String cs;
            String moduleCode = "LARA201";

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String ss = "SELECT Student.studentNumber, Student.firtsName, Student.surname, Student.emailAddress FROM Student INNER JOIN ModuleTaken ON Student.studentNumber = ModuleTaken.studentNumber WHERE (((ModuleTaken.moduleCode) = \"LARA201\"))";

            OleDbCommand cmd1 = new OleDbCommand(ss, dbConn);

            //cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
            studentView.DataSource = reader;
            studentView.DataBind();
            dbConn.Close();
        }

        private void populateAssessmentTable()
        {
            String cs;
            String moduleCode;
            moduleCode = "LARA201";

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

           String ss = "SELECT [Assessment Results].assessmentID, [Assessment Information].assessmentName, [Assessment Information].assessmentType, [Assessment Results].moduleCode FROM [Assessment Information] INNER JOIN [Assessment Results] ON [Assessment Information].assessmentID = [Assessment Results].assessmentID WHERE ((([Assessment Results].moduleCode)= @moduleCode))";


            OleDbCommand cmd1 = new OleDbCommand(ss, dbConn);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
            moduleAssesmentView.DataSource = reader;
            moduleAssesmentView.DataBind();
            dbConn.Close();
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {

        }
    }
}