using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using TicketSystem.App_Code;

namespace TicketSystem.API
{
    /// <summary>
    /// Summary description for TicketAPI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class TicketAPI : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        public void SessionTestEmail()
        {
            if (Session["Email"] == null)
            {
                Context.Response.Redirect("/Login");
                //Context.Response.End();
            }
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void CreateTicket(string Subject, string CC, string Domain, string SSO_Supervisor,
            string Priority, string Urgency, string Message, string Attachments)
        {
            SessionTestEmail();
            List<Attachment> attachments = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Attachment>>(Attachments);
            //Saving Attachments in File

            string Now = DateTime.Now.ToString("MM_dd_yyyy_H_mm");
            string allAttachments = "";
            attachments.ForEach(X =>
            {
                string fileName = Constants.GetRandomString(10) + "_" + Now + "_" + X.Name;
                string filePath = Server.MapPath("~/Attachments/" + fileName);
                File.WriteAllBytes(filePath, X.FileByes);
                allAttachments += filePath + ";";
            });

            try { File.WriteAllText(@"C:\Users\malik\Desktop\test.txt", Attachments); } catch { }
            string mainQuery = @"EXEC [dbo].[tk_CreateTicket] 
                                @UserEmail =@UserEmail, @CC=@CC,@Subject = @Subject, @Body  =  @Body, @AttachmentCount= @AttachmentCount, 
                                @Priority=@Priority, @Urgency=@Urgency, @Domain=@Domain,@SSOSupervisor =@SSOSupervisor ,@Attachments=@Attachments
                                ";
            var hT = new System.Collections.Hashtable {
                { "UserEmail",Session["Email"].ToString()},
                { "CC",CC.Replace(",",";")},
                { "Subject",Subject},
                { "Body",Message},
                { "AttachmentCount",attachments.Count },
                { "Priority",Priority },
                { "Urgency",Urgency },
                { "Domain",Domain },
                { "Attachments",allAttachments },
                { "SSOSupervisor",SSO_Supervisor}
            };

            var insertedID = info.getDS(mainQuery, hT).Tables[0].Rows[0][0];
            // Adding in Attachements  DB Table
            attachments.ForEach(X =>
            {
                string fileName = Constants.GetRandomString(10) + "_" + Now + "_" + X.Name;
                string filePath = Server.MapPath("~/Attachments/" + fileName);
                string attQuery = " INSERT INTO  [dbo].[tk_Attachments] ( [FileName] ,[FilePath] ,[FileSize] ,[SourceID] ,[SourceType] ,[SubjectName] ,[CreationTime] ,[UserID] ) VALUES ( @FileName,@FilePath,@FileSize,@SourceID,@SourceType,@SubjectName,GETDATE(),@UserID ) ";
                info.getDS(attQuery, new System.Collections.Hashtable {
                    { "UserID",Session["Email"].ToString()},
                    { "FileName", fileName },
                    { "FilePath",filePath},
                    { "FileSize",X.FileByes.Length.ToString()},
                    { "SourceID",Convert.ToUInt64(insertedID)},
                    { "SourceType","TICKET"},
                    { "SubjectName",Subject}
                });
                allAttachments += filePath + ";";
            });

            Context.Response.Write("Your Ticket Number is : " + Convert.ToUInt64(insertedID).ToString());
        }



        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetTicketInnerViews(string objectID, string objectType = "BODY")
        {
            SessionTestEmail();
            string response = "";
            if (objectType == "TICKET")
            {
                string query = "SELECT top(1) Body from tk_Tickets where ID = @id";
                response = info.getDS(query, new System.Collections.Hashtable { 
                    {"id",objectID } 
                }).Tables[0].Rows[0][0].ToString();
            }
            else
            {
                string query = "select top(1) ReplyBody from tk_Replies where ID = @id";
                response = info.getDS(query, new System.Collections.Hashtable {
                    {"id",objectID }
                }).Tables[0].Rows[0][0].ToString();
            }
            Context.Response.Write(response);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Operation(string Token)
        {
            SessionTestEmail();
            string Email = Session["Email"].ToString();
            var Operation = Newtonsoft.Json.JsonConvert.DeserializeObject<OperationUrl>(Crypto.DecryptURLAES(Token));
            if (Operation.OperationType == "CLOSE-TICKET")
            {
                info.getDS("UPDATE [dbo].[tk_Tickets] SET isClosed = 1 , ClosedByUser = '" + Email + "',  ClosedTime = GETDATE() WHERE ID = '" + Operation.OperationData + "'");
                Context.Response.Redirect("/MyTickets");
            }
        }



        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AddReply(string TicketID, string Message)
        {
            SessionTestEmail();
            info.getDS("INSERT INTO [dbo].[tk_Replies] ([TicketID] ,[ReplyBody] ,[CreationTime] ,[AttachmentsCount] ,[ReplyByUser]) VALUES(@TicketID ,@ReplyBody ,GETDATE() ,'0',@ReplyByUser)",
            new System.Collections.Hashtable {
                { "TicketID",TicketID},
                { "ReplyBody",Message},
                { "ReplyByUser",Session["Email"].ToString() },
            });
            Context.Response.Write("Added");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetUserDetails(string Email)
        {
            SessionTestEmail();
            var dT = info.getDS("SELECT [ID] ,[UserEmail] ,[Subject] ,[Domain] ,[Priority] ,[Urgency] ,[CreationTime], ISNULL(Convert(varchar,[ClosedTime]),'Open') [ClosedTime], ISNULL(Convert(varchar,[ClosedByUser]),'Open') [ClosedByUser] FROM [dbo].[tk_Tickets] WHERE [UserEmail] = @Email ORDER BY [CreationTime] ASC",
            new System.Collections.Hashtable {
                { "Email",Email},
            }).Tables[0];
            Context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dT));
        }

    }






}
