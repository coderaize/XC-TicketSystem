using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace TicketSystem.App_Code
{
    public class info
    {
        static string dBRadiusConnectionString => ConfigurationManager.ConnectionStrings["dBKillHouse"].ConnectionString;

        public static DataSet getDS(string sel, Hashtable hT = null)
        {
            var sqlDS = new SqlDataSource();
            sqlDS.ConnectionString = dBRadiusConnectionString;
            sqlDS.Selecting += (object sender, SqlDataSourceSelectingEventArgs e) => e.Command.CommandTimeout = 120;
            sqlDS.SelectCommand = sel;
            if (!(hT == null))
            {
                foreach (string x in hT.Keys)
                    sqlDS.SelectParameters.Add(x, hT[x].ToString());
            }
            sqlDS.CancelSelectOnNullParameter = false;
            DataView dV = (DataView)sqlDS.Select(System.Web.UI.DataSourceSelectArguments.Empty);
            if (!(dV == null))
                return dV.Table.DataSet;
            else
                return null;
        }
    }
}