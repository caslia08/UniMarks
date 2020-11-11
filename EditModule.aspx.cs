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
            String moduleCode = this.Request.QueryString["ModuleCode"];

            populateFields(moduleCode);
            populateStudentTable(moduleCode);
            populateAssessmentTable(moduleCode);
        }

        private void populateLectuture(String moduleCode)
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String ss = "SELECT ModulePresented.staffNumber FROM ModulePresented WHERE(((ModulePresented.moduleCode) = \"LARA201\"))";
            
            OleDbCommand cmd1 = new OleDbCommand(ss, dbConnection);
          //  cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

            dbConnection.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();


            bool read;
            Object[] resData = new Object[10];

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData);
                    read = reader.Read();
                } while (read == true);
            }

            reader.Close();
            dbConnection.Close();

            moduleLecture.Text = resData[0].ToString();

        }

        private void populateFields(String moduleCode)
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlCmd1 = "SELECT * FROM [Module] WHERE (moduleCode = @moduleCode)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConnection);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

            dbConnection.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();

            bool read;
            Object[] resData = new Object[10];

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData);
                    read = reader.Read();
                } while (read == true);
            }

            reader.Close();
            dbConnection.Close();

            if (resData != null)
            {
                moduleName.Text = (String)resData[1];
                mdCode.Text = (String)resData[0];

                populateLectuture(moduleCode);

                // @NOTE: Yes that's correct microsoft decided that microsoft's other version of null wasn't good enough, 
                // @NOTE: so that deparment of mircosoft said "fuck you C# deparment" and made another version of null that now needs to 
                // @NOTE: be INHERITEDED FROM !! just to be able to be a nullable type....
                if (resData[3] is System.DBNull) 
                {
                }
                else
                {
                    moduleDsc.Text = (String)resData[3];
                }
                  

            }
        }

        private void populateStudentTable(String moduleCode)
        {
            String cs;           

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String ss = "SELECT Student.studentNumber, Student.firtsName, Student.surname, Student.emailAddress FROM Student INNER JOIN ModuleTaken ON Student.studentNumber = ModuleTaken.studentNumber WHERE (((ModuleTaken.moduleCode) = @moduleCode))";

            OleDbCommand cmd1 = new OleDbCommand(ss, dbConn);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
            studentView.DataSource = reader;
            studentView.DataBind();
            dbConn.Close();
        }

        private void populateAssessmentTable(String moduleCode)
        {
            String cs;

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
            Response.Redirect("SearchModule.aspx");
        }
    }
}