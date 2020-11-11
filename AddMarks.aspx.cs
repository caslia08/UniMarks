using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace WebApplication3
{
    public partial class AddMarks : System.Web.UI.Page
    {
        int assID = 0; 
        protected void Page_Load(object sender, EventArgs e)
        {
            assID = this.Request.QueryString["AssessmentID"];
            loadTable();
        }

        private void loadTable() {
            DataTable table = new DataTable();
            string CS;
            CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConnection = new OleDbConnection(CS);
            OleDbCommand cmd = new OleDbCommand();


            String sql = "SELECT Student.studentNumber, Student.surname, Student.firtsName, [Assessment Results].markCaptured " +
                "FROM Student INNER JOIN[Assessment Results] ON Student.[studentNumber] = [Assessment Results].[studentNumber] WHERE[Assessment Results].assessmentID = @AssID;";
             

            

            
            
            cmd.Parameters.AddWithValue("@AssID", assID.ToString());

        } 
    }
}