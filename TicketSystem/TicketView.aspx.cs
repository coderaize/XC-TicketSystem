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
    public partial class TicketView : System.Web.UI.Page
    {
        public DataRow TicketRow { get; set; }
        public DataTable RepliesData { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                string ticketID = Request.QueryString["ID"].ToString();
                //TicketInformation
                TicketRow = info.getDS("SELECT TOP (1) [ID] ,[UserEmail] ,[CC] ,[Subject] ,[Priority] ,[Urgency] ,[Domain] ,[isApproved] ,[ApprovedBy] ,[CreationTime] ,[isClosed] ,[ClosedByUser] ,[ClosingReason] ,[ClosedTime] FROM [dBKillHouse].[dbo].[tk_Tickets] WHERE ID = @ID", new System.Collections.Hashtable {
                    { "ID",ticketID }
                }).Tables[0].Rows[0];

                //ReplyInformation
                RepliesData = info.getDS("SELECT [ID], [TicketID], [CreationTime], [ReplyByUser] FROM [dBKillHouse].[dbo].[tk_Replies] WHERE TicketID = @id ORDER BY CreationTime DESC",
                    new System.Collections.Hashtable {
                        { "id",ticketID}
                    }).Tables[0];

            }
            else
            {
                Response.Redirect("/Index");

            }

        }




    }

}