using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.OleDb;

namespace WebApplication3
{
    public partial class LecturerViewAssessments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridViewAssessments.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (!this.IsPostBack)
            {
                //this.searchStudents();
            }
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
                        gridViewAssessments.DataSource = dt;
                        gridViewAssessments.DataBind();
                    }
                }
            }


        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            gridViewAssessments.PageIndex = e.NewPageIndex;
            //this.searchStudents();
        }

        protected void btnEditAss_Click(object sender, EventArgs e)
        {

                    
            if (Page.IsValid)
            {
                int row = gridViewAssessments.PageIndex;
                txtSearch.Text = row.ToString(); 
                //Response.Redirect("EditAssessment.aspx?AssessmentID=" + assID);
            }
            else
            { 
                //TODO error
            }

        }

        protected void gridViewAssessments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String isCreated = "false"; 
            if (e.CommandName == "EditStudents")
            {
                String assessmentID = e.CommandArgument.ToString();
                Response.Redirect("EditAssessment.aspx?AssessmentID=" + assessmentID + "&isCreate=" + isCreated);
            }
            else if (e.CommandName == "AddMarks")
            {
                String assessmentID = e.CommandArgument.ToString();
                Response.Redirect("AddMarks.aspx?AssessmentID=" + assessmentID);
            }

        }


    }
}