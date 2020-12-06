using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication3.Models;

namespace WebApplication3
{
    public partial class LecturerHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                String emailAddress = Session["Email"].ToString();

                string CS;
                CS = ConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString;
                OleDbConnection dbconn = new OleDbConnection(CS);

                string sqlcmd = "SELECT * FROM [Lecturer]  WHERE [emailAddress] = @email";

                OleDbCommand cmd1 = new OleDbCommand(sqlcmd, dbconn);

                cmd1.Parameters.AddWithValue("@email", emailAddress);
                OleDbDataAdapter info = new OleDbDataAdapter();
                info.SelectCommand = cmd1;
                DataSet userSet = new DataSet();
                info.Fill(userSet);

                if ((userSet.Tables[0].Rows.Count) > 0)
                {
                    DataRow datarow = userSet.Tables[0].Rows[0];
                    txtTitle.Text = datarow.Field<string>("title");
                    txtFullName.Text = datarow.Field<string>("firstName") + " " + datarow.Field<string>("surname");
                    txtEmail.Text = emailAddress;
                    txtID.Text = datarow.Field<string>("IDNumber");
                    txtFaculty.Text = datarow.Field<string>("department");
                    txtStaffNum.Text = (datarow.Field<int>("staffNumber")).ToString();
                    txtTel.Text = datarow.Field<string>("officeTelephoneNumber");
                }


                dbconn.Close();
            }
        }
    }
}