using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace TicketMailer
{
    public class SendMailService
    {
        public Timer Timer { get; set; }
        private OutlookApplication OutlookApplication { get; set; }
        public SendMailService(double Interval)
        {
            Timer = new Timer(Interval);
            OutlookApplication = new OutlookApplication(Properties.Settings.Default.AttachmentsDirectory);
            Timer.Elapsed += (sender, args) =>
            {
                OutlookApplication.SendMails();
                OutlookApplication.GetMailsFromInbox();
            };
            
        }
        public void Start()
        {
            Timer.Start();
        }

        public void Dispose()
        {
            Empty();
        }

        private void Empty()
        {
            Timer.Stop();
            Timer.Dispose();
            OutlookApplication.Dispose();
            OutlookApplication = null;
            GC.Collect();
        }
    }
}
