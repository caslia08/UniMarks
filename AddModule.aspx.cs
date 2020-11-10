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
    public partial class EditModuleDetials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //populateStudentTable();
            //populateAssessmentTable();
        }

        private void doModuleAdd()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlComm = "INSERT into [Module]([moduleCode], [moduleName], [moduleMarks], [moduleDesc])" +
                " VALUES (@ID, @name, @marks, @desc)";

            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);

            dbCommand.Parameters.AddWithValue("@ID", moduleCode.Text);
            dbCommand.Parameters.AddWithValue("@name", moduleName.Text);
            dbCommand.Parameters.AddWithValue("@marks", "0");
            dbCommand.Parameters.AddWithValue("@desc", moduleDsc.Text);

            dbConnection.Open();

            int ReturnCode = dbCommand.ExecuteNonQuery();

            if (ReturnCode == 1)
            {
                Response.Write("<script>alert('Module Added Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Module cannot be added');</script>");
            }

            dbConnection.Close();
        }

        private bool lectureExists()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlCmd1 = "SELECT [firstName] FROM [Lecturer] WHERE (staffNumber = @staffNum)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConnection);
            
            cmd1.Parameters.AddWithValue("@staffNum", moduleLecture.Text);

            dbConnection.Open();

            bool read;
            Object[] resData = new Object[1];

            OleDbDataReader reader = cmd1.ExecuteReader();

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

            if (resData == null)
            {
                Response.Write("<script>alert('Lecturer could not be found');</script>");
                return false;
            }           
            
            return true;            
        }

        private void populateStudentTable()
        {
            String cs;
            String moduleCode;
            moduleCode = "LARA201";

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            //String sqlCmd1 = "SELECT Student.studentNumber, Student.firtsName, Student.surname FROM Student INNER JOIN([Module] INNER JOIN ModuleTaken ON Module.moduleCode = ModuleTaken.moduleCode) ON Student.studentNumber = ModuleTaken.studentNumber WHERE(((Module.moduleCode) = \"LARA201\"))";
            //OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);
            String ss = "SELECT Student.studentNumber, Student.firtsName, Student.surname FROM (Student INNER JOIN ([Module] INNER JOIN ModuleTaken ON [Module].moduleCode = ModuleTaken.moduleCode) ON Student.studentNumber = ModuleTaken.studentNumber)";
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

            String ss = "SELECT [Assessment Results].assessmentID "+
                        " FROM [Assessment Results] "+
                        " WHERE ((([Assessment Results].moduleCode) = @moduleCode))";
            
            OleDbCommand cmd1 = new OleDbCommand(ss, dbConn);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
            moduleAssesmentView.DataSource = reader;
            moduleAssesmentView.DataBind();
            dbConn.Close();
        }

        protected void createBnt_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (lectureExists())
                {
                    doModuleAdd();
                }
            }
            else
            {
                //TODO disp error message
            }
        }

        protected void cancelBnt_Click(object sender, EventArgs e)
        {

        }
    }
}