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
    public partial class StudentDashboard : System.Web.UI.Page
    {
        long studentNumber = 216081504;
        protected void Page_Load(object sender, EventArgs e)
        {

            populatePersonalDeatails();
            setUpDashboardCards();
        }

        private void populatePersonalDeatails()
        {
            Object[] resData = new Object[20];
            Boolean read;
            String cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT * FROM [STUDENT] WHERE (studentNumber = @studentNum)";
            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);

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
            dbConn.Close();
            qualificatinName.InnerText = (String)resData[8];
            title.InnerText = (String)resData[3];
            fullName.InnerText = (String)resData[1] + " " + (String)resData[2];
            emailAddress.InnerText = (String)resData[4];
            IDNumber.InnerText = resData[5].ToString();
            qualificationCode.InnerText = resData[7].ToString();
            studNum.InnerText = resData[0].ToString();
        }

        private void setUpDashboardCards()
        {

            //dashboardCards.Text
        }

        protected void redirectToLinearAlgebra(object sender, EventArgs e)
        {
            Session["StudNum"] = studentNumber;
            Session["ModuleCode"] = "MATT212";
            Response.Redirect("ModuleAssessments.aspx");
        }

    }

}