using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class ModuleAssessments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String cs;
            String moduleCode;
            long studentNumber;

            studentNumber = 335975982;
            moduleCode = "LARA201";
            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT [assessmentName], [assessmentType], [assessmentDate], [assessmentDescription], [assessmentVenue] FROM ([ASSESSMENT RESULTS] INNER JOIN [Assessment Information] ON" +
                "`ASSESSMENT RESULTS`.assessmentID = `Assessment Information`.assessmentID) WHERE (moduleCode = @moduleCode)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
            assessmentsView.DataSource = reader;
            assessmentsView.DataBind();
            dbConn.Close();
           
            //assessmentsView.Rows[0].Cells[0].Text = "Assessment name";
            //assessmentsView.Columns[1].HeaderText = "Date of assessment";
            //assessmentsView.Columns[2].HeaderText = "Description";
            //assessmentsView.Columns[3].HeaderText = "Venue";
            //assessmentsView.Columns[4].HeaderText = "Assessment name";
        }
    }
}