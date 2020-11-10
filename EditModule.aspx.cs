using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class EditModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.PreviousPage != null)
            {
                //int rowIndex = int.Parse(Request.QueryString["RowIndex"]);
                //GridView GridView1 = (GridView)this.Page.PreviousPage.FindControl("gridViewAssessments");
                //GridViewRow row = GridView1.Rows[rowIndex];
                //Label1.Text = rowIndex.ToString();
                //txtAssID.Text = row.Cells[0].Text;
                //this.AssID = int.Parse(row.Cells[0].Text);
                //txtAssName.Text = row.Cells[1].Text;
                //txtAssDesc.Text = row.Cells[2].Text;
                //txtAssDate.Text = row.Cells[3].Text;
                //dropAssType.SelectedValue = row.Cells[4].Text;
                //txtAssVenue.Text = row.Cells[5].Text;
                //dropAssWeight.SelectedValue = row.Cells[6].Text;
                ////lblId.Text = row.Cells[0].Text;
                ////lblName.Text = (row.FindControl("lblName") as Label).Text;
                ////lblCountry.Text = row.Cells[2].Text;

            }
            else
            {
                moduleCode.Text = "Big Oof";

            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {

        }
    }
}