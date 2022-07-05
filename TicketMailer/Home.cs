using System;
using System.Windows.Forms;

namespace TicketMailer
{
    public partial class Home : Form
    {

        public string OutlookProfile { get; set; }
        public static Logger Logger { get; set; }

        public SendMailService SendMailService { get; set; }
        public Home()
        {
            InitializeComponent();
        }

        private void Home_Load(object sender, EventArgs e)
        {
            SetPropertiesByConfig();
            if (Properties.Settings.Default.RunAtStartup) { StartService(); }
        }

        void SetPropertiesByConfig()
        {
            OutlookProfile = Properties.Settings.Default.OutlookProfile;
            profileTxt.Text = OutlookProfile;
            attachmentPathTxt.Text = Properties.Settings.Default.AttachmentsDirectory;
            logPathTxt.Text = Properties.Settings.Default.LogsPath;
        }

        private void StartButton_Click(object sender, EventArgs e)
        {
            StartService();  
        }

        private void stopBtn_Click(object sender, EventArgs e)
        {
            StopService();
        }
        
        ////////////////////
        ////////////////////
        ////////////////////
        ////////////////////

        private void StartService()
        {
            Logger = new Logger(2000, Properties.Settings.Default.LogsPath, Properties.Settings.Default.DoLogs);
            SendMailService = new SendMailService(20*1000);
            SendMailService.Start();
            logTxt.AppendText("Service Started []" + DateTime.Now.ToString()+"\n");
        }

        private void StopService()
        {
            Logger.Dispose();
            Logger = null;
            SendMailService.Dispose();
            SendMailService = null;
            logTxt.AppendText("Service Stopped []" + DateTime.Now.ToString() + "\n");
        }

       
    }
}
