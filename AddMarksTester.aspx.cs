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

namespace WebApplication3
{
    public partial class AddMarksTester : System.Web.UI.Page
    {
        public string assID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //assID = this.Request.QueryString["AssessmentID"];
           // loadTable();
        }

        private void loadTable()
        {
            DataTable table = new DataTable();
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);


            String sql = "SELECT Student.studentNumber, Student.surname, Student.firtsName, [Assessment Results].markCaptured " +
                "FROM Student INNER JOIN[Assessment Results] ON Student.[studentNumber] = [Assessment Results].[studentNumber] WHERE[Assessment Results].assessmentID = 98405";

            OleDbCommand cmd = new OleDbCommand(sql, dbConnection);
            cmd.Parameters.AddWithValue("@AssID", assID);

            OleDbDataAdapter sqlData = new OleDbDataAdapter(cmd);
            sqlData.Fill(table);

            gridViewMarks.DataSource = table;
            gridViewMarks.DataBind();
        }

        protected void gridViewMarks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Student Number";
                e.Row.Cells[1].Text = "Last Name";
                e.Row.Cells[2].Text = "First Name";
                e.Row.Cells[3].Text = "Mark";

                e.Row.Cells[3].Enabled = true; 
            }
        }

        protected void gridViewMarks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridView gridView = (GridView)sender;
            DataTable dt = new DataTable();
            DataRow dr;
        }
    }
}