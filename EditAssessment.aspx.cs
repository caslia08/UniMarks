using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Edit_Assessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String assID = this.Request.QueryString["AssessmentID"];
            txtAssID.Text = assID;

            String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection con = new OleDbConnection(CS);

            OleDbCommand cmd = new OleDbCommand(); 
            
            string sql = "SELECT assessmentID, assessmentName, assessmentType, assessmentDate, assessmentDescription, assessmentVenue," +
                "classAverage, assessmentWeightage FROM [Assessment Information] WHERE assessmentID = @AssID";              
            
            cmd.Parameters.AddWithValue("@AssID", assID.ToString());                   
            cmd.CommandText = sql;
            cmd.Connection = con;
            con.Open();
            OleDbDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read()) {
                txtAssID.Text = reader["assessmentID"].ToString();
                txtAssName.Text = reader["assessmentName"].ToString();
                dropAssType.SelectedValue = reader["assessmentType"].ToString();
                txtAssDate.Text = reader["assessmentDate"].ToString();//TODO Date is not properly stored in database
                txtAssDesc.Text = reader["assessmentDescription"].ToString();
                txtAssVenue.Text = reader["assessmentVenue"].ToString();
                Label1.Text = reader["classAverage"].ToString();
                dropAssWeight.SelectedValue = reader["assessmentWeightage"].ToString();
            }
                    con.Close();

            txtAssID.Enabled = false;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);


            string sql ="UPDATE [Assessment Information] " +
                        "SET assessmentName = @name, " +
                        "assessmentType =@type, " +
                        "assessmentDate = @date, " +
                        "assessmentDescription = @desc, " +
                        "assessmentVenue =  @venue, " +
                        "classAverage = @average, " +
                        "assessmentWeightage =  @weight " +
                        "WHERE assessmentID = @AssID";


            OleDbCommand dbCommand = new OleDbCommand(sql, dbConnection);

            dbCommand.Parameters.AddWithValue("@name", txtAssName.Text);
            dbCommand.Parameters.AddWithValue("@type", dropAssType.SelectedValue);
            dbCommand.Parameters.AddWithValue("@date", txtAssDate.Text);
            dbCommand.Parameters.AddWithValue("@desc", txtAssDesc.Text);
            dbCommand.Parameters.AddWithValue("@venue", txtAssVenue.Text);
            dbCommand.Parameters.AddWithValue("@average", 0);
            dbCommand.Parameters.AddWithValue("@weight", dropAssWeight.SelectedValue);
            dbCommand.Parameters.AddWithValue("@AssID", txtAssID.Text);

            Label1.Text = txtAssID.Text;  
            dbConnection.Open();

            int ReturnCode = dbCommand.ExecuteNonQuery();

            if (ReturnCode == 1)
            {
                Response.Write("<script>alert('Assessment Updated Successfully');</script>");
                
                //TODO success message
            }
            else
            {
                Label1.Text = "Oof";

                //TODO error 
            }
            //Response.Redirect("LecturerViewAssessments.aspx");
        }
    }
}