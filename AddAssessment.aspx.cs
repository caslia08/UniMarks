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
    public partial class AddAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAss_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string CS;
                CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbConnection = new OleDbConnection(CS); 
                
                String sqlComm = "INSERT into [Assessment Information]([assessmentID], [assessmentName],[assessmentType],[assessmentDate],[assessmentDescription]," +
                    "[assessmentVenue],[classAverage],[assessmentWeightage] ) VALUES (@ID, @name, @type, @date, @desc, @venue, @average, @weight)";

                OleDbCommand dbCommand = new OleDbCommand(sqlComm, dbConnection);

                dbCommand.Parameters.AddWithValue("@ID", txtAssID.Text);
                dbCommand.Parameters.AddWithValue("@name", txtAssName.Text);
                dbCommand.Parameters.AddWithValue("@type", dropAssType.SelectedValue);
                dbCommand.Parameters.AddWithValue("@date", txtAssDate.Text);
                dbCommand.Parameters.AddWithValue("@desc", txtAssDesc.Text);
                dbCommand.Parameters.AddWithValue("@venue", txtAssVenue.Text);
                dbCommand.Parameters.AddWithValue("@average", 0);
                dbCommand.Parameters.AddWithValue("@weight", dropAssWeight.SelectedValue);

                dbConnection.Open();

                int ReturnCode = dbCommand.ExecuteNonQuery();

                if (ReturnCode == 1)
                {
                    Response.Write("<script>alert('Assessment Added Successfully');</script>");
                    //TODO success message
                }
                else
                {
                    Label1.Text = "Oof";

                    //TODO error 
                }


            }
            else
            {
                Label1.Text = "Big Oof";

                //TODO disp error message
            }
        }
    }
}