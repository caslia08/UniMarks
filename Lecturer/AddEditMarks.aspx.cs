using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.OleDb;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.Entity;

namespace WebApplication3.Lecturer
{
    public partial class AddEditMarks : System.Web.UI.Page
    {
        public string assID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            assID = this.Request.QueryString["AssessmentID"];
            //assID = "1008";
            Session["assessmentID"] = assID;

            Object[] resData;
            Object[] resData2;
            Boolean read;

            String cs;

            resData = new Object[1];
            resData2 = new Object[1];

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT moduleCode FROM [Assessment Information] WHERE (assessmentID = @assID)";
            String sqlCmd2 = "SELECT assessmentName FROM [Assessment Information] WHERE (assessmentID = @assID)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@assID", assID);

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
            reader.Close();

            cmd1 = new OleDbCommand(sqlCmd2, dbConn);
            cmd1.Parameters.AddWithValue("@assID", assID);
            reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData2);
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();

            dbConn.Close();

            String heading = "";
            heading += resData[0].ToString();
            heading += " " + resData2[0].ToString();
            txtHeader.InnerText += heading;
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerViewAssessments.aspx");
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gridViewMarks.PageIndex = e.NewPageIndex;
            //this.searchStudents();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "UPDATE[Assessment Results] SET markCaptured = @markCaptured WHERE([Assessment Results].studentNumber = @studentNumber AND[Assessment Results].assessmentID = @assID)";
            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);



            foreach (GridViewRow row in gridViewMarks.Rows)
            {
                dbConn.Open();
                TextBox txt = row.FindControl("txtMarks") as TextBox;
                if (txt != null && txt.Text != "")
                {
                    int newMark = int.Parse(txt.Text);

                    string studentNum = row.Cells[0].Text;
                    if (newMark <= 100)
                    {
                        cmd1.Parameters.AddWithValue("@markCaptured", newMark);
                        cmd1.Parameters.AddWithValue("@studentNumber", studentNum);
                        cmd1.Parameters.AddWithValue("@assID", assID);
                        cmd1.ExecuteNonQuery();
                    }
                }
                else
                {
                    txt.CssClass += " is-invalid";
                }

                dbConn.Close();

            }
        }
    }
}