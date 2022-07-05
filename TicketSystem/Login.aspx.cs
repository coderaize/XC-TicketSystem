using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class Login : System.Web.UI.Page
    {
        public string RedirectURL { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RedirectTo"] != null)
            {
                RedirectURL = Session["RedirectTo"].ToString();
                messageTxt.InnerText = "Please SignIn First";
            }
        }

        protected void SignInSubmitBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void SignInSubmitBtn_Click1(object sender, EventArgs e)
        {
            string us = usernameTxt.Value;
            string p = passwordTxt.Value;
            var passDT = info.getDS("select top(1) Password from tk_Users where Email = @email and isActive = 1 ", new System.Collections.Hashtable {
                { "email",us}
            }).Tables[0];
            if (passDT.Rows.Count == 1)
            {
                //if (p == Crypto.DecryptURLAES(passDT.Rows[0][0].ToString()))
                if (p == passDT.Rows[0][0].ToString())
                {
                    Session["Email"] = us;
                    if (!string.IsNullOrEmpty(RedirectURL))
                        Response.Redirect(RedirectURL);
                    else
                        Response.Redirect("Index");
                }
                else
                {
                    messageTxt.InnerText = "Invalid Credentials";
                }
            }
            else
            {
                messageTxt.InnerText = "User Does not Exists";
            }

        }
    }
}