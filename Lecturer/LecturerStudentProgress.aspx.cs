using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class LecturerStudentProgress : System.Web.UI.Page
    {
        ArrayList allMarks = new ArrayList();
      
        protected void Page_Load(object sender, EventArgs e)
        {          
            int studentNumber;
            string moduleCode;
            string fullname =""; 
            //long studentNumber; //Change to get from who ever is logged in

            //long assessmentID; //Change to get from whatever ID was selected from the modules selected page
            Object[] resData;
            Object[] resData2;
            Object[] resData3;
            Object[] resData4;
            Object[] resData5;
            Object[] resData6;

            String cs;
            Boolean read;
            studentNumber = int.Parse(Session["studentNumber"].ToString()); ;
            moduleCode = Session["moduleCode"].ToString();
            resData = new Object[1];
            resData2 = new Object[1];
            resData3 = new Object[1]; //Probs perform count query on how many people are in db that took the assessement...
            resData4 = new Object[1];
            resData5 = new Object[1];
            resData6 = new Object[1];

            cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbConnection dbConn = new OleDbConnection(cs);


            String sqlCmd1 = "SELECT AVG([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (studentNumber = @studentNum AND moduleCode = @moduleCode)";
            String sqlCmd2 = "SELECT AVG([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (moduleCode = @moduleCode)";
            String sqlCmd3 = "SELECT COUNT([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (studentNumber = @studentNum AND  moduleCode = @moduleCode AND markCaptured > @mark )";
            String sqlCmd4 = "SELECT COUNT([markCaptured]) FROM [ASSESSMENT RESULTS] WHERE (studentNumber = @studentNum AND  moduleCode = @moduleCode AND markCaptured = @mark )";
            String sqlCmd5 = "SELECT [markCaptured] FROM [ASSESSMENT RESULTS] WHERE (moduleCode = @moduleCode)";
            String sqlCmd6 = "SELECT [firstName], [surname] FROM [STUDENT] WHERE (studentNumber = @studentNum)";



            OleDbCommand cmd1 = new OleDbCommand(sqlCmd1, dbConn);

            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
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

            cmd1 = new OleDbCommand(sqlCmd2, dbConn);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
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
            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            cmd1.Parameters.AddWithValue("@mark", 0);
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
            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            cmd1.Parameters.AddWithValue("@mark", 0);
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
            cmd1.Parameters.AddWithValue("@moduleCode", moduleCode);
            reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData5);
                    allMarks.Add(resData5[0]);
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();
    

            cmd1 = new OleDbCommand(sqlCmd6, dbConn);
            cmd1.Parameters.AddWithValue("@studentNum", studentNumber);
            reader = cmd1.ExecuteReader();

            if (reader.Read() == true)
            {
                do
                {
                    reader.GetValues(resData6);
                    fullname += resData6[0].ToString(); 
                    read = reader.Read();
                } while (read == true);
            }
            reader.Close();
            dbConn.Close();

            double studentAvg = Math.Round(double.Parse(resData[0].ToString()), 2);
            double classAvg = Math.Round(double.Parse(resData2[0].ToString()), 2);

            studentMark.InnerText += studentAvg.ToString() + "%";
            classAverage.InnerText += classAvg.ToString() + "%";
            numberAssComplete.InnerText += resData3[0].ToString();
            missedAssessments.InnerText += resData4[0].ToString();
            studentFullname.InnerText += fullname; 
            studentName.InnerText += (resData6[0].ToString() + "'s Average Mark");
            txtStudNamePrg.InnerText += fullname;
            txtModuleName.InnerText += moduleCode;

            getBarChart();
            getPieChart();
            getLineChart();
        }

        private String getRangeValues()
        {
            int size = allMarks.Count; 
            int[] rangesArray = new int[size];
            String ranges = "[";
            for (int i = 0; i < allMarks.Count; i++)
            {
                if ((int)((int)allMarks[i] / size) != 100)
                {
                    rangesArray[(int)((int)allMarks[i] / size)] += 1;
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
            for (int i = 0; i < allMarks.Count; i++)
            {
                ranges += allMarks[i];
                if (i != allMarks.Count - 1)
                {
                    ranges += ",";
                }
            }
            return ranges += "],";
        }

        private String getNumStudentsStringForChart()
        {
            String res = "[";
            for (int i = 0; i < allMarks.Count; i++)
            {
                res += i + 1;
                if (i != allMarks.Count - 1)
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
            sb.Append("options:{title:{display: true,text: 'Marks Distribution',fontSize: 25},legend:{display: false}," +
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
            sb.Append("options:{title:{display: true,text: 'Marks Distribution (Percentages Obtained)',fontSize: 25}," +
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
            sb.Append("options:{title:{display: true,text: 'Marks Distribution',fontSize: 25},legend:{display: true,position:'right'}," +
                "scales:" +
                "{ticks:{beginAtZero: true}}}});");
            sb.Append("</script>");
            chartsPie.Text = sb.ToString();
        }
    }
}