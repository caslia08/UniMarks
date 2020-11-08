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
            try
            {
                String bodyHeading = reasonForFlag.SelectedItem.Value;
                String bodyMain = elaborationOnFlag.Text.ToString();
                MailMessage mailMessage = new MailMessage("josephjasson@outlook.com", "s21796234@mandela.ac.za");

                mailMessage.Subject = "Flagged mark";

                mailMessage.Body = bodyHeading + "\n" + bodyMain;
                SmtpClient smtp = new SmtpClient("smtp.office365.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "hulu.com",
                    Password = "look away"

                };
                smtp.EnableSsl = true;
                smtp.Send(mailMessage);
            }
            catch (Exception ex)
            {
                //Add logic for pop-up to show here
            }
        }
    }
}