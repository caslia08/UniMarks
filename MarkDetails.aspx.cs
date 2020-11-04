using System;
using System.Collections.Generic;
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