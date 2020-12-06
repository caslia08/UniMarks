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
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            //this.searchStudents();

        }

        private void searchStudents()
        {
            String CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OleDbConnection con = new OleDbConnection(CS))
            {
                using (OleDbCommand cmd = new OleDbCommand())
                {
                    string sql = "SELECT assessmentID, assessmentName, assessmentType, assessmentDate, assessmentDescription, assessmentVenue," +
                        "classAverage, assessmentWeightage FROM Assessment Information";

                    if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                    {
                        sql += " WHERE assessmentName LIKE @AssName + '%'";
                        cmd.Parameters.AddWithValue("@AssName", txtSearch.Text.Trim());
                    }
                    cmd.CommandText = sql;
                    cmd.Connection = con;

                    using (OleDbDataAdapter sda = new OleDbDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gridViewStudents.DataSource = dt;
                        gridViewStudents.DataBind();
                    }
                }
            }


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