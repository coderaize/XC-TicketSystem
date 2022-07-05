<%@ Page Title="" Language="C#" MasterPageFile="~/Ticket.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TicketSystem.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="row">
        <!-- open tickets -->
        <div class="col-md-12 col-lg-6 col-xl-6">
            <section class="panel panel-featured-left panel-featured-primary">
                <div class="panel-body">
                    <div class="widget-summary">
                        <div class="widget-summary-col widget-summary-col-icon">
                            <div class="summary-icon bg-primary">
                                <i class="fa fa-life-ring"></i>
                            </div>
                        </div>
                        <div class="widget-summary-col">
                            <div class="summary">
                                <h4 class="title">Opened tickets</h4>
                                <div class="info">
                                    <strong class="amount"><%= TicketDashDT.Rows[0][1].ToString() %></strong>
                                    <span class="text-primary"></span>
                                </div>
                            </div>
                            <div class="summary-footer">
                                <a class="text-muted text-uppercase"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>


        <!--closed-->
        <div class="col-md-12 col-lg-6 col-xl-6">
            <section class="panel panel-featured-left panel-featured-secondary">
                <div class="panel-body">
                    <div class="widget-summary">
                        <div class="widget-summary-col widget-summary-col-icon">
                            <div class="summary-icon bg-secondary">
                                <i class="fa fa-life-ring"></i>
                            </div>
                        </div>
                        <div class="widget-summary-col">
                            <div class="summary">
                                <h4 class="title">Closed Tickets</h4>
                                <div class="info">
                                    <strong class="amount"><%= TicketDashDT.Rows[1][1].ToString() %></strong>
                                    <span class="text-primary"></span>
                                </div>
                            </div>
                            <div class="summary-footer">
                                <a class="text-muted text-uppercase"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!--ywae-->
        <div class="col-md-12 col-lg-4 col-xl-4">
            <section class="panel panel-featured-left panel-featured-tertiary">
                <div class="panel-body">
                    <div class="widget-summary">
                        <div class="widget-summary-col widget-summary-col-icon">
                            <div class="summary-icon bg-tertiary">
                                <i class="fa fa-life-ring"></i>
                            </div>
                        </div>
                        <div class="widget-summary-col">
                            <div class="summary">
                                <h4 class="title">Year</h4>
                                <div class="info">
                                    <strong class="amount"><%= TicketDashDT.Rows[2][1].ToString() %></strong>
                                </div>
                            </div>
                            <div class="summary-footer">
                                <a class="text-muted text-uppercase"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--month-->
        <div class="col-md-12 col-lg-4 col-xl-4">
            <section class="panel panel-featured-left panel-featured-quartenary">
                <div class="panel-body">
                    <div class="widget-summary">
                        <div class="widget-summary-col widget-summary-col-icon">
                            <div class="summary-icon bg-quartenary">
                                <i class="fa fa-life-ring"></i>
                            </div>
                        </div>
                        <div class="widget-summary-col">
                            <div class="summary">
                                <h4 class="title">Month</h4>
                                <div class="info">
                                    <strong class="amount"><%= TicketDashDT.Rows[3][1].ToString() %></strong>
                                </div>
                            </div>
                            <div class="summary-footer">
                                <a class="text-muted text-uppercase"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--week-->
        <div class="col-md-12 col-lg-4 col-xl-4">
            <section class="panel panel-featured-left panel-featured-quartenary">
                <div class="panel-body">
                    <div class="widget-summary">
                        <div class="widget-summary-col widget-summary-col-icon">
                            <div class="summary-icon bg-info">
                                <i class="fa fa-life-ring"></i>
                            </div>
                        </div>
                        <div class="widget-summary-col">
                            <div class="summary">
                                <h4 class="title">Week</h4>
                                <div class="info">
                                    <strong class="amount"><%= TicketDashDT.Rows[4][1].ToString() %></strong>
                                </div>
                            </div>
                            <div class="summary-footer">
                                <a class="text-muted text-uppercase"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        $(document).ready(function () {
            $('#dashboardBtn').siblings().removeClass('nav-active');
            $('#dashboardBtn').addClass("nav-active");
        });
    </script>
</asp:Content>

