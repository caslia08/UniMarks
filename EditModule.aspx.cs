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
        public static bool created = false;
        String moduleCodeInput = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            moduleCodeInput = this.Request.QueryString["ModuleCode"];
            if (!created)
            {
                populateFields(moduleCodeInput);
                populateStudentTable(moduleCodeInput);
                populateAssessmentTable(moduleCodeInput);
                created = true;
            }
        }

        private void populateLectuture(String moduleCode)
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String ss = "SELECT ModulePresented.staffNumber FROM ModulePresented WHERE(((ModulePresented.moduleCode) = @moduleCode))";
            
            OleDbCommand cmd1 = new OleDbCommand(ss, dbConnection);
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
            if (resData[0] != null)
            {
                moduleLecture.Text = resData[0].ToString();
            }           
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

            if (resData[0] == null)
            {
                Response.Write("<script>alert('Lecturer could not be found');</script>");
                return false;
            }

            return true;
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
            created = false;
            if (lectureExists())
            {            
                if (moduleName.Text.Length != 0)
                {                    
                    string CS;
                    CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    OleDbConnection dbConnection = new OleDbConnection(CS);

                    String sqlComm = "UPDATE [Module] SET " +
                        "moduleName = @Name , " +
                        "moduleDesc = @Desc " +
                        "WHERE moduleCode = @moduleCode";

                    OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);

                    dbCommand.Parameters.AddWithValue("@Name", moduleName.Text);
                    dbCommand.Parameters.AddWithValue("@Desc", moduleDsc.Text);

                    dbCommand.Parameters.AddWithValue("@moduleCode", moduleCodeInput);

                    dbConnection.Open();

                    int ReturnCode = dbCommand.ExecuteNonQuery();

                    dbConnection.Close();                        

                    if (ReturnCode == 1)
                    {
                        Response.Write("<script>alert('Module edited successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Module edited failed');</script>");
                    }
                    
                }
                else
                {
                    moduleName.CssClass = "form-control is-invalid";
                }         
            }  
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            created = false;
            Response.Redirect("SearchModule.aspx");
        }
    }
}