using System;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            statusPanel.Visible = false;
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {

            string Name = nameTxt.Value;
            string Email = emailTxt.Value;
            string password = passwordTxt.Value;
            if (Name != "" && Email != "" && password != "")
            {
                info.getDS("INSERT INTO [dbo].[tk_Users] ( [Name] ,[Email] ,[Password] ,[Type] ) VALUES (@name,@email,@password,'MOBILINK-USER')", new System.Collections.Hashtable {
                    {"name",Name },
                    {"email",Email},
                    //{"password",Crypto.EncryptURLAES(password) }
                    {"password",(password) }
                });
                formPanel.Visible = false;
                statusPanel.Visible = true;
            }
            else
            {
                messageTxt.InnerText = "Please Enter All Values To Sign Up";
            }
        }
    }
}