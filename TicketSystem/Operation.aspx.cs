using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class Operation : System.Web.UI.Page
    {
        public string GoToPage { get; set; }
        public string Message { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                if (Request.QueryString["Token"] != null)
                {
                    string Email = Session["Email"].ToString();
                    string Token = Request.QueryString["Token"].ToString();
                    var Operation = Newtonsoft.Json.JsonConvert.DeserializeObject<OperationUrl>(Crypto.DecryptURLAES(Token));
                    if (Operation.DateTime < DateTime.Now.AddHours(-1)) {
                        Message = "Invalid Key";
                        GoToPage = "Index";
                        return;
                    }
                    switch (Operation.OperationType)
                    {
                        case "CLOSE-TICKET":
                            info.getDS("UPDATE [dbo].[tk_Tickets] SET isClosed = 1 , ClosedByUser = '" + Email + "',  ClosedTime = GETDATE() WHERE ID = '" + Operation.OperationData + "'");
                            Message = "Ticket Number " + Operation.OperationData + " is Closed <br /> Time: " + DateTime.Now.ToString();
                            GoToPage = "MyTickets";
                            break;
                        case "APPROVE-TICKET":
                            info.getDS("UPDATE [dbo].[tk_Tickets] SET  isApproved = '" + Session["Email"].ToString() + "' ,ApprovedBy = '" + Email + "',  ClosedTime = GETDATE() WHERE ID = '" + Operation.OperationData + "'");
                            Message = "Ticket Number " + Operation.OperationData + " is Approved and Forwarded To XC <br /> Time: " + DateTime.Now.ToString();
                            GoToPage = "NATickets";
                            break;
                        case "LOGOUT":
                            Session.Clear();
                            Response.Redirect("/Login");
                            break;
                    }
                }
                else
                {
                    Response.Redirect("/Index");
                }
            }
            else
            {
                Session["RedirectTo"] = HttpContext.Current.Request.Url.AbsolutePath;
                Response.Redirect("/Login");
            }
        }
    }
}