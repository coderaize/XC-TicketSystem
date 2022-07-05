<%@ Page Title="" Language="C#" MasterPageFile="~/Ticket.Master" AutoEventWireup="true" CodeBehind="TicketView.aspx.cs" Inherits="TicketSystem.TicketView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
    <link rel="stylesheet" href="assets/vendor/summernote/summernote-bs3.css" />
    <style>
        .modal-block {
            background: transparent;
            padding: 0;
            text-align: left;
            max-width: 96%;
            margin: 40px auto;
            position: relative;
        }

        .modal-wrapper {
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="timeline">
        <div class="tm-body">

            <div class="tm-title" style="min-width: 100%; background-color: transparent">
                <%--<h3 class="h5 text-uppercase">Message:</h3>--%>
                <div class="row">
                    <!-- Main Details -->
                    <div class="col-sm-6" style="background-color: white; padding: 10px;">
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Raised By</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["UserEmail"].ToString() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Subject</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["Subject"].ToString() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Domain</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["Domain"].ToString() %>
                            </div>
                        </div>
                        <%if (Convert.ToBoolean(TicketRow["isApproved"]) == true)%>
                        <%{ %>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Supervisor</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["ApprovedBy"].ToString() %>
                            </div>
                        </div>
                        <%} %>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Creation Time</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["CreationTime"].ToString() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                Priority <b><%= TicketRow["Priority"].ToString() %></b>
                            </div>
                            <div class="col-sm-4">
                                Urgency <b><%= TicketRow["Urgency"].ToString() %></b>
                            </div>
                        </div>
                    </div>
                    <!-- closing Details -->
                    <%if (Convert.ToBoolean(TicketRow["isClosed"]) == true) %>
                    <%{ %>
                    <div class="col-sm-6" style="background-color: white; padding: 10px; height: 152px">
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Closed By</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["ClosedByUser"].ToString() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Closing Reason</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["ClosingReason"].ToString() %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <b>Closed Time</b>
                            </div>
                            <div class="col-sm-7">
                                <%= TicketRow["ClosedTime"].ToString() %>
                            </div>
                        </div>

                    </div>
                    <%} %>
                    <%else %>
                    <%{ %>
                    <div class="col-sm-6" style="padding: 10px; height: 152px">
                        <button class="btn btn-primary btn-lg" style="margin: 0 auto">Close This Ticket</button>
                    </div>
                    <%} %>
                </div>
            </div>
            <ol class="tm-items">
                <li>
                    <div class="tm-info">
                        <div class="tm-icon"><i class="fa fa-quote-left"></i></div>
                        <div class="tm-datetime text-center">
                            <div class="tm-datetime-date">1/1/1996</div>
                            <div class="tm-datetime-time">04:13 PM</div>
                        </div>
                    </div>
                    <div class="tm-box appear-animation fadeInRight appear-animation-visible" data-appear-animation="fadeInRight">

                        <div class="row">
                            <a class="mb-xs mt-xs mr-xs modal-basic btn btn-default pull-right" href="#modalCenter"><i class="fa fa-expand"></i></a>
                            <div id="modalCenter" class="modal-block mfp-hide">
                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="modal-wrapper">
                                            <div class="row col-sm-12">
                                                <button class="btn btn-default modal-dismiss">Close</button>
                                                <iframe class="col-sm-12"
                                                    src="/Api/TicketAPI.asmx/GetTicketInnerViews?objectID=<%= TicketRow["ID"].ToString() %> &objectType=TICKET"
                                                    style="border: 1px solid transparent; width: 100%; height: 500px;"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                            <iframe class="col-sm-12"
                                src="/Api/TicketAPI.asmx/GetTicketInnerViews?objectID=<%= TicketRow["ID"].ToString() %> &objectType=TICKET"
                                style="border: 1px solid transparent; min-height: 250px; max-height: 400px; overflow: hidden;"></iframe>
                        </div>
                        <div class="tm-meta">
                            <span>
                                <%--<i class="fa fa-user"></i>John Doe--%>
                            </span>
                        </div>
                    </div>
                </li>

            </ol>

            <% if (RepliesData.Rows.Count > 0) %>
            <%{ %>

            <div class="tm-title">
                <h3 class="h5 text-uppercase">Replies:</h3>
            </div>
            <%foreach (System.Data.DataRow ReplyRow in RepliesData.Rows) %>
            <%{ %>
            <ol class="tm-items">
                <li>
                    <div class="tm-info">
                        <div class="tm-icon"><i class="fa fa-reply"></i></div>
                        <div class="tm-datetime text-center">
                            <div class="tm-datetime-date"><%= Convert.ToDateTime(ReplyRow["CreationTime"].ToString()).ToShortDateString() %></div>
                            <div class="tm-datetime-time"><%= Convert.ToDateTime(ReplyRow["CreationTime"].ToString()).ToShortTimeString() %></div>
                        </div>
                    </div>
                    <div class="tm-box appear-animation fadeInRight appear-animation-visible" data-appear-animation="fadeInRight">
                        <div class="row">


                            <iframe src="/API/TicketAPI.asmx/GetTicketInnerViews?objectID=<%= ReplyRow["ID"].ToString() %>&objectType=REPLY"
                                class="col-sm-12" style="border: 1px solid transparent"></iframe>
                        </div>
                        <div class="tm-meta">
                            <span>
                                <i class="fa fa-user"></i>By <a href="#"><%= ReplyRow["ReplyByUser"].ToString() %></a>
                            </span>
                        </div>
                    </div>
                </li>
            </ol>
            <%} %>

            <%} %>
            <%if (Convert.ToBoolean(TicketRow["isClosed"]) == false) %>
            <%{ %>
            <div class="tm-title">
                <h3 class="h5 text-uppercase">New Reply:</h3>
            </div>
            <ol class="tm-items">
                <li>
                    <div class="tm-info">
                        <div class="tm-icon"><i class="fa fa-reply"></i></div>
                        <div class="tm-datetime text-center">
                            <div class="tm-datetime-date" id="dateChangerSet"></div>
                            <div class="tm-datetime-time" id="timeChangerSet"></div>
                        </div>
                    </div>
                    <div class="tm-box appear-animation fadeInRight appear-animation-visible" data-appear-animation="fadeInRight">
                        <div class="row">
                            <textarea id="compose-field"></textarea>
                        </div>
                        <div class="tm-meta">
                            <button type="button" onclick="addReplyClick()" class="btn btn-primary btn-block btn-sm">Add </button>
                        </div>
                    </div>
                </li>

            </ol>
            <%} %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="assets/vendor/summernote/summernote.js"></script>
    <script>
        $('#compose-field').summernote({
            disableDragAndDrop: true,
            spellCheck: true,
            tabsize: 4,
            height: 150,

        });
    </script>
    <script>


</script>
    <script>
        function addReplyClick() {
            if (confirm('Are you Sure you want to add reply') == true) {
                var message = document.getElementsByClassName('note-editable')[0].innerHTML;
                $.ajax({
                    url: '/API/TicketAPI.asmx/AddReply',
                    type: 'POST',
                    data: { TicketID: '<%=Request.QueryString["ID"].ToString() %>', Message: message},
                    success: function (r) {
                        if (r == 'Added') { window.location.reload(); }
                    }
                });
            }
        }
    </script>

</asp:Content>
