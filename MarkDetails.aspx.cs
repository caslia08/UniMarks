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


            String bodyHeading = reasonForFlag.SelectedItem.Value;
            String bodyMain = elaborationOnFlag.Text.ToString();
            MailMessage mailMessage = new MailMessage("josephjasson@outlook.com", "josephjasson@outlook.com");

            mailMessage.Subject = "Flagged mark";

            mailMessage.Body = bodyHeading + "\n" + bodyMain;
            SmtpClient smtp = new SmtpClient("smtp.office365.com", 587);
            smtp.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "josephjasson@outlook.com",
                Password = "Fuck off"

            };
            smtp.EnableSsl = true;
            smtp.Send(mailMessage);
        }
    }
}