﻿using System;
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
    public partial class StudentDashboard : System.Web.UI.Page
    {
        long studentNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                String emailAddress = Session["Email"].ToString();
                Object[] resData = new Object[1];
                Boolean read;
                string CS;
                CS = ConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString;
                OleDbConnection dbconn = new OleDbConnection(CS);

                string sqlcmd = "SELECT [studentNumber] FROM [Student]  WHERE [emailAddress] = @email";

                OleDbCommand cmd1 = new OleDbCommand(sqlcmd, dbconn);

                cmd1.Parameters.AddWithValue("@email", emailAddress);

                dbconn.Open();
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
                dbconn.Close();

                if(resData[0] != null)
                {
                    studentNumber = (int)resData[0];
                }

            }


            setStudentName();
            populatePersonalDeatails();
            setUpDashboardCards();
        }

        private void setStudentName()
        {
            Object[] resData = new Object[1];
            Boolean read;
            string CS;
            CS = ConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString;
            OleDbConnection dbconn = new OleDbConnection(CS);

            string sqlcmd = "SELECT [firstName] FROM [Student]  WHERE [studentNumber] = @studNum";

            OleDbCommand cmd1 = new OleDbCommand(sqlcmd, dbconn);

            cmd1.Parameters.AddWithValue("@studNum", studentNumber);

            dbconn.Open();
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
            dbconn.Close();

            if (resData[0] != null)
            {
                firstNameHeading.InnerText ="Welcome, " + (String) resData[0];                
            }
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
            Session["ModuleName"] = "Linear Algebra";
            Response.Redirect("ModuleAssessments.aspx");
        }

        protected void redirectToRealAnalysis(object sender, EventArgs e)
        {
            Session["StudNum"] = studentNumber;
            Session["ModuleCode"] = "MATT202";
            Session["ModuleName"] = "Real Analysis";
            Response.Redirect("ModuleAssessments.aspx");
        }

        protected void redirectToComputerArchitecture2(object sender, EventArgs e)
        {
            Session["StudNum"] = studentNumber;
            Session["ModuleCode"] = "WRCV202";
            Session["ModuleName"] = "Computer Architecture 2.2";
            Response.Redirect("ModuleAssessments.aspx");
        }

        protected void redirectToAdvancedProgramming(object sender, EventArgs e)
        {
            Session["StudNum"] = studentNumber;
            Session["ModuleCode"] = "WRPV301";
            Session["ModuleName"] = "Advanced Programming 3.1";
            Response.Redirect("ModuleAssessments.aspx");
        }

    }

}