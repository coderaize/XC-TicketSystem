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
    public partial class rptUsers : System.Web.UI.Page
    {

        public DataTable UserCountsDT { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Ticket)this.Master).PageTitle = "User Report";
            UserCountsDT = info.getDS(@"
                select * from (

	                select *,(select top(1) CreationTime from tk_Tickets where UserEmail = A.Email) LastTicket from 
	                (
	                select Name,Email,Phone,isActive from tk_Users
	                )A
	                left join
	                (
	                select top(10000) Count(*) Counts, UserEmail from tk_Tickets group by UserEmail
	                )B
	                on(A.Email = B.UserEmail)
                )AA where AA.Counts > 0
            ").Tables[0];



        }
    }
}