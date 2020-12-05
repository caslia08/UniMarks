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
        long studentNumber;
        String moduleCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            studentNumber = (long)Session["StudNum"];
            moduleCode = (String)Session["ModuleCode"];
            if (!IsPostBack)
            {
                String cs;
                cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbConn = new OleDbConnection(cs);

                String sqlCmd1 = "SELECT DISTINCT [assessmentName], [assessmentType], [assessmentDate], [assessmentDescription], [assessmentVenue] FROM ([ASSESSMENT RESULTS] INNER JOIN [Assessment Information] ON" +
                    "`ASSESSMENT RESULTS`.assessmentID = `Assessment Information`.assessmentID) WHERE (moduleCode = @moduleCode)";

                OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

                cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
                dbConn.Open();
                OleDbDataReader reader = cmd1.ExecuteReader();
                assessmentsView.DataSource = reader;
                assessmentsView.DataBind();
                dbConn.Close();

            }
        }

        protected void assessmentsViewRowCommand(object sender, GridViewCommandEventArgs e)
        {
            long assessmentID;
            if (e.CommandName == "ViewMark")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    //Reference the GridView Row.
                    GridViewRow row = assessmentsView.Rows[rowIndex];

                    String name = row.Cells[0].Text;
                    String venue = row.Cells[4].Text;
                    assessmentID = getAssessmentID(name, venue);
                    Session["assessmentID"] = assessmentID;
                    Session["assessmentName"] = name;
                    Session["studNum"] = studentNumber;
                    Response.Redirect("MarkDetails.aspx");
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('Could not load marks page. Try again or contact tech support');</script>");
                }
            }
        }

        private long getAssessmentID(String assessmentName, String assessmentVenue)
        {
            String cs;
            Boolean read;
            Object[] resData = new Object[1];
            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT [assessmentID] FROM [Assessment Information] WHERE (assessmentName = @assessmentName AND assessmentVenue = @assessmentVenue)"; //UHHHMMMMMMMMMM

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            //cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            cmd1.Parameters.AddWithValue("@assessmentName", assessmentName);
            cmd1.Parameters.AddWithValue("@assessmentVenue", assessmentVenue);
            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData);
                    read = reader.Read();
                } while (read == true);

            }
            dbConn.Close();
            return (int)resData[0];
        }
    }
}