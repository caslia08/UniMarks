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
        long studentNumber = 335975982;
        protected void Page_Load(object sender, EventArgs e)
        {
            populatePersonalDeatails();

        }

        private void populatePersonalDeatails()
        {
            Object[] resData = new Object[20];
            Object[] resData2 = new Object[1];
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

            title.InnerText = (String)resData[3];
            fullName.InnerText = (String)resData[1] + " " + (String)resData[2];
            emailAddress.InnerText = (String)resData[4];
            IDNumber.InnerText = resData[5].ToString();
            Faculty.InnerText = (String)resData[9];
            qualificationCode.InnerText = resData[8].ToString();
            studNum.InnerText = resData[0].ToString();
        }

    }
}