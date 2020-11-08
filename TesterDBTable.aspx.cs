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
    public partial class TesterDBTable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnCreateAss_OnClick(object sender, EventArgs e)
        {
           // MessageLabel.Text = "I started";

            if (Page.IsValid)
            {
                string CS;
                CS = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbConnection = new OleDbConnection(CS);

                string sqlCommand = "INSERT into [Assessment Information]([assessmentID],[assessmentType],[assessmentDate],[assessmentDescription]," +
                    "[assessmentVenue],[classAverage],[assessmentWeightage] ) VALUES (@ID, @type, @date, @desc, @venue, @average, @weight)";

                OleDbCommand command = new OleDbCommand(sqlCommand, dbConnection);

                //command.Parameters.AddWithValue("@ID", txtAssID.Text);
                //command.Parameters.AddWithValue("@type", dropAssType.SelectedValue);
                //command.Parameters.AddWithValue("@date", txtDate.Text);
                //command.Parameters.AddWithValue("@desc", txtAssDesc.Text);
                //command.Parameters.AddWithValue("@venue", txtAssVenue.Text);
                //command.Parameters.AddWithValue("@average", 0);
                //command.Parameters.AddWithValue("@weight", dropAssWeight.Text);
               
                dbConnection.Open();
                int ReturnCode = command.ExecuteNonQuery();
                dbConnection.Close();

                if (ReturnCode == 1)
                {
                  //  MessageLabel.Text = "Reciped Added Successfully";
                }
                else
                {

                    //MessageLabel.Text = "Recipe not added Successfully";
                }

            }
            else
            {
               // MessageLabel.Text = "Problem on Page";
            }
        }

    }
}