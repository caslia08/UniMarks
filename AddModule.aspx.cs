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

        private void doModulePresnetedAdd()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlComm = "INSERT into [ModulePresented]([staffNumber], [moduleCode])" +
                " VALUES (@sft, @mc)";

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

            if (resData[0] == null)
            {
                Response.Write("<script>alert('Lecturer could not be found');</script>");
                return false;
            }           
            
            return true;            
        }

        protected void createBnt_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (moduleCode.Text.Length <= 0)
                {
                    Response.Write("<script>alert('Module code is empty');</script>");
                }
                else if (moduleName.Text.Length <= 0)
                {
                    Response.Write("<script>alert('Module name is empty');</script>");
                }
                else if (moduleLecture.Text.Length <= 0)
                {
                    Response.Write("<script>alert('Module lecture is empty');</script>");
                }

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
            Response.Redirect("SearchModule.aspx");
        }
    }
}