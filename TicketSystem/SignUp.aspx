﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TicketSystem.SignUp" %>

<!doctype html>
<html class="fixed">
<head>
    <title>Sign Up | Ticket System</title>
    <!-- Basic -->
    <meta charset="UTF-8">

    <meta name="keywords" content="Login Page" />
    <meta name="description" content="Support Ticket System | Exceleron Group">
    <meta name="author" content="excelerongroup.com">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts  -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="assets/vendor/modernizr/modernizr.js"></script>
    <style>
        .body-sign .panel-sign .panel-title-sign .title {
            background-color: #377127 !important;
        }

        .body-sign .panel-sign .panel-body {
            border-top-color: #377127 !important;
        }

        body .btn-primary {
            background-color: #377127 !important;
            border-color: #377127 !important;
        }
        /*#377127*/
    </style>
</head>
<body>
    <!-- start: page -->
    <section class="body-sign">
        <div class="center-sign">
            <a href="/" class="logo pull-left">
                <img src="assets/images/xc.png" height="54" alt="XC Support" />
            </a>

            <div class="panel panel-sign">
                <div class="panel-title-sign mt-xl text-right">
                    <h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i>Sign Up</h2>
                </div>
                <div class="panel-body">
                    <asp:Panel runat="server" ID="formPanel">
                        <form runat="server" id="form1">
                            <div class="form-group mb-sm text-center">
                                <label runat="server" id="messageTxt"></label>
                            </div>
                            <div class="form-group mb-lg">
                                <label for="name">Name</label>
                                <input runat="server" id="nameTxt" name="name" type="text" class="form-control input-lg" />
                            </div>

                            <div class="form-group mb-lg">
                                <label for="email">E-mail Address</label>
                                <input name="email" runat="server" id="emailTxt" type="email" class="form-control input-lg" />
                            </div>

                            <div class="form-group mb-none">
                                <label for="password">Password</label>
                                <input name="pwd" type="password" class="form-control input-lg" runat="server" id="passwordTxt" />
                            </div>

                            <div class="row" style="margin-top: 6px;">
                                <div class="col-sm-8"></div>
                                <div class="col-sm-4 text-right">

                                    <asp:Button CssClass="btn btn-primary hidden-xs" Text="Sign Up" runat="server" ID="SubmitBtn1" OnClick="SubmitBtn_Click" />
                                    <%--<asp:Button CssClass="btn btn-primary btn-block btn-lg visible-xs mt-lg" Text="Sign Up" runat="server" ID="SubmitBtn" OnClick="SubmitBtn_Click" />--%>
                                </div>
                            </div>

                            <span class="mt-lg mb-lg line-thru text-center text-uppercase">
                                <span>or</span>
                            </span>

                            <p class="text-center">Already have an account? <a href="Login">Sign In!</a></p>

                        </form>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="statusPanel">
                        <div class="form-group mb-sm text-center">
                            <label>You Have Successfully Signed Up</label>
                            <label>Please Wait For Admin To Approve Your Support Account</label>
                            <span class="mt-lg mb-lg line-thru text-center text-uppercase">
                                <span>or</span>
                            </span>
                            <p class="text-center">Already have an account? <a href="Login">Sign In!</a></p>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <p class="text-center text-muted mt-md mb-md">&copy; Copyright 2020. All rights reserved by <a target="_blank" href="https://excelerongroup.com">Exceleron Group</a>.</p>
        </div>
    </section>
    <!-- end: page -->

    <!-- Vendor -->
    <script src="assets/vendor/jquery/jquery.js"></script>
    <script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
    <script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

    <!-- Theme Base, Components and Settings -->
    <script src="assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
    <script src="assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="assets/javascripts/theme.init.js"></script>

</body>
</html>