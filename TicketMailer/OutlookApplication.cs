using System;
using System.Data;
using System.IO;
using System.Reflection;
using Outlook = Microsoft.Office.Interop.Outlook;

namespace TicketMailer
{
    public class OutlookApplication
    {

        public Outlook.Application OutlookApp { get; set; }
        public Outlook.NameSpace OutlookNameSpace { get; set; }
        public Outlook.MAPIFolder OutlookInbox { get; set; }
        private string AttachmentFolder { get; set; }
        public OutlookApplication()
        {
            OutlookApp = new Outlook.Application();
            // Get the MAPI namespace.
            OutlookNameSpace = OutlookApp.GetNamespace("MAPI");
            // Log on by using the default profile or existing session (no dialog box).
            OutlookNameSpace.Logon(Missing.Value, Missing.Value, false, true);
            //Get the Inbox folder.
            OutlookInbox = OutlookNameSpace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox);
        }

        public OutlookApplication(string AttachmentFolder)
        {
            OutlookApp = new Outlook.Application();
            // Get the MAPI namespace.
            OutlookNameSpace = OutlookApp.GetNamespace("MAPI");
            // Log on by using the default profile or existing session (no dialog box).
            OutlookNameSpace.Logon(Missing.Value, Missing.Value, false, true);
            //Get the Inbox folder.
            OutlookInbox = OutlookNameSpace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox);
            this.AttachmentFolder = AttachmentFolder;
        }

        public void GetMailsFromInbox()
        {
            try
            {
                OutlookInbox = OutlookNameSpace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox);
                Outlook.Items MailItems = OutlookInbox.Items;
                int count = 0;
                foreach (Outlook.MailItem Mail in MailItems)
                {
                    if (Mail.UnRead == false)
                    {
                        string attachments = "";
                        foreach (Outlook.Attachment attachment in Mail.Attachments)
                        {
                            string path = AttachmentFolder + @"\" + Constants.GetRandomString(10) + "_" + Mail.ReceivedTime.ToString("MM_dd_yyyy_H_mm") + "_" + attachment.FileName;
                            attachment.SaveAsFile(path);
                            attachments += path + ";";
                        }
                        string query = "EXEC [dbo].[tk_ReadMails] @From=@From, @CC = @CC , @Subject = @Subject ,@Body = @Body,@Attachments =@Attachments , @isReply=@isReply, @EntryID = @EntryID,@RecievedTime=@RecievedTime";
                        info.getDS(query, new System.Collections.Hashtable {
                            {"From",Mail.SenderEmailAddress},
                            {"CC",Mail.CC??""},
                            {"Subject",Mail.Subject},
                            {"Body",Mail.HTMLBody},
                            {"Attachments",attachments},
                            {"isReply",Mail.Subject.ToLower().StartsWith("re:")==true?1:0},
                            {"EntryID",Mail.EntryID},
                            {"RecievedTime",Mail.ReceivedTime},
                        });
                        Mail.UnRead = false;
                        count++;
                    }
                }
                Home.Logger.AddLogs("[RECIEVED] " + count + " [MAILS]");
            }
            catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
        }

        public void SendMails()
        {
            
            string Query = "SELECT TOP (10) [ID] ,[TicketID] ,[isReply] ,[MailTo] ,[MailCC] ,[MailSubject] ,[MailBody] ,[Attachments]  FROM [dbo].[tk_MailOutbox] WHERE isSent = 0 AND InsertTime >  DATEADD(MINUTE,-2,GETDATE()) ";
            var dT = info.getDS(Query).Tables[0];
            foreach(DataRow dr in dT.Rows)
            {
                if( Convert.ToBoolean(dr["isReply"]) == true)
                {
                    try
                    {
                        var eID = AddNewReply(dr["ItemID"].ToString(), dr["MailBody"].ToString(), dr["Attachments"].ToString().Split(';'));
                        info.getDS("UPDATE [dbo].[tk_MailOutbox] SET isSent = 1 ,ItemID = '"+ eID + "' WHERE ID = " + dr["ID"].ToString() + " ");
                    }
                    catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
                }
                else
                {
                    try
                    {
                        var eID = AddNewEmail(dr["MailTo"].ToString(), dr["MailCC"].ToString(), dr["MailSubject"].ToString(), dr["MailBody"].ToString(), dr["Attachments"].ToString().Split(';'));
                        info.getDS("UPDATE [dbo].[tk_MailOutbox] SET isSent = 1 ,ItemID = '" + eID + "' WHERE ID = " + dr["ID"].ToString() + " ");
                    }
                    catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
                }
            }
            Home.Logger.AddLogs("[SENT] "+dT.Rows.Count+" [MAILS]");

        }

        /// <summary>
        /// Adds a Mail Item in Outlook and Returns a Entry ID
        /// </summary>
        /// <param name="to"></param>
        /// <param name="cc"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        /// <param name="attachments"></param>
        /// <returns></returns>
        public string AddNewEmail(string to, string cc, string subject, string body, string[] attachments)
        {
            Outlook.MailItem eMail = (Outlook.MailItem)OutlookApp.CreateItem(Outlook.OlItemType.olMailItem);
            eMail.Subject = subject;
            eMail.To = to;
            eMail.CC = cc;
            eMail.HTMLBody = body;
            eMail.Importance = Outlook.OlImportance.olImportanceNormal;
            foreach (string X in attachments)
            {
                try { if (File.Exists(X)) eMail.Attachments.Add(X); } catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
            }
            try { ((Outlook._MailItem)eMail).Send(); } catch { }
            return eMail.EntryID;
        }

        /// <summary>
        /// Adds a Mail Item in Outlook and Returns a Entry ID
        /// </summary>
        /// <param name="mailID"></param>
        /// <param name="body"></param>
        /// <param name="attachments"></param>
        /// <returns></returns>
        public string AddNewReply(string mailID, string body, string[] attachments)
        {
            Outlook.MailItem getItem = (Outlook.MailItem)OutlookNameSpace.GetItemFromID(mailID);
            Outlook.MailItem eMail = getItem.ReplyAll();
            eMail.HTMLBody = body;
            eMail.Importance = Outlook.OlImportance.olImportanceNormal;
            foreach(string X in attachments)
            {
                try { if (File.Exists(X)) eMail.Attachments.Add(X); } catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
            }
            try { ((Outlook._MailItem)eMail).Send(); } catch { }
            return eMail.EntryID;
        }

        private void ReInitilizeApplication()
        {
            try
            {
                OutlookNameSpace.Logoff();
                OutlookInbox = null;
                OutlookNameSpace = null;
                OutlookApp = null;
                ////////////////////////////////////////////////////////
                ////////////////////////////////////////////////////////
                OutlookApp = new Outlook.Application();
                // Get the MAPI namespace.
                OutlookNameSpace = OutlookApp.GetNamespace("MAPI");
                // Log on by using the default profile or existing session (no dialog box).
                OutlookNameSpace.Logon(Missing.Value, Missing.Value, false, true);
                //Get the Inbox folder.
                OutlookInbox = OutlookNameSpace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderInbox);
            }
            catch (System.Exception t) { Home.Logger.AddLogs("[Ex] " + t.Message + " [ST] " + t.StackTrace); }
        }

        public void Dispose()
        {
            Empty();
        }
        private void Empty()
        {
            OutlookNameSpace = null;
            OutlookApp = null;
            OutlookInbox = null;
            GC.Collect();
        }
    }
}
