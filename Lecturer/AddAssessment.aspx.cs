using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AddAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = DateTime.Today.Date;
            String today = date.ToString("yyyy-MM-dd");
            txtAssDate.Attributes["min"] = today;
        }

        protected void btnCreateAss_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string CS;
                CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbConnection = new OleDbConnection(CS); 
                
                String sqlInsert = "INSERT into [Assessment Information]([assessmentID], [assessmentName],[assessmentType],[assessmentDate],[assessmentDescription]," +
                    "[assessmentVenue],[classAverage],[assessmentWeightage] ) VALUES (@ID, @name, @type, @date, @desc, @venue, @average, @weight)";

                OleDbCommand dbCommand = new OleDbCommand(sqlInsert, dbConnection);

                dbCommand.Parameters.AddWithValue("@ID", txtAssID.Text);
                dbCommand.Parameters.AddWithValue("@name", txtAssName.Text);
                dbCommand.Parameters.AddWithValue("@type", dropAssType.SelectedValue);
                dbCommand.Parameters.AddWithValue("@date", txtAssDate.Text);
                dbCommand.Parameters.AddWithValue("@desc", txtAssDesc.Text);
                dbCommand.Parameters.AddWithValue("@venue", txtAssVenue.Text);
                dbCommand.Parameters.AddWithValue("@average", 0);
                dbCommand.Parameters.AddWithValue("@weight", dropAssWeight.SelectedValue);

                dbConnection.Open();

                if (doesIDExist())
                {
                    Response.Write("<script>alert('Assessment ID already Exists');</script>");
                }
                else
                {
                    int ReturnCode = dbCommand.ExecuteNonQuery();

                    if (ReturnCode == 1)
                    {
                        Response.Write("<script>alert('Assessment Added Successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Assessment Could not be Added');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('This Page is not working');</script>");
            }
        }

        private Boolean doesIDExist()
        {
            
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sqlCheck = "SELECT assessmentName FROM[Assessment Information] WHERE assessmentID = @ID";

            OleDbCommand dbCommand = new OleDbCommand(sqlCheck, dbConnection);

            dbCommand.Parameters.AddWithValue("@ID", txtAssID.Text);

            OleDbDataAdapter info = new OleDbDataAdapter();
            info.SelectCommand = dbCommand;
            DataSet userSet = new DataSet();
            info.Fill(userSet);

            if ((userSet.Tables[0].Rows.Count) > 0)
            {
                return true;
            }
            else
                return false; 

        }
    }
}