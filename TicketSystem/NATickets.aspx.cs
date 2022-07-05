using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class NATickets : System.Web.UI.Page
    {
        public DataTable ClosedDT { get; set; } = new DataTable();
        public DataTable OpenDT { get; set; } = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Ticket)this.Master).PageTitle = "All Tickets";
            
            if (Session["Email"] != null)
            {
                ClosedDT = info.getDS("SELECT [ID] ,[UserEmail] ,[Subject] ,[Domain] ,[Priority] ,[Urgency] ,[CreationTime], [ClosedTime], [ClosedByUser] FROM [dbo].[tk_Tickets] WHERE [isClosed] = 1 ORDER BY [ClosedTime] DESC").Tables[0];

                OpenDT = info.getDS("SELECT [ID] ,[UserEmail] ,[Subject] ,[Domain] ,[Priority] ,[Urgency] ,[CreationTime] FROM [dbo].[tk_Tickets] WHERE [isClosed] = 0 ORDER BY [CreationTime] DESC").Tables[0];
            }
        }
    }
}