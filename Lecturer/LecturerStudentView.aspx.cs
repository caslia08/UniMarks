using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class LecturerStudentView : System.Web.UI.Page
    {
        string moduleCode; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ModuleCode"] != null)
            {
                moduleCode = Session["ModuleCode"].ToString();
            }
            Session["ModuleCode"] = moduleCode; 
            moduleCode = Session["ModuleCode"].ToString();
            txtModuleName.InnerText = moduleCode; 
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            //this.searchStudents();

        }

        private void searchStudents()
        {
            String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(CS);
                
           //string sql = "SELECT assessmentID, assessmentName, assessmentType, assessmentDate, assessmentDescription, assessmentVenue," +
           //    "classAverage, assessmentWeightage FROM Assessment Information";

           string sqlCmd1 = "SELECT Student.studentNumber, Student.firstName, Student.surname " +
               "FROM Student INNER JOIN ModuleTaken ON Student.studentNumber = ModuleTaken.studentNumber " +
               "WHERE (ModuleTaken.moduleCode = @moduleCode AND Student.studentNumber = @studentNumber )";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
                cmd1.Parameters.AddWithValue("@studentNumber", txtSearch.Text.Trim());
            }

            dbConn.Open();

            OleDbDataReader reader = cmd1.ExecuteReader();
            gridViewStudents.DataSource = null; 
            gridViewStudents.DataSource = reader;
            gridViewStudents.DataBind();
            //OleDbDataAdapter sda = new OleDbDataAdapter(cmd1);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);
            //gridViewStudents.DataSource = dt;
            //gridViewStudents.DataBind();

            dbConn.Close(); 
                    
                   


        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gridViewStudents.PageIndex = e.NewPageIndex;
            //this.searchStudents();
        }
  
        protected void gridViewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewProgress")
            {
                String studentNumber = e.CommandArgument.ToString();
                Session["studentNumber"] = studentNumber;
                Session["moduleCode"] = moduleCode;
                Response.Redirect("LecturerStudentProgress.aspx?StudentNumber=" + studentNumber + "&moduleCode=" + moduleCode);
            }
        }
    }
}