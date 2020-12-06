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
        int max_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            getMaxId();
            getAllLectures();
        }

        private void getMaxId()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            string sqlComm = "SELECT Max(ModulePresented.id) AS MaxOfid FROM ModulePresented";
            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);
            dbConnection.Open();


            bool read;
            Object[] resData = new Object[1];

            OleDbDataReader reader = dbCommand.ExecuteReader();

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
                Response.Write("<script>alert('Somthing went wrong');</script>");
            }
            else
            {
                max_id = (int)resData[0];
            }
        }

        private void getAllLectures()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            string sqlComm = "SELECT Lecturer.staffNumber FROM Lecturer";
            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);
            dbConnection.Open();

            bool read;
            List<Object[]> numbers = new List<object[]>();

            OleDbDataReader reader = dbCommand.ExecuteReader();

            if (reader.Read() == true)
            {
                int count = 0;
                do
                {
                    numbers.Add(new object[1]);
                    reader.GetValues(numbers[count]);
                    count++;
                    read = reader.Read();
                } while (read == true);
            }


            reader.Close();
            dbConnection.Close();

            foreach (object[] num in numbers)
            {
                string n = num[0].ToString();
                lecutureDrop.Items.Add(new ListItem(n));
            }
        }

        private void doModuleAdd()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlComm = "INSERT into [Module]([moduleCode], [moduleName], [moduleMarks])" +
                " VALUES (@ID, @name, @marks)";

            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);

            dbCommand.Parameters.AddWithValue("@ID", moduleCode.Text);
            dbCommand.Parameters.AddWithValue("@name", moduleName.Text);
            dbCommand.Parameters.AddWithValue("@marks", "0");

            dbConnection.Open();

            try
            {
                int ReturnCode = dbCommand.ExecuteNonQuery();

                if (ReturnCode == 1)
                {
                    Response.Write("<script>alert('Module Added Successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Module cannot be added');</script>");
                }

            }
            catch (Exception e)
            {
                Response.Write("<script>alert('Module cannot be added: " + e.Message + "');</script>");
            }

            dbConnection.Close();
        }

        private void doModulePresnetedAdd()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlComm = "INSERT INTO ModulePresented ( id, staffNumber, moduleCode ) SELECT @num AS Expr1, Lecturer.staffNumber, Module.moduleCode FROM Lecturer, [Module] WHERE(((Lecturer.staffNumber)= @lec) AND((Module.moduleCode)= @code))";

            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);

            dbCommand.Parameters.AddWithValue("@num", (++max_id));
            dbCommand.Parameters.AddWithValue("@lec", lecutureDrop.SelectedItem.Text);
            dbCommand.Parameters.AddWithValue("@code", moduleCode.Text);

            dbConnection.Open();

            int ReturnCode = dbCommand.ExecuteNonQuery();

            if (ReturnCode == 1)
            {
                Response.Write("<script>alert('Module Presented Added Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Module Presented cannot be added');</script>");
            }

            dbConnection.Close();
        }

        //private bool lectureExists()
        //{
        //    string CS;
        //    CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //    OleDbConnection dbConnection = new OleDbConnection(CS);

        //    String sqlCmd1 = "SELECT [firstName] FROM [Lecturer] WHERE (staffNumber = @staffNum)";

        //    OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConnection);

        //    cmd1.Parameters.AddWithValue("@staffNum", moduleLecture.Text);

        //    dbConnection.Open();

        //    bool read;
        //    Object[] resData = new Object[1];

        //    OleDbDataReader reader = cmd1.ExecuteReader();

        //    if (reader.Read() == true)
        //    {
        //        do
        //        {
        //            reader.GetValues(resData);
        //            read = reader.Read();
        //        } while (read == true);
        //    }

        //    reader.Close();
        //    dbConnection.Close();

        //    if (resData[0] == null)
        //    {
        //        Response.Write("<script>alert('Lecturer could not be found');</script>");
        //        return false;
        //    }           

        //    return true;            
        //}

        protected void createBnt_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (moduleCode.Text.Length <= 0)
                {
                    Response.Write("<script>alert('Module code is empty');</script>");
                    return;
                }
                else if (moduleName.Text.Length <= 0)
                {
                    Response.Write("<script>alert('Module name is empty');</script>");
                    return;
                }

                doModuleAdd();
                doModulePresnetedAdd();

                Response.Redirect("SearchModule.aspx");
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