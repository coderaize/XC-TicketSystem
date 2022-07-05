using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class Ticket : System.Web.UI.MasterPage
    {
        public string PageTitle { get; set; }
        public string uName { get; set; }
        public string uType { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Email"] = "info@abmalik.com";
            //if (Session["Email"] == null)
            //{
            //    Session["RedirectTo"] = HttpContext.Current.Request.Url.AbsolutePath;
            //    Response.Redirect("Login.aspx");
            //}
            //var userDT = info.getDS("SELECT Top(1) [Name] ,[Type] FROM [dbo].[tk_Users] WHERE Email = '" + Session["Email"].ToString() + "'").Tables[0].Rows[0];
            //uName = userDT["Name"].ToString();
            //uType = userDT["Type"].ToString();
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Session["RedirectTo"] = HttpContext.Current.Request.Url.AbsolutePath;
                Response.Redirect("Login.aspx");
            }
            var userDT = info.getDS("SELECT Top(1) [Name] ,[Type] FROM [dbo].[tk_Users] WHERE Email = '" + Session["Email"].ToString() + "'").Tables[0].Rows[0];
            uName = userDT["Name"].ToString();
            uType = userDT["Type"].ToString();
        }


    }
}