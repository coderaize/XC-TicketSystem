USE [master]
GO
/****** Object:  Database [dBKillHouse]    Script Date: 6/8/2020 1:27:26 AM ******/
CREATE DATABASE [dBKillHouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dBKillHouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dBKillHouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dBKillHouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dBKillHouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dBKillHouse] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dBKillHouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dBKillHouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dBKillHouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dBKillHouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dBKillHouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dBKillHouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [dBKillHouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dBKillHouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dBKillHouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dBKillHouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dBKillHouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dBKillHouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dBKillHouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dBKillHouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dBKillHouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dBKillHouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dBKillHouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dBKillHouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dBKillHouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dBKillHouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dBKillHouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dBKillHouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dBKillHouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dBKillHouse] SET RECOVERY FULL 
GO
ALTER DATABASE [dBKillHouse] SET  MULTI_USER 
GO
ALTER DATABASE [dBKillHouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dBKillHouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dBKillHouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dBKillHouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dBKillHouse] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dBKillHouse', N'ON'
GO
ALTER DATABASE [dBKillHouse] SET QUERY_STORE = OFF
GO
USE [dBKillHouse]
GO
/****** Object:  User [xclogin]    Script Date: 6/8/2020 1:27:27 AM ******/
CREATE USER [xclogin] FOR LOGIN [xclogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tk_Attachments]    Script Date: 6/8/2020 1:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_Attachments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](150) NOT NULL,
	[FilePath] [varchar](1000) NULL,
	[File] [varbinary](max) NULL,
	[FileSize] [float] NULL,
	[SourceID] [int] NULL,
	[SourceType] [varchar](100) NULL,
	[SubjectName] [varchar](max) NULL,
	[CreationTime] [datetime] NULL,
	[UserID] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tk_MailInbox]    Script Date: 6/8/2020 1:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_MailInbox](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MailFrom] [varchar](100) NULL,
	[MailCC] [varchar](max) NULL,
	[MailSubject] [nvarchar](max) NULL,
	[MailBody] [nvarchar](max) NULL,
	[Attachments] [nvarchar](max) NULL,
	[isReply] [bit] NOT NULL,
	[EntryID] [varchar](200) NOT NULL,
	[RecievedTime] [datetime] NULL,
	[InsertTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tk_MailOutbox]    Script Date: 6/8/2020 1:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_MailOutbox](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketID] [bigint] NOT NULL,
	[isReply] [bit] NOT NULL,
	[MailBy] [varchar](100) NULL,
	[MailTo] [varchar](100) NULL,
	[MailCC] [varchar](600) NULL,
	[MailSubject] [varchar](max) NULL,
	[MailBody] [nvarchar](max) NULL,
	[Attachments] [varchar](max) NULL,
	[InsertTime] [datetime] NOT NULL,
	[isSent] [bit] NOT NULL,
	[SentTime] [datetime] NULL,
	[ItemID] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tk_Replies]    Script Date: 6/8/2020 1:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_Replies](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketID] [bigint] NOT NULL,
	[ReplyBody] [varchar](max) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[AttachmentsCount] [int] NOT NULL,
	[ReplyByUser] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tk_Tickets]    Script Date: 6/8/2020 1:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_Tickets](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](100) NOT NULL,
	[CC] [varchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[AttachmentCount] [int] NULL,
	[Priority] [varchar](2) NULL,
	[Urgency] [varchar](2) NULL,
	[Domain] [varchar](50) NULL,
	[isApproved] [bit] NOT NULL,
	[ApprovedBy] [varchar](100) NULL,
	[CreationTime] [datetime] NOT NULL,
	[isClosed] [bit] NOT NULL,
	[ClosedByUser] [varchar](100) NULL,
	[ClosingReason] [varchar](500) NULL,
	[ClosedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tk_Users]    Script Date: 6/8/2020 1:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tk_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](256) NULL,
	[Type] [varchar](50) NOT NULL,
	[isVendor] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[CreationTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tk_Attachments] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[tk_MailInbox] ADD  DEFAULT ((0)) FOR [isReply]
GO
ALTER TABLE [dbo].[tk_MailInbox] ADD  DEFAULT (getdate()) FOR [InsertTime]
GO
ALTER TABLE [dbo].[tk_MailOutbox] ADD  DEFAULT ((0)) FOR [isReply]
GO
ALTER TABLE [dbo].[tk_MailOutbox] ADD  DEFAULT (getdate()) FOR [InsertTime]
GO
ALTER TABLE [dbo].[tk_MailOutbox] ADD  DEFAULT ((0)) FOR [isSent]
GO
ALTER TABLE [dbo].[tk_Replies] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[tk_Replies] ADD  DEFAULT ((0)) FOR [AttachmentsCount]
GO
ALTER TABLE [dbo].[tk_Tickets] ADD  DEFAULT ((1)) FOR [isApproved]
GO
ALTER TABLE [dbo].[tk_Tickets] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[tk_Tickets] ADD  DEFAULT ((0)) FOR [isClosed]
GO
ALTER TABLE [dbo].[tk_Users] ADD  DEFAULT ((0)) FOR [isVendor]
GO
ALTER TABLE [dbo].[tk_Users] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[tk_Users] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
/****** Object:  StoredProcedure [dbo].[tk_CreateTicket]    Script Date: 6/8/2020 1:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[tk_CreateTicket]
@UserEmail varchar(100), @CC  varchar(max), @Subject  nvarchar(max), @Body  nvarchar(max), @AttachmentCount  varchar(max), 
@Priority  varchar(max), @Urgency  varchar(max), @Domain  varchar(max) = '',@SSOSupervisor varchar(100) ,@Attachments varchar(max) = ''
as
BEGIN

Declare @InsertedID bigint = 0;
INSERT INTO [dbo].[tk_Tickets] ([UserEmail],[CC],[Subject],[Body],[AttachmentCount],[Priority],[Urgency],[Domain],[CreationTime] ) VALUES (@UserEmail, @CC, @Subject, @Body, @AttachmentCount, @Priority, @Urgency, @Domain, GETDATE() );
SELECT @InsertedID =  SCOPE_IDENTITY();


DECLARE @EmailTemplate varchar(max) = '
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office">
<head>
    <!--[if gte mso 9]><xml>
       <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
       </o:OfficeDocumentSettings>
      </xml><![endif]-->
    <!-- fix outlook zooming on 120 DPI windows devices -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- So that mobile will display zoomed in -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- enable media queries for windows phone 8 -->
    <meta name="format-detection" content="date=no"> <!-- disable auto date linking in iOS 7-9 -->
    <meta name="format-detection" content="telephone=no"> <!-- disable auto telephone linking in iOS 7-9 -->
    <title></title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   
</head>
<body style="margin:0;padding:0">

    <div class="container">
        <div class="row col-sm-12  bg-primary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-info" style="height:10px;"> </div>

        <div class="row col-sm-12 bg-secondary" style="height:50px;color:white;">
            <h4 style="margin:0 auto;margin-top: 5px;">Ticket: {{TICKET-NUMBER}}</h4>
        </div>
        <div class="row col-sm-12 bg-secondary" style="color:white">
            <div class="row" style="margin:0 auto;text-align:center">
                <div class=" col-sm-6">
                    <b>Raised By:</b> {{TICKET-RAISED-BY}}
                </div>
                <div class="col-sm-6">
                    <b>Domain:</b> {{TICKET-DOMAIN}}
                </div>
                <div class="col-sm-6">
                    <b>Subject:</b> {{TICKET-SUBJECT}}
                </div>
                <div class="col-sm-6">
                    <b>Priority:</b> {{TICKET-PRIORITY}} &nbsp; <b>Urgency:</b> {{TICKET-URGENCY}}
                </div>
                <div class="col-sm-6">
                    <b>SSO Supervisor:</b> {{TICKET-SSO-SUPERVISOR}}
                </div>
                <div class="col-sm-6">
                    <b>Creation Time:</b> {{TICKET-CREATION-TIME}}
                </div>
            </div>
        </div>
        <div class="row col-sm-12  bg-secondary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-primary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-info" style="height:10px;"> </div>
        <div class="row col-sm-12" style="height:10px;"> </div>

        <div class="row">
            <div class="col-sm-12">
                {{TICKET-BODY}}
            </div>
        </div>
        <div class="row col-sm-12" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-primary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-info" style="height:10px;"> </div>

        <div class="row col-sm-12 bg-secondary text-center">
            <div class="col-sm-12">
                <b style="">Regards,</b>
            </div>
            <div class="col-sm-12">
                <a href="https://excelerongroup.com" style="color:white">Exceleron Group</a>
            </div>

            <div class="col-sm-12">
                <b style="margin:0  auto">To Close this Ticket Click Below</b>
            </div>
            <div class="col-sm-12">
                <a class="btn btn-primary btn-md" href="{{TICKET-CLOSE-LINK}}">Close</a>
            </div>
        </div>
        <div class="row col-sm-12  bg-secondary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-primary" style="height:10px;"> </div>
        <div class="row col-sm-12  bg-info" style="height:10px;"> </div>

    </div>
    <style>
        :root{--blue:#007bff;--indigo:#6610f2;--purple:#6f42c1;--pink:#e83e8c;--red:#dc3545;--orange:#fd7e14;--yellow:#ffc107;--green:#28a745;--teal:#20c997;--cyan:#17a2b8;--white:#fff;--gray:#6c757d;--gray-dark:#343a40;--primary:#007bff;--secondary:#6c757d;--success:#28a745;--info:#17a2b8;--warning:#ffc107;--danger:#dc3545;--light:#f8f9fa;--dark:#343a40;--breakpoint-xs:0;--breakpoint-sm:576px;--breakpoint-md:768px;--breakpoint-lg:992px;--breakpoint-xl:1200px;--font-family-sans-serif:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";--font-family-monospace:SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace}*,::after,::before{box-sizing:border-box}html{font-family:sans-serif;line-height:1.15;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;-ms-overflow-style:scrollbar;-webkit-tap-highlight-color:transparent}body{margin:0;font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";font-size:1rem;font-weight:400;line-height:1.5;color:#212529;text-align:left;background-color:#fff}[tabindex="-1"]:focus{outline:0!important}h1,h2,h3,h4,h5,h6{margin-top:0;margin-bottom:.5rem}b{font-weight:bolder}a{color:#007bff;text-decoration:none;background-color:transparent;-webkit-text-decoration-skip:objects}a:hover{color:#0056b3;text-decoration:underline}a:not([href]):not([tabindex]){color:inherit;text-decoration:none}a:not([href]):not([tabindex]):focus,a:not([href]):not([tabindex]):hover{color:inherit;text-decoration:none}a:not([href]):not([tabindex]):focus{outline:0}[type=reset],[type=submit],html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner{padding:0;border-style:none}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{outline-offset:-2px;-webkit-appearance:none}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{font:inherit;-webkit-appearance:button}[hidden]{display:none!important}.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6{margin-bottom:.5rem;font-family:inherit;font-weight:500;line-height:1.2;color:inherit}.h1,h1{font-size:2.5rem}.h2,h2{font-size:2rem}.h3,h3{font-size:1.75rem}.h4,h4{font-size:1.5rem}.h5,h5{font-size:1.25rem}.h6,h6{font-size:1rem}.display-1{font-size:6rem;font-weight:300;line-height:1.2}.display-2{font-size:5.5rem;font-weight:300;line-height:1.2}.display-3{font-size:4.5rem;font-weight:300;line-height:1.2}.display-4{font-size:3.5rem;font-weight:300;line-height:1.2}.container{width:100%;padding-right:15px;padding-left:15px;margin-right:auto;margin-left:auto}@media (min-width:576px){.container{max-width:540px}}@media (min-width:768px){.container{max-width:720px}}@media (min-width:992px){.container{max-width:960px}}@media (min-width:1200px){.container{max-width:1140px}}.row{display:-webkit-box;display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-15px;margin-left:-15px}.col,.col-1,.col-10,.col-11,.col-12,.col-2,.col-3,.col-4,.col-5,.col-6,.col-7,.col-8,.col-9,.col-auto,.col-md,.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-auto,.col-sm,.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-auto{position:relative;width:100%;min-height:1px;padding-right:15px;padding-left:15px}.col{-ms-flex-preferred-size:0;flex-basis:0;-webkit-box-flex:1;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-auto{-webkit-box-flex:0;-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.col-1{-webkit-box-flex:0;-ms-flex:0 0 8.333333%;flex:0 0 8.333333%;max-width:8.333333%}.col-2{-webkit-box-flex:0;-ms-flex:0 0 16.666667%;flex:0 0 16.666667%;max-width:16.666667%}.col-3{-webkit-box-flex:0;-ms-flex:0 0 25%;flex:0 0 25%;max-width:25%}.col-4{-webkit-box-flex:0;-ms-flex:0 0 33.333333%;flex:0 0 33.333333%;max-width:33.333333%}.col-5{-webkit-box-flex:0;-ms-flex:0 0 41.666667%;flex:0 0 41.666667%;max-width:41.666667%}.col-6{-webkit-box-flex:0;-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}.col-7{-webkit-box-flex:0;-ms-flex:0 0 58.333333%;flex:0 0 58.333333%;max-width:58.333333%}.col-8{-webkit-box-flex:0;-ms-flex:0 0 66.666667%;flex:0 0 66.666667%;max-width:66.666667%}.col-9{-webkit-box-flex:0;-ms-flex:0 0 75%;flex:0 0 75%;max-width:75%}.col-10{-webkit-box-flex:0;-ms-flex:0 0 83.333333%;flex:0 0 83.333333%;max-width:83.333333%}.col-11{-webkit-box-flex:0;-ms-flex:0 0 91.666667%;flex:0 0 91.666667%;max-width:91.666667%}.col-12{-webkit-box-flex:0;-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}@media (min-width:576px){.col-sm{-ms-flex-preferred-size:0;flex-basis:0;-webkit-box-flex:1;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-sm-auto{-webkit-box-flex:0;-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.col-sm-1{-webkit-box-flex:0;-ms-flex:0 0 8.333333%;flex:0 0 8.333333%;max-width:8.333333%}.col-sm-2{-webkit-box-flex:0;-ms-flex:0 0 16.666667%;flex:0 0 16.666667%;max-width:16.666667%}.col-sm-3{-webkit-box-flex:0;-ms-flex:0 0 25%;flex:0 0 25%;max-width:25%}.col-sm-4{-webkit-box-flex:0;-ms-flex:0 0 33.333333%;flex:0 0 33.333333%;max-width:33.333333%}.col-sm-5{-webkit-box-flex:0;-ms-flex:0 0 41.666667%;flex:0 0 41.666667%;max-width:41.666667%}.col-sm-6{-webkit-box-flex:0;-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}.col-sm-7{-webkit-box-flex:0;-ms-flex:0 0 58.333333%;flex:0 0 58.333333%;max-width:58.333333%}.col-sm-8{-webkit-box-flex:0;-ms-flex:0 0 66.666667%;flex:0 0 66.666667%;max-width:66.666667%}.col-sm-9{-webkit-box-flex:0;-ms-flex:0 0 75%;flex:0 0 75%;max-width:75%}.col-sm-10{-webkit-box-flex:0;-ms-flex:0 0 83.333333%;flex:0 0 83.333333%;max-width:83.333333%}.col-sm-11{-webkit-box-flex:0;-ms-flex:0 0 91.666667%;flex:0 0 91.666667%;max-width:91.666667%}.col-sm-12{-webkit-box-flex:0;-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}}@media (min-width:768px){.col-md{-ms-flex-preferred-size:0;flex-basis:0;-webkit-box-flex:1;-ms-flex-positive:1;flex-grow:1;max-width:100%}.col-md-auto{-webkit-box-flex:0;-ms-flex:0 0 auto;flex:0 0 auto;width:auto;max-width:none}.col-md-1{-webkit-box-flex:0;-ms-flex:0 0 8.333333%;flex:0 0 8.333333%;max-width:8.333333%}.col-md-2{-webkit-box-flex:0;-ms-flex:0 0 16.666667%;flex:0 0 16.666667%;max-width:16.666667%}.col-md-3{-webkit-box-flex:0;-ms-flex:0 0 25%;flex:0 0 25%;max-width:25%}.col-md-4{-webkit-box-flex:0;-ms-flex:0 0 33.333333%;flex:0 0 33.333333%;max-width:33.333333%}.col-md-5{-webkit-box-flex:0;-ms-flex:0 0 41.666667%;flex:0 0 41.666667%;max-width:41.666667%}.col-md-6{-webkit-box-flex:0;-ms-flex:0 0 50%;flex:0 0 50%;max-width:50%}.col-md-7{-webkit-box-flex:0;-ms-flex:0 0 58.333333%;flex:0 0 58.333333%;max-width:58.333333%}.col-md-8{-webkit-box-flex:0;-ms-flex:0 0 66.666667%;flex:0 0 66.666667%;max-width:66.666667%}.col-md-9{-webkit-box-flex:0;-ms-flex:0 0 75%;flex:0 0 75%;max-width:75%}.col-md-10{-webkit-box-flex:0;-ms-flex:0 0 83.333333%;flex:0 0 83.333333%;max-width:83.333333%}.col-md-11{-webkit-box-flex:0;-ms-flex:0 0 91.666667%;flex:0 0 91.666667%;max-width:91.666667%}.col-md-12{-webkit-box-flex:0;-ms-flex:0 0 100%;flex:0 0 100%;max-width:100%}}.btn{display:inline-block;font-weight:400;text-align:center;white-space:nowrap;vertical-align:middle;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;border:1px solid transparent;padding:.375rem .75rem;font-size:1rem;line-height:1.5;border-radius:.25rem;transition:color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out}.btn:focus,.btn:hover{text-decoration:none}.btn:focus{outline:0;box-shadow:0 0 0 .2rem rgba(0,123,255,.25)}.btn:disabled{opacity:.65}.btn-primary{color:#fff;background-color:#007bff;border-color:#007bff}.btn-primary:hover{color:#fff;background-color:#0069d9;border-color:#0062cc}.btn-primary:focus{box-shadow:0 0 0 .2rem rgba(0,123,255,.5)}.btn-primary:disabled{color:#fff;background-color:#007bff;border-color:#007bff}.btn-secondary{color:#fff;background-color:#6c757d;border-color:#6c757d}.btn-secondary:hover{color:#fff;background-color:#5a6268;border-color:#545b62}.btn-secondary:focus{box-shadow:0 0 0 .2rem rgba(108,117,125,.5)}.btn-secondary:disabled{color:#fff;background-color:#6c757d;border-color:#6c757d}.btn-info{color:#fff;background-color:#17a2b8;border-color:#17a2b8}.btn-info:hover{color:#fff;background-color:#138496;border-color:#117a8b}.btn-info:focus{box-shadow:0 0 0 .2rem rgba(23,162,184,.5)}.btn-info:disabled{color:#fff;background-color:#17a2b8;border-color:#17a2b8}.btn-link{font-weight:400;color:#007bff;background-color:transparent}.btn-link:hover{color:#0056b3;text-decoration:underline;background-color:transparent;border-color:transparent}.btn-link:focus{text-decoration:underline;border-color:transparent;box-shadow:none}.btn-link:disabled{color:#6c757d}.btn-group-sm>.btn,.btn-sm{padding:.25rem .5rem;font-size:.875rem;line-height:1.5;border-radius:.2rem}.btn-group{position:relative;display:-webkit-inline-box;display:-ms-inline-flexbox;display:inline-flex;vertical-align:middle}.btn-group>.btn{position:relative;-webkit-box-flex:0;-ms-flex:0 1 auto;flex:0 1 auto}.btn-group>.btn:hover{z-index:1}.btn-group>.btn:active,.btn-group>.btn:focus{z-index:1}.btn-group .btn+.btn,.btn-group .btn+.btn-group,.btn-group .btn-group+.btn,.btn-group .btn-group+.btn-group{margin-left:-1px}.btn-group>.btn:first-child{margin-left:0}.btn-group>.btn-group:not(:last-child)>.btn{border-top-right-radius:0;border-bottom-right-radius:0}.btn-group>.btn-group:not(:first-child)>.btn,.btn-group>.btn:not(:first-child){border-top-left-radius:0;border-bottom-left-radius:0}tr{page-break-inside:avoid}h2,h3{orphans:3;widows:3}h2,h3{page-break-after:avoid}@page{size:a3}body{min-width:992px!important}.container{min-width:992px!important}
    </style>
</body>
</html>
';
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-NUMBER}}', @InsertedID );
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-RAISED-BY}}', @UserEmail);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-DOMAIN}}', @Domain);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-SUBJECT}}', @Subject);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-PRIORITY}}', @Priority);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-URGENCY}}', @Urgency);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-BODY}}', @Body);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-CREATION-TIME}}', GETDATE());
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-SSO-SUPERVISOR}}', @SSOSupervisor);
SET @EmailTemplate = Replace(@EmailTemplate,'{{TICKET-CLOSE-LINK}}', '');
INSERT INTO [dbo].[tk_MailOutbox]  ([TicketID] ,[isReply] ,[MailTo] ,[MailCC] ,[MailSubject] ,[MailBody] ,[Attachments])  VALUES (@InsertedID, 0,@UserEmail,@CC,@Subject,@EmailTemplate,@Attachments)

select @InsertedID

END
GO
/****** Object:  StoredProcedure [dbo].[tk_ReadMails]    Script Date: 6/8/2020 1:27:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[tk_ReadMails]
@From varchaR(100), @CC varchar(max) = '', @Subject nvarchar(max) ='',@Body nvarchar(max) ='',@Attachments varchar(max) ='',
@isReply varchar(1), @EntryID varchar(200),@RecievedTime datetime
as
BEGIN
	INSERT INTO [dbo].[tk_MailInbox]([MailFrom],[MailCC],[MailSubject],[MailBody],[Attachments],[isReply],[EntryID],RecievedTime)
	VALUES(@From,@CC,@Subject,@Body,@Attachments,Convert(bit,@isReply),@EntryID,@RecievedTime)
END
GO
USE [master]
GO
ALTER DATABASE [dBKillHouse] SET  READ_WRITE 
GO
