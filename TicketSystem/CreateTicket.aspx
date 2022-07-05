<%@ Page Title="" Language="C#" MasterPageFile="~/Ticket.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="TicketSystem.CreateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create Ticket</title>
    <!-- Specific Page Vendor CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
    <link rel="stylesheet" href="assets/vendor/summernote/summernote.css" />
    <link rel="stylesheet" href="assets/vendor/summernote/summernote-bs3.css" />
    <style>
        .remove-file-input {
            height: 30px;
            margin-top: 4px;
        }

        #attachment_files {
            margin-left: 0 !important;
        }

            #attachment_files .col-sm-4 {
                display: flex;
                padding-left: 5px;
                padding-right: 5px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="mailbox-compose">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="ccTxt">CC:</label>
                            <div class="col-md-9">
                                <input id="ccTxt" type="text" class="form-control" data-role="tagsinput" data-tag-class="label label-primary" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="subjectTxt">Subject:</label>
                            <div class="col-md-9">
                                <input id="subjectTxt" type="text" class="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="domainTxt">Domain:</label>
                            <div class="col-md-9">
                                <input id="domainTxt" type="text" class="form-control" placeholder="(Optional)" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="sso_supervisor">SSO Supervisor:</label>
                            <div class="col-md-8">
                                <select id="sso_supervisor" class="form-control input-sm mb-md">
                                    <option>Please Select</option>
                                    <%foreach (System.Data.DataRow dR in AdminUsers.Rows) %>
                                    <%{ %>
                                        <option><%= dR["Email"].ToString() %></option>
                                    <%} %>
                                    
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- priorityRadio -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Priority</label>

                            <div class="col-sm-8" style="display: flex">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="priority1" name="priorityRadio" value="1" />
                                            <label for="priority1">1</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="priority2" name="priorityRadio" value="2" />
                                            <label for="priority2">2</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="priority3" name="priorityRadio" value="3" />
                                            <label for="priority3">3</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="priority4" name="priorityRadio" value="4" checked />
                                            <label for="priority4">4</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- urgencyRadio -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Urgency:</label>

                            <div class="col-sm-8" style="display: flex">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="urgency1" name="urgencyRadio" value="1" />
                                            <label for="urgency1">1</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="urgency2" name="urgencyRadio" value="2" />
                                            <label for="urgency2">2</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="urgency3" name="urgencyRadio" value="3" />
                                            <label for="urgency3">3</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="radio-custom">
                                            <input type="radio" id="urgency4" name="urgencyRadio" checked value="4" />
                                            <label for="urgency4">4</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-sm">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-md-1 control-label" for="sso_supervisor">Message:</label>
                            <div class="col-md-11">
                                <div id="compose-field" class="compose-control"></div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row mt-sm hidden">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-md-1 control-label" for="sso_supervisor">Attachments:</label>
                            <div class="col-md-11">
                                <div class="row" id="attachment_files">
                                   <%-- <div class="col-sm-4" style="display: flex">
                                        <input type="file" class="form-control attachment-files" style="margin-top: 2px;" />
                                        <button class="btn btn-sm btn-danger btn-rounded remove-file-input" type="button" onclick=""><i class="fa fa-trash-o"></i></button>
                                    </div>--%>
                                </div>
                                <div class="row col-sm-12">
                                    <button class="btn btn-sm btn-info"
                                        style="margin-top: 2px" id="attachmentMoreBtn">
                                        Add More</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-sm-12" style="margin-top: 30px;">
                    <button type="button" id="submitClickBtn"  class="btn btn-primary btn-block" style="margin-left: 30px;" onclick="SubmitTicket()">Save </button>
                </div>
                <div class="row col-sm-12">
                    <div class="progress progress-striped progress-xl m-md light" id="ticketProgressBar" style="display: none;">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                            <span class="sr-only">0%</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <!-- Specific Page Vendor -->

    <script src="assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="assets/vendor/summernote/summernote.js"></script>
    <!-- Specific Page Vendor -->
    <script>
        $(document).ready(function () {
            $('#creteTicketBtn').siblings().removeClass('nav-active');
            $('#creteTicketBtn').addClass("nav-active");
            $('#compose-field').summernote({
                disableDragAndDrop: true,
                spellCheck: true,
                tabsize: 4,
                height: 200
            });
            $('#summernote').summernote('insertText', 'Message');
            $('.bootstrap-tagsinput input[type=text]').css('width', '15em !important');
            ////////
            $('.remove-file-input').click(function () {
                $(this).parent().remove();
            });

            $('#attachmentMoreBtn').click(function () {
                $('#attachment_files').append(` 
                                    <div class="col-sm-4" style="display: flex">
                                        <input type="file" class="form-control attachment-files" style="margin-top: 2px;" />
                                        <button class="btn btn-sm btn-danger btn-rounded remove-file-input" type="button" onclick=""><i class="fa fa-trash-o"></i></button>
                                    </div>`);
                ///////////////
                $('.remove-file-input').unbind('click');
                $('.remove-file-input').click(function () {
                    $(this).parent().remove();
                });
                /////////////
                $(".attachment-files").unbind('change');
                $(".attachment-files").on("change", function (e) {
                    if (this.files[0].size > (3 * 1024 * 1024)) {
                        alert("File is Bigger then 3 MB");
                        this.value = "";
                    };
                });
            });

            ///////////////////
            $(".attachment-files").on("change", function (e) {
                if (this.files[0].size > (3 * 1024 * 1024)) {
                    alert("File is Bigger then 3 MB");
                    this.value = "";
                };
            });
        });
    </script>
    <script>

        function SubmitTicket() {
          
            if (confirm('Do you Want To Save and Create a new Ticket') == true) {
                $('#ticketProgressBar').css('display', 'block');
                var subject = $('#subjectTxt').val();
                var cc = $('#ccTxt').val();
                var domain = $('#domainTxt').val();
                var sso_supervisor = $('#sso_supervisor option:selected').html();
                var priority = $("input[name='priorityRadio']:checked").val();
                var urgency = $("input[name='urgencyRadio']:checked").val();
                var message = document.getElementsByClassName('note-editable')[0].innerHTML;
                $('#submitClickBtn').attr('disabled', 'disabled');
                var attachments = [];
                var allAttachmentParents = document.getElementById('attachment_files').children;
                if (allAttachmentParents.length > 0) {
                    for (var i = 0; i <= allAttachmentParents.length - 1; i++) {
                        if (typeof (document.getElementsByClassName('attachment-files')[i].files[0]) != "undefined") {
                            var cfReader = new FileReader();
                            cfReader.readAsDataURL(document.getElementsByClassName('attachment-files')[i].files[0]);
                            cfReader.fileName = document.getElementsByClassName('attachment-files')[i].files[0].name;
                            if (i == allAttachmentParents.length - 1) {
                                cfReader.lastOperation = true;
                            } else {
                                cfReader.lastOperation = false;
                            }

                            cfReader.onload = function (x) {
                                attachments.push({
                                    Name: x.target.fileName,
                                    FileData: x.target.result
                                });
                                if (x.target.lastOperation) {
                                    UploadData(subject, cc, domain, sso_supervisor, priority, urgency, message, JSON.stringify(attachments));
                                }
                                //if (attachments.length == allAttachmentParents.length) {
                                //    UploadData(subject, cc, domain, sso_supervisor, priority, urgency, message, JSON.stringify(attachments));
                                //}
                            }
                        }
                    }
                }

                else {
                    UploadData(subject, cc, domain, sso_supervisor, priority, urgency, message, JSON.stringify(attachments));

                }

            }

        }

        function UploadData(subject, cc, domain, sso_supervisor, priority, urgency, message, attachments) {
            $.ajax({
                url: '/API/TicketAPI.asmx/CreateTicket',
                type: 'POST',
                data:
                {
                    Subject: subject ?? '',
                    CC: cc ?? '',
                    Domain: domain ?? '',
                    SSO_Supervisor: sso_supervisor ?? '',
                    Priority: priority ?? '',
                    Urgency: urgency ?? '',
                    Message: message ?? '',
                    Attachments: attachments ?? ''
                },
                success: function (r) {
                    alert(r);
                    window.location.replace('/MyTickets');
                },
                error: function (r) {
                    alert(r.responseText);
                },
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    xhr.onprogress = function e() {
                        // For downloads
                        //if (e.lengthComputable) {
                            console.log(e.loaded / e.total);
                            $($('#ticketProgressBar').children()[0]).attr('aria-valuenow', e.loaded / e.total);
                            $($('#ticketProgressBar').children()[0]).css('width', (e.loaded / e.total) + '%');
                            $($($('#ticketProgressBar').children()[0]).children()[0]).html((e.loaded / e.total) + '%');
                        //}
                    };
                    xhr.upload.onprogress = function (e) {
                        // For uploads
                        //if (e.lengthComputable) {
                            console.log(e.loaded / e.total);
                            $($('#ticketProgressBar').children()[0]).attr('aria-valuenow', e.loaded / e.total);
                            $($('#ticketProgressBar').children()[0]).css('width', (e.loaded / e.total) + '%');
                            $($($('#ticketProgressBar').children()[0]).children()[0]).html(e.loaded / e.total + '%');
                        //}
                    };
                    return xhr;
                }
            });
        }
    </script>
</asp:Content>
