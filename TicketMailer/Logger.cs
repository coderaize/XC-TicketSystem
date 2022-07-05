using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TicketMailer
{
    public class Logger
    {
        private string LogsPath { get; set; }
        private StringBuilder LogsText { get; set; }
        private System.Timers.Timer LogWriter { get; set; }
        public Logger(double Intervals= 2000,string LogsPath = "Logs.txt",bool DoLogs = true)
        {
            LogsText = new StringBuilder();
            LogWriter = new System.Timers.Timer(Intervals);

            this.LogsPath = LogsPath;
            if (!File.Exists(LogsPath)) { File.WriteAllText(LogsPath, ""); }

            LogWriter.Elapsed += (sender, args) =>
            {
                if (DoLogs) { WriteLogsToFile(); }
            };
            LogWriter.Start();
        }

        
        public void AddLogs(string Text)
        {
            LogsText.Append("\n[D] " + DateTime.Now.ToString("MM/dd/yyyy hh:mm tt") + " [T] " + Text + " [E]");
        }

        private void WriteLogsToFile()
        {
            string Text = LogsText.ToString();
            LogsText.Clear();
            File.AppendAllText(LogsPath, Text);
            //using (StreamWriter file = new StreamWriter(LogsPath, true))
            //{
            //   file.WriteLineAsync(Text);
            //}
            GC.Collect();
        }

      
        public void Dispose()
        {
            Emtpy();
            GC.Collect();
        }

        private void Emtpy()
        {
            LogWriter.Stop();
            LogWriter.Dispose();
            LogsPath = "";
            LogsText.Clear();
            LogsText = null;
        }
    }
}
