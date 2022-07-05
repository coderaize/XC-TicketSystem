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
    public partial class Index : System.Web.UI.Page
    {

        public DataTable TicketDashDT { get; set; } = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            var userDT = info.getDS("SELECT Top(1) [Name] ,[Type] FROM [dbo].[tk_Users] WHERE Email = '" + Session["Email"].ToString() + "'").Tables[0].Rows[0];
            //if (((Ticket)this.Master).uType != "EXCELERON-USER" || ((Ticket)this.Master).uType != "MOBILINK-ADMIN")
            if (userDT["Type"].ToString() != "EXCELERON-USER" && userDT["Type"].ToString() != "MOBILINK-ADMIN")
            {
                Response.Redirect("MyTickets");
            }

            ((Ticket)this.Master).PageTitle = "Dashboard";
            TicketDashDT = info.getDS(@"
                SELECT 'OPENED', COUNT(ID) VALUE FROM tk_Tickets WHERE isClosed = 0
                union all
                SELECT 'CLOSED', COUNT(ID) VALUE FROM tk_Tickets WHERE isClosed = 1
                union all
                SELECT 'YEAR', COUNT(ID) VALUE FROM tk_Tickets WHERE CreationTime > DATEADD(YEAR,-1,GETDATE())
                union all
                SELECT 'MONTH', COUNT(ID) VALUE FROM tk_Tickets WHERE CreationTime > DATEADD(MONTH,-1,GETDATE())
                union all
                SELECT 'WEEK', COUNT(ID) VALUE FROM tk_Tickets WHERE CreationTime > DATEADD(WEEK,-1,GETDATE())
            ").Tables[0];
        }
    }
}