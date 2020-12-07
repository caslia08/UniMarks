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

        Boolean isInitial = false; 

        protected void Page_Load(object sender, EventArgs e)
        {
            String assessmentID;
            txtModuleName.InnerText += Session["moduleCode"].ToString();
            assessmentID = Session["assessmentID"].ToString();

            isInitial = (Boolean)Session["isInitial"]; 

            if (isInitial)
            { 
                txtAssID.Text = assessmentID;
                String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection con = new OleDbConnection(CS);

                string sql = "SELECT assessmentID, assessmentName, assessmentType, assessmentDate, assessmentDescription, assessmentVenue," +
                    "classAverage, assessmentWeightage FROM [Assessment Information] WHERE assessmentID = @assessmentID";


                OleDbCommand cmd = new OleDbCommand(sql, con);
                cmd.Parameters.AddWithValue("@assessmentID", assessmentID.ToString());
                //cmd.CommandText = sql;
                //cmd.Connection = con;
                con.Open();
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtAssID.Text = reader["assessmentID"].ToString();
                    txtAssName.Text = reader["assessmentName"].ToString();
                    dropAssType.SelectedValue = reader["assessmentType"].ToString();

                    string date = reader["assessmentDate"].ToString();
                    DateTime dateTime = Convert.ToDateTime(date);
                    txtAssDate.Text = dateTime.ToString("yyyy-MM-dd");
                    DateTime curDate = DateTime.Today.Date;
                    String today = curDate.ToString("yyyy-MM-dd");

                    if (DateTime.Compare(curDate, dateTime) > 0)
                        txtAssDate.Enabled = false;
                    else
                    {
                        txtAssDate.Attributes["min"] = today;
                    }

                    txtAssDesc.Text = reader["assessmentDescription"].ToString();
                    txtAssVenue.Text = reader["assessmentVenue"].ToString();
                    String placeHolder = reader["classAverage"].ToString();
                    dropAssWeight.SelectedValue = reader["assessmentWeightage"].ToString();
                }

                con.Close();
                isInitial = false;
                Session["isInitial"] = isInitial; 
            }
            txtAssID.Enabled = false;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);


            string sql ="UPDATE [Assessment Information] " +
                        "SET [assessmentName] = @name, " +
                        "[assessmentType] =@type, " +                       
                        "[assessmentDescription] = @desc, " +
                        "[assessmentVenue] =  @venue, " +
                        "[assessmentWeightage] =  @weight " +
                        "WHERE assessmentID = @assessmentID";
            

            OleDbCommand dbCommand = new OleDbCommand(sql, dbConnection);

            dbCommand.Parameters.AddWithValue("@name",  txtAssName.Text);
            dbCommand.Parameters.AddWithValue("@type",  dropAssType.SelectedValue);          
            dbCommand.Parameters.AddWithValue("@desc",  txtAssDesc.Text);
            dbCommand.Parameters.AddWithValue("@venue", txtAssVenue.Text);
            dbCommand.Parameters.AddWithValue("@weight", dropAssWeight.SelectedValue);
            dbCommand.Parameters.AddWithValue("@assessmentID", txtAssID.Text);

            dbConnection.Open();

            int ReturnCode = dbCommand.ExecuteNonQuery();

            if (ReturnCode == 1)
            {
                Response.Write("<script>alert('Assessment Updated Successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Assessment could not be added');</script>");
            }
        }

        protected void btnCancelAss_Click(object sender, EventArgs e)
        {
            isInitial = false;
            Session["isInitial"] = false; 
            DateTime dateTime = DateTime.Today.AddDays(-30); 
            txtAssDate.Attributes["min"] = dateTime.ToString("yyyy-MM-dd");
            Response.Redirect("LecturerViewAssessments.aspx");
        }
    }
}


