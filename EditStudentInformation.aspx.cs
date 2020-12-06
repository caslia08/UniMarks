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
    public partial class EditStudentInformation : System.Web.UI.Page
    {
        String sNum = "335975982";
        public static bool created = false;

        private void populateTable()
        {
            String cs;
            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String ss = "SELECT ModuleTaken.moduleCode FROM Student INNER JOIN ModuleTaken ON Student.studentNumber = ModuleTaken.studentNumber WHERE (((Student.studentNumber) = @sNum))";

            OleDbCommand cmd1 = new OleDbCommand(ss, dbConn);

            cmd1.Parameters.AddWithValue("@sNum", sNum);
            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();

            moduleView.DataSource = reader;
            moduleView.DataBind();
            dbConn.Close();
        }

        private void populateData()
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlCmd1 = "SELECT * FROM [Student] WHERE (Student.studentNumber = @num)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConnection);

            cmd1.Parameters.AddWithValue("@num", sNum);

            dbConnection.Open();

            bool read;
            Object[] resData = new Object[10];

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

            if (resData != null)
            {
                firstNames.Text = (String)resData[1];
                lastName.Text = (String)resData[2];
                studentNum.Text = resData[0].ToString();
                title.Text = resData[3].ToString();
                idNumber.Text = resData[5].ToString();
                email.Text = resData[4].ToString();

                String year = resData[6].ToString();
                if (year == "1")
                {
                    yearOfStudy.SelectedValue = "One";
                }
                else if (year == "2")
                {
                    yearOfStudy.SelectedValue = "Two";
                }
                else if (year == "3")
                {
                    yearOfStudy.SelectedValue = "Three";
                }
                else
                {
                    yearOfStudy.SelectedValue = "Four";
                }

                faculty.SelectedValue = (String)resData[8];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            sNum = this.Request.QueryString["studentNumber"];
            if (!created)
            {
                populateTable();
                populateData();
                created = true;
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            created = false;

            if (firstNames.Text.Length == 0)
            {
                firstNames.CssClass = "form-control is-invalid";
                return;
            }

            if (lastName.Text.Length == 0)
            {
                lastName.CssClass = "form-control is-invalid";
                return;
            }

            if (title.Text.Length == 0)
            {
                title.CssClass = "form-control is-invalid";
                return;
            }

            if (email.Text.Length == 0)
            {
                email.CssClass = "form-control is-invalid";
                return;
            }

            if (idNumber.Text.Length == 0)
            {
                idNumber.CssClass = "form-control is-invalid";
                return;
            }

            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlComm = "UPDATE Student SET " +
                "firtsName = @firstName , " +
                "surname = @lastName , " +
                "title = @title , " +
                "emailAddress = @email , " +
                "IDNumber = @id , " +
                "yearOfStudy = @year , " +
                "qualificationName = @qual " +
                "WHERE studentNumber = @sNum";

            OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);



            dbCommand.Parameters.AddWithValue("@firstName", firstNames.Text);
            dbCommand.Parameters.AddWithValue("@lastName", lastName.Text);
            dbCommand.Parameters.AddWithValue("@title", title.Text);
            dbCommand.Parameters.AddWithValue("@emailAddress", email.Text);
            dbCommand.Parameters.AddWithValue("@IDNumber", idNumber.Text);
            dbCommand.Parameters.AddWithValue("@yearOfStudy", yearOfStudy.SelectedIndex + 1);
            dbCommand.Parameters.AddWithValue("@qualificationName", faculty.SelectedValue);


            dbCommand.Parameters.AddWithValue("@sNum", sNum);

            dbConnection.Open();
            try
            {
                int ReturnCode = dbCommand.ExecuteNonQuery();

                if (ReturnCode == 1)
                {
                    Response.Write("<script>alert('Student edited successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Student edited failed');</script>");
                }

                Response.Redirect("SearchStudent.aspx");
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('Student edited failed: " + err.Message + "');</script>");
            }
            dbConnection.Close();
        }

        protected void cancle_Click(object sender, EventArgs e)
        {
            created = false;
            Response.Redirect("SearchStudent.aspx");
        }
    }
}