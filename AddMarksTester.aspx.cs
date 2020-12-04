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

namespace WebApplication3
{
    public partial class AddMarksTester : System.Web.UI.Page
    {
        public string assID = "";
        static Boolean isCreated = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            assID = this.Request.QueryString["AssessmentID"];
            if (!isCreated)
            {
               loadTable();
            }
        }

        private void loadTable()
        {
            DataTable table = new DataTable();
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);


            String sql = "SELECT Student.studentNumber, Student.surname, Student.firtsName, [Assessment Results].markCaptured " +
                "FROM Student INNER JOIN[Assessment Results] ON Student.[studentNumber] = [Assessment Results].[studentNumber] WHERE[Assessment Results].assessmentID = @AssID";

            OleDbCommand cmd = new OleDbCommand(sql, dbConnection);
            cmd.Parameters.AddWithValue("@AssID", assID);

            OleDbDataAdapter sqlData = new OleDbDataAdapter(cmd);
            sqlData.Fill(table);
            isCreated = true;
            Session["MarksTable"] = table; 
            BindData();

            if (table.Rows.Count == 0)
            {
                Warning.Text = "No Students are Currently Registered for Module";
            }
        }

        protected void gridViewMarks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    e.Row.Cells[5].Text = "Student Number";
            //    e.Row.Cells[6].Text = "Last Name";
            //    e.Row.Cells[7].Text = "First Name";
            //    e.Row.Cells[8].Text = "Mark";        
            //}
        }


        protected void gridViewMarks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridViewMarks.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gridViewMarks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridViewMarks.EditIndex = -1;
            BindData();
        }

        protected void gridViewMarks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)Session["MarksTable"];

            GridViewRow row = gridViewMarks.Rows[e.RowIndex];
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //DbContext dbContext = new DbContext(CS);

            OleDbConnection dbConnection = new OleDbConnection(CS);

            String sql = "UPDATE [Assessment Results] " +
                         "SET markCaptured = @newMark " +
                         "WHERE assessmentID = @AssID AND studentNumber = @studNum ";

            OleDbCommand cmd = new OleDbCommand(sql, dbConnection);

            //Control txtStudNum = gridViewMarks.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox txtMarks = (TextBox)gridViewMarks.Rows[e.RowIndex].Cells[4].Controls[0];

            string studNum = gridViewMarks.Rows[e.RowIndex].Cells[1].Text;
            int newMark;
            if (txtMarks.Text == null || txtMarks.Text == "")
            {
                newMark = 0;
            }
            else 
            {
                newMark = int.Parse(txtMarks.Text);
            }

            if (newMark > 100)
            {
                Response.Write("<script>alert('Mark must be less than or equal to 100');</script>");
                loadTable();
                return; 
            }

            cmd.Parameters.AddWithValue("@newMark", newMark);
            cmd.Parameters.AddWithValue("@AssID", assID);
            cmd.Parameters.AddWithValue("@studNum", studNum);
            
            dbConnection.Open(); 
            
            int ReturnCode = cmd.ExecuteNonQuery();
            
            if (ReturnCode == 1)
            {
                gridViewMarks.EditIndex = -1;
                loadTable();
                BindData();
                Response.Write("<script>alert('Assessment Updated Successfully');</script>");
            }
            else
            {
                loadTable();
                Response.Write("<script>alert('Assessment could not be added');</script>");
            }


        }

        private void BindData()
        {
            gridViewMarks.DataSource = Session["MarksTable"];
            gridViewMarks.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            isCreated = false;
            Response.Redirect("LecturerViewAssessments.aspx");
        }

        protected void gridViewMarks_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            //BindData();
            //loadTable(); 
        }
    }
}