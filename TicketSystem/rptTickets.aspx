<%@ Page Title="" Language="C#" MasterPageFile="~/Ticket.Master" AutoEventWireup="true" CodeBehind="rptTickets.aspx.cs" Inherits="TicketSystem.rptTickets" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ctl00_body_report_viewer_ctl09_ctl02_ctl00{
            padding-top:0;
            padding-bottom:0;
            height:32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form runat="server" id="form_ticketReport">
        <div class="row">
            <div class="col-sm-12 p-xl">
                <div class="row">
                    <div class="col-sm-3">
                        <asp:Button type="button" class="btn btn-info btn-block" Text="Year" runat="server" ID="reportYear" OnClick="reportYear_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button type="button" class="btn btn-info btn-block" Text="Quarter" runat="server" ID="reportQuarter" OnClick="reportQuarter_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button type="button" class="btn btn-info btn-block" Text="Month" runat="server" ID="reportMonth" OnClick="reportMonth_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button type="button" class="btn btn-info btn-block" Text="Week" runat="server" ID="reportWeek" OnClick="reportWeek_Click" />
                    </div>

                </div>
            </div>
            <div class="col-sm-12">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="report_viewer" runat="server" Width="100%" Height="700px">
                </rsweb:ReportViewer>
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $('#reportBtn').siblings().removeClass('nav-active');
            $('#reportBtn').addClass("nav-active");
            $('#rptTicketBtn').siblings().removeClass('nav-active');
            $('#rptTicketBtn').addClass("nav-active");
        });
    </script>
    <%--<script src="Scripts/WebForms/MSAjax/MicrosoftAjax.js"></script>
    <script src="Scripts/WebForms/MSAjax/MicrosoftAjaxWebForms.js"></script>
    <script src="Scripts/WebForms/MSAjax/MicrosoftAjaxWebServices.js"></script>--%>
</asp:Content>
