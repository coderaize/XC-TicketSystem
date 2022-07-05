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
    public partial class CreateTicket : System.Web.UI.Page
    {
        public DataTable AdminUsers { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ((Ticket)this.Master).PageTitle = "Create Ticket";
            AdminUsers = info.getDS("SELECT Email from tk_Users WHERE Type = 'MOBILINK-ADMIN'").Tables[0];

        }
    }
}