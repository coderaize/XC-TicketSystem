<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Ticket.Master" CodeBehind="Operation.aspx.cs" Inherits="TicketSystem.Operation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <h3>Message:</h3>
        </div>
        <div class="col-sm-12">
            <p><%=GoToPage %></p>
        </div>
        <div>
            <a href="<%=GoToPage %>"><i class="fa fa-reply"></i> OK </a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <script></script>
</asp:Content>
