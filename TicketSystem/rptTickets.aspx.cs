using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TicketSystem.App_Code;

namespace TicketSystem
{
    public partial class rptTickets : System.Web.UI.Page
    {
        RDLC_Reports.DSets.TicketDSet ticketDSet { get; set; } = new RDLC_Reports.DSets.TicketDSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Ticket)this.Master).PageTitle = "Tickets Report";
            report_viewer.LocalReport.ReportPath = Server.MapPath("RDLC_Reports/TicketsRDLC.rdlc");
            if (!IsPostBack)
            {
                UpdateReport("Day", GetDataBy("day,-1"));
            }
        }


        private void UpdateReport(string Type,DataTable dT)
        {
            Microsoft.Reporting.WebForms.ReportParameter[] p = new Microsoft.Reporting.WebForms.ReportParameter[]
            {
                new Microsoft.Reporting.WebForms.ReportParameter("Dated",DateTime.Now.ToString()),
                new Microsoft.Reporting.WebForms.ReportParameter("Type",Type),
                
            };
            Microsoft.Reporting.WebForms.ReportDataSource rdt = new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", dT);
            report_viewer.LocalReport.DataSources.Clear();
            report_viewer.LocalReport.SetParameters(p);
            report_viewer.LocalReport.DataSources.Add(rdt);
            report_viewer.ZoomMode = Microsoft.Reporting.WebForms.ZoomMode.PageWidth;
            report_viewer.LocalReport.Refresh();

        }

        protected void reportYear_Click(object sender, EventArgs e)
        {
            UpdateReport("Year", GetDataBy("year,-1"));
        }

        protected void reportQuarter_Click(object sender, EventArgs e)
        {
            UpdateReport("Quarter", GetDataBy("month,-3"));
            
        }

        protected void reportMonth_Click(object sender, EventArgs e)
        {
            UpdateReport("Month", GetDataBy("month,-1"));
        }

        protected void reportWeek_Click(object sender, EventArgs e)
        {
            UpdateReport("Week", GetDataBy("week,-1"));
        }


        private DataTable GetDataBy(string value)
        {
            return info.getDS(@"
                SELECT [ID] ,[UserEmail] as RaisedBy, Convert(varchar,[CreationTime]) CreationTime   ,[Priority] ,[Urgency] ,[Subject], 
                (CASE WHEN [isClosed] = 1 THEN  'CLOSED' ELSE  'OPEN' END ) Status
                ,ISNULL(Convert(varchar,[ClosedTime]),'') as ClosingTime ,ISNULL([ClosingReason],'') CLosingReason 
                ,ISNULL([ClosedByUser],'') ClosedBy FROM [dbo].[tk_Tickets] WHERE CreationTime > DATEADD("+value+@",GETDATE())
                OR isClosed = 0
            ").Tables[0];
        }
    }
}