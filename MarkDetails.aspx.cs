using System;
using System.Collections;
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
        String moduleCode = "LARA201";
        ArrayList allMakrs = new ArrayList();
        long studNum = 335975982;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                long studentNumber; //Change to get from who ever is logged in
                long assessmentID; //Change to get from whatever ID was selected from the modules selected page
                Object[] resData;
                Object[] resData2;
                Object[] resData3;
                Object[] resData4;
                Object[] resData5;
                String cs;
                Boolean read;
                studentNumber = 335975982;
                if (Session["assessmentID"] != null)
                {
                    assessmentID = (long)Session["assessmentID"];
                }
                else
                {
                    assessmentID = 98405; 
                }
                if (Session["assessmentName"] != null)
                {
                    mainHeadingP.InnerText = (String)Session["assessmentName"] + ", Mark Details";
                }

             
                resData = new Object[1];
                resData2 = new Object[1];
                resData3 = new Object[1];
                resData4 = new Object[1];
                resData5 = new Object[1];

                cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                OleDbConnection dbConn = new OleDbConnection(cs);

                String sqlCmd1 = "SELECT [markCaptured] FROM [ASSESSMENT RESULTS] WHERE (studentNumber = @studentNum AND assessmentID = @assessmentID)";
                String sqlCmd2 = "SELECT MAX([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";
                String sqlCmd3 = "SELECT AVG([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";
                String sqlCmd4 = "SELECT MIN([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";
                String sqlCmd5 = "SELECT [markCaptured] FROM [ASSESSMENT RESULTS] WHERE (assessmentID = @assessmentID)";

                OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

                cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
                cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);

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

                cmd1 = new OleDbCommand(sqlCmd5, dbConn);
                cmd1.Parameters.AddWithValue("@assessmentID", assessmentID);
                reader = cmd1.ExecuteReader();

                if (reader.Read() == true)
                {
                    do
                    {
                        reader.GetValues(resData5);
                        allMakrs.Add(resData5[0]);
                        read = reader.Read();
                    } while (read == true);
                }
                reader.Close();
                dbConn.Close();

                studentMark.InnerText += resData[0].ToString() + "%";
                maxMark.InnerText += resData2[0].ToString() + "%";
                avgMark.InnerText += resData3[0].ToString() + "%";
                minMark.InnerText += resData4[0].ToString() + "%";

                getBarChart();
                getPieChart();
                getLineChart();
            }
        }

        private String getRangeValues()
        {
            int[] rangesArray = new int[10];
            String ranges = "[";
            for (int i = 0; i < allMakrs.Count; i++)
            {
                if ((int)((int)allMakrs[i] / 10) != 100)
                {
                    rangesArray[(int)((int)allMakrs[i] / 10)] += 1;
                }
                else
                {
                    rangesArray[rangesArray.Length - 1] += 1;

                }
            }

            for (int i = 0; i < rangesArray.Length; i++)
            {

                ranges += rangesArray[i];
                if (i != rangesArray.Length - 1)
                {
                    ranges += ",";
                }
            }
            return ranges += "],";
        }

        private String getPercentageValues()
        {
            String ranges = "[";
            for (int i = 0; i < allMakrs.Count; i++)
            {
                ranges += allMakrs[i];
                if (i != allMakrs.Count - 1)
                {
                    ranges += ",";
                }
            }
            return ranges += "],";
        }

        private String getNumStudentsStringForChart()
        {
            String res = "[";
            for (int i = 0; i < allMakrs.Count; i++)
            {
                res += i + 1;
                if (i != allMakrs.Count - 1)
                {
                    res += ",";
                }
            }
            return res += "],";
        }
        private void getBarChart()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>");
            sb.Append("let myBarChart = document.getElementById('my-Bar-Chart').getContext('2d');");
            sb.Append("let marksBarChart = new Chart(myBarChart, { " +
            "type: 'bar'," +
            "data: {" +
            "labels: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']," +
            "datasets: [{" +
                "label: ''," +
                    "data:");
            String dataValues = getRangeValues();
            //get datavalues 

            sb.Append(dataValues);
            sb.Append("backgroundColor: ['rgba(153, 0, 0, 0.6)', 'rgba(204, 0, 0, 0.6)','rgba(255, 0, 0, 0.6)','rgba(255, 48, 48, 0.6)','rgba(0, 0, 153, 0.6)','rgba(0, 125, 255, 0.6)','rgba(0, 204, 204, 0.6)','rgba(0,153 , 0, 0.6)','rgba(0, 255, 0, 0.6)','rgba(204, 255, 153, 0.6)'],");
            sb.Append("borderColor: ['rgba(153, 0, 0, 0.1)','rgba(204, 0, 0, 0.1)','rgba(255, 0, 0, 0.1)','rgba(255, 48, 48, 0.1)','rgba(0, 0, 153, 0.1)','rgba(0, 125, 255, 0.1)','rgba(0, 204, 204, 0.1)','rgba(0,153 , 0, 0.1)','rgba(0, 255, 0, 0.1)','rgba(204, 255, 153, 0.1)'],borderWidth: 1,hoverBorderWidth: 2, hoverBorderColor: '#000'}]},");
            sb.Append("options:{title:{display: true,text: 'Marks distrabution',fontSize: 25},legend:{display: false}," +
                "scales:" +
                "{xAxes: [{scaleLabel:{display: true,labelString: 'percentage range'}}]," +
                "yAxes: [{scaleLabel:{display: true,labelString: 'Number of people'}" +
                ",ticks:{beginAtZero: true}}]}}});");
            sb.Append("</script>");
            chartsBar.Text = sb.ToString();
        }

        private void getLineChart()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>");
            sb.Append("let myLineChart = document.getElementById('my-Line-Chart').getContext('2d');");
            sb.Append("let marksLineChart = new Chart(myLineChart, { " +
            "type: 'line'," +
            "data: {" +
            "labels:");
            sb.Append(getNumStudentsStringForChart());
            sb.Append("datasets: [{" +
                "label: ''," +
                    "data:");
            String dataValues = getPercentageValues();
            //get datavalues 

            sb.Append(dataValues);
            sb.Append("backgroundColor: ['rgba(0, 125, 255, 0.6)',],");
            sb.Append("borderColor: ['rgba(0, 125, 255, 0.6)',],borderWidth: 1,hoverBorderWidth: 2, hoverBorderColor: '#000'}]},");
            sb.Append("options:{title:{display: true,text: 'Marks distrabution (Percentages optained)',fontSize: 25}," +
                "legend:{display: false" +
                "}," +
                "scales:" +
                "{xAxes: [{" +
                "scaleLabel:{display: true,labelString: 'students'}" +
                "}]," +
                "yAxes: [{" +
                "scaleLabel:{display: true,labelString: 'Percentage optained'}" +
                ",ticks:{beginAtZero: true}" +
                "}]}" +
                "}" +
                "});");
            sb.Append("</script>");
            chartsLine.Text = sb.ToString();
        }

        private void getPieChart()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script>");
            sb.Append("let myPieChart = document.getElementById('my-Pie-Chart').getContext('2d');");
            sb.Append("let marksPieChart = new Chart(myPieChart, { " +
            "type: 'pie'," +
            "data: {" +
            "labels: ['0-10', '10-20', '20-30', '30-40', '40-50', '50-60', '60-70', '70-80', '80-90', '90-100']," +
            "datasets: [{" +
                "label: ''," +
                    "data:");
            String dataValues = getRangeValues();
            //get datavalues 

            sb.Append(dataValues);
            sb.Append("backgroundColor: ['rgba(153, 0, 0, 0.6)', 'rgba(204, 0, 0, 0.6)','rgba(255, 0, 0, 0.6)','rgba(255, 48, 48, 0.6)','rgba(0, 0, 153, 0.6)','rgba(0, 125, 255, 0.6)','rgba(0, 204, 204, 0.6)','rgba(0,153 , 0, 0.6)','rgba(0, 255, 0, 0.6)','rgba(204, 255, 153, 0.6)'],");
            sb.Append("borderColor: ['rgba(153, 0, 0, 0.1)','rgba(204, 0, 0, 0.1)','rgba(255, 0, 0, 0.1)','rgba(255, 48, 48, 0.1)','rgba(0, 0, 153, 0.1)','rgba(0, 125, 255, 0.1)','rgba(0, 204, 204, 0.1)','rgba(0,153 , 0, 0.1)','rgba(0, 255, 0, 0.1)','rgba(204, 255, 153, 0.1)'],borderWidth: 1,hoverBorderWidth: 2, hoverBorderColor: '#000'}]},");
            sb.Append("options:{title:{display: true,text: 'Marks distrabution',fontSize: 25},legend:{display: true,position:'right'}," +
                "scales:" +
                "{ticks:{beginAtZero: true}}}});");
            sb.Append("</script>");
            chartsPie.Text = sb.ToString();
        }

        protected void submitFlagBtnClicked(object sender, EventArgs e)
        {
            try
            {
                String bodyHeading = reasonForFlag.SelectedItem.Value;
                String bodyMain = elaborationOnFlag.Text.ToString();
                String lectEmail = getLecturerEmail(moduleCode);
                String studMail = getStudMail();
                MailMessage mailMessage = new MailMessage(studMail, lectEmail);

                mailMessage.Subject = "Flagged mark";

                mailMessage.Body = bodyHeading + "\n" + bodyMain;
                SmtpClient smtp = new SmtpClient("smtp.office365.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = studMail,
                    Password = emailPassword.Text

                };
                smtp.EnableSsl = true;
                smtp.Send(mailMessage);
                Response.Write("<script>alert('Notification sent successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Email could not be sent. Check your password and interenet connection and try again');</script>");
            }
        }

        private String getStudMail()
        {
            String email = "";
            Boolean read;
            String cs;
            Object[] resData = new Object[1];
            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT [emailAddress] FROM [Student]" +
                "WHERE (studentNumber = @studentNumber)";
            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@studentNumber", studNum);

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
            email = (String)resData[0];
            return email;
        }
    

       
        private String getLecturerEmail(String moduleCode)
        {
            String email = "";
            Boolean read;
            String cs;
            Object[] resData = new Object[1];
            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);

            String sqlCmd1 = "SELECT [emailAddress] FROM ([ModulePresented] INNER JOIN [Lecturer] ON ModulePresented.staffNumber = Lecturer.staffNumber)" +
                "WHERE (moduleCode = @moduleCode)";
            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);

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
            email = (String)resData[0];
            return email;
        }
    }
}