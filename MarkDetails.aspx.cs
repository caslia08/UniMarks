using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class MarkDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long studentNumber; //Change to get from who ever is logged in
            long assessmentID; //Change to get from whatever ID was selected from the modules selected page
            Object[] resData;
            Object[] resData2;
            Object[] resData3;
            Object[] resData4;
            String cs;
            Boolean read;
            studentNumber = 335975982;
            assessmentID = 98405;
            resData = new Object[1];
            resData2 = new Object[1];
            resData3 = new Object[1]; //Probs perform count query on how many people are in db that took the assessement...
            resData4 = new Object[1];

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT [markCaptured] FROM [ASSESSMENT RESULTS] WHERE (studentNumber = @studentNum AND assessmentID = @assessmentID)";
            String sqlCmd2 = "SELECT MAX([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";
            String sqlCmd3 = "SELECT AVG([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";
            String sqlCmd4 = "SELECT MIN([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";

            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
            cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);

            dbConn.Open();
            OleDbDataReader reader = cmd1.ExecuteReader();
           
            
            if(reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData);
                    read = reader.Read();
                } while (read == true);    
            }
            reader.Close();

            cmd1 = new OleDbCommand(sqlCmd2, dbConn);
            cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);
            reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData2);
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();

            cmd1 = new OleDbCommand(sqlCmd3, dbConn);
            cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);
            reader = cmd1.ExecuteReader();
            
            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData3);
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();


            cmd1 = new OleDbCommand(sqlCmd4, dbConn);
            cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);
            reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData4);
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();

            dbConn.Close();

            studentMark.InnerText += resData[0].ToString() + "%";
            maxMark.InnerText += resData2[0].ToString() + "%";
            avgMark.InnerText += resData3[0].ToString() + "%";
            minMark.InnerText += resData4[0].ToString() + "%";
        }

        protected void submitFlagBtnClicked(object sender, EventArgs e)
        {

            string bodyHeading = Request.Form["AssType"];
            string bodyMain = AssDesc.InnerText;

            tester.InnerText = bodyHeading + bodyMain;

            //StringBuilder sb = new StringBuilder();
            //MailMessage mailMessage = new MailMessage("s219473498@mandela.ac.za", "s219473498@mandela.ac.za");

            //mailMessage.Subject = "Flagged mark";
            
            //mailMessage.Body = bodyHeading + "\n" + bodyMain;
            //SmtpClient smtp = new SmtpClient("smtp.office365.com", 587);
            //smtp.Credentials = new System.Net.NetworkCredential()
            //{
            //    UserName = "s219473498@mandela.ac.za",
            //    Password = "EafInt72"

            //};
            //smtp.EnableSsl = true;
            //smtp.Send(mailMessage);
        }
    }
}