<%@ Page Title="" Language="C#" MasterPageFile="~/Ticket.Master" AutoEventWireup="true" CodeBehind="rptUsers.aspx.cs" Inherits="TicketSystem.rptUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/vendor/select2/select2.css" />
    <link rel="stylesheet" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css" />
    <style>
        .pricing-table {
            margin: 0 !important;
            padding-left: 0 !important;
            text-align: center;
        }

            .pricing-table h3 {
                margin: 0 !important;
                padding: 9px !important;
            }

            .pricing-table ul {
                margin-top: 3px !important;
            }

            .pricing-table li {
                padding: 2px !important;
                display: flex;
                text-align: center;
            }

            .pricing-table .plan {
                margin-top: 2px !important;
                margin-bottom: 0px !important;
                margin-right: 0 !important;
                padding: 0 !important;
            }

        .subject-image {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABmJLR0QA/wD/AP+gvaeTAAAFCklEQVR4nO2ZW2xURRjHf9+cXUpvS3cFegsqULBAQwggQmIVFMFqSKgEYoJCIj75QIwxvvBgffJFgwmiD4CJRB8UQxsBaVBLVRRCuETkKrQIpYVSeslugZbdc8aH7bYNnC2w3dNtw/k9zcz5zsx//vtNZucMuLi4uLi4uLi4PJrI/QLKylb7wtK9HmE5UAxkOi9rUNwEzoBUea1Rm/bu/TY4UPCABix5ZcUzlkglkJ9MhUNIkyVSXrN7x+F4AXENWLJsRbFlySFgjCPSho4O05T5+6t3nLN76In3lmWpL0CPAchOt1j3UifziroJZFtOCU0KbSHF4fNpbP05i84uBZBjGHozsNgu3jYDXixbOV2UPgVgKNi4rpWpBRHHRDvBhase3t0WIGJGp2iaUmyXBcruZVE8GyvPLeoecZMHKMqPMHvSnd66R+lSuzh7A9D+WHlK/sibfIypheHesqUI2MXYGmBpoxJ0XUEgwqKZtx2S5zwLS7opCEQAXafQlXYxA26DkcOl2hFlQ4xn3h9x52mbAY8Sj7wBhl1jRUWF8maMeyPfb5ZPzDWR+/5hHp5oLdScSKfZnF2/ZvWqk7W1tfcsaVsDPFlj3wS2/3U2jQK/yaS8kbkT/PpPOp9U+UAob2hsqas/f/rE3THxlsCkWOFqx8hdJdfa+7RrpSfbxSQ0O1X4FsasKlTh2zzAgdI5xEA98R7GrCpkfHlCXSRkgOS9Dt4AUrAG9eT7ICnIEvGiJn+EjF8O3gAqd2VC3SSkXN+o7tMxbhmq6GPw+BISkBDesajijYj/ud4mq7V6gBfik5AB1qXP0C0/9tYlZwHG9C1I9syERDwMkrMAY8ZWJKtvLN20Hd20PaH+4h6HB8bC+u9TVLgNKVgLCKTlo4o3oW/8hHVlC4TbEus6Hml5qAnvIP6FfW3axGr4Et38fcLdJmgAgMZq/Aq5eQY1cUPPEhBk7KsYgcXolt1YzT9Ad2PiQwCSPhHJW4U8thSkn9xwO1Z9BTp4fFD9D8KAKLrjIObJtajH1yOBRdFGlYbkrsDIfQ3deQrdVguho+hb9cB9jheikIyp4JuDBF5AMqbcPSK6dR/W5c0Q6Ris/MEbAEC4FavuQ6RlF1K4Dsma0fNAkKwSJKskWjVvorsuQ1cDmJ1g9pw0jYxoBo2egIyeACrddhjdeQJ9ZRs6NLhfvT/JMaAHHTyCDh5BfHOR8eVIznwQb1+AkYlkToPMaQ/RaRjdcRB9fSc6eCyZcoEkGxAjZgQeH+IvRbLnIL7Z4LX9JnEv4VZ08Dg6eBTd8TtEQk7IBBwyoJdIEN2yB92yJ1r3+qMpnlYYTXOjJ9XNW2B1QXcjuqsBwu2OyuqPswbcTbgdHW6H0D1nkpQxck86ScI1INUCUo1rQKoFpBrXgFQLSDWuAakWkGpcA1ItINXYG2DRexMSiYzQa6EHxN4ApZtjxYvXh/a8lEyutfW7+NLYfj6yN0B7DsSKRy6kca7Raxs2nLnU4uHA2dG9dQ1H7eJsDfhlz3dntFADYFqw4Zscqo+l0xqyvUocVrSGDKqPpfPB13667kSXr0b+Ln265E+7+LgLfNHLK58yDH0IyHFG6pDRaSnr+ZpdO22/p8XdBfZX7zhniSwFmhyT5jxNKCmLN3mIcz0e4+K/pxvzpxVt8WCERIsPYQwwKukyk0sncFzg89vGnbW/7aq8kGpBLi4uLi4uLi4uw5H/Ad3EhCdZaFysAAAAAElFTkSuQmCC');
            background-repeat: no-repeat;
            width: 20px;
            height: 20px;
            background-size: cover;
        }

        .priority-image {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAD40lEQVRoge2az2scVQDHPy8Tm0Js7SEK/kDFFitBqUSMNCYkRAILQuqiAzH0EMRzjv4NgreKeB1EVrEURfSiqBc9FBEsgggeapVkTTCxIbSZTXbe18PuTjeZTXZ+vE1A+mDhsTu89/ns+74fs7NwtxxtMb1q+PaFuXJkeRchweLJLz7+tBf99ERgc3beR7aC6EcCFFlYuO/LTz503Vef6wY7wCPJM1bBRunVi677cyqwDzwIkDxEsDHjVsKZQBf4Zl0e2GBj5hVnEk4EUsI3XuBJBBsvuZEoLJARPh4JyQbrU7OFJQoJ5IRvfoZnULA+9XIhidwCBeFbdQ9LsD6RXyKXgCP4xvvggYL1iVIuicwCjuHjkVBEsD6WXSLTTtwjeGTj6yJJC0NXv069Y6cWyALf9+gjDL73DmZgoMEZhmy+sYhdrh4E32ojQloY+vGbVBKpIpT1mzcnT8TwAOb4ccyJwTTwSPIkBf+MTKWKU1eBPLFRGCba0VaYBj6eExaClXPdJQ4UyJt5hbWkQFhLC9+oW3kGG6ycmzhQYl+BQhO2o0CYBT6OE1bBytNj+0p0FCi62sRxaS9bYVb4O0usCFaGO0skBJwslbU9IyBhmyOQEb5V9yQbLJ99ISGxS8DVOm/3jIC2dyCyeeHjOBkULJ95fpdELHD7wlwZ2Y+cbFLWwk79Ti+t/OeHb9StPFCwfHqknBBo3oB7heGbkVFbjBTWXMDHcULmUjJCQq7gOwk4gm++b5UQECyCImdnm7BdIHQIr8hIiwmBxu829nVEvTC8tGsp1d4VqAg8duGhP37+rNV24jC3WXrNt1IFqT8vPBL3TI7RP/wUIHZ+usb2D1fdwF+/tuuQ1/E0enOm7BuoAP154B1O2APh9xVoSdA2Elnhzf1DDMxMgjHUvvqOaOlv5/AHCgDcnJ71gYpae0NK+L6HH+TUB+9j7h1sXHrrFv/OvUn9zyWn8NDlNHrq288vA/NI9bTwkjg2+WIMD2AGBzk2Ne4cvqtAS8LIzkuqp4FHIvprKdFOtFR1Dg/gdbsA4O0bv//61uNP/makMlJftwlbv34DA3hPPIZq22xVrrBVueIcHjLe1K+Nl3wsbRP78FYbJwIAa+dLPrIV7ZE4CvhcAgBrozO+UCxxVPC5BQBWR6d904zTUcEXEgBYfW66cQNk94lTj+ELCwCsPjvpow5xOgR4JwIAq8+M+6ItTocED46e0Dzwy/eXDTQ2u0OEB8ePWavD533THqcew0MPnhNXz476QAWbiJNzeOjRg+7qmVFf2PYduyfw0MO/GiyfHikjc0myMtJi+23g3fJ/Kv8BCZH2A1j568UAAAAASUVORK5CYII=');
            background-repeat: no-repeat;
            width: 20px;
            height: 20px;
            background-size: cover;
        }

        .urgency-image {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAACqklEQVQ4jXWSS0sbYRSG3/lmkslMEmtM4iUYG9JiBbWlukkXbS1IraUFKbgQXIhWROhGpLuCdtHfIDFduYgL6coqiuuqUGqiq1rRItqk5iLEJJNvLs7XTW2Nl3f9vA/nHA6HK7LZ399WUVn5VLTZasAYU1U1pRwfLzVHo/GLLAcAG729D9rm5tZ2hobuO6uqJh0eTzcnCBZVURQwBpvDIZu6rp+k04uFXG6yMRKJlwl+jY19NAyjtqq+/jFjTOdCoU25vb0asr0BAIeSckjj8fTp6mqLqWnF44OD0WA4PP9PkBgf/1Tp8706NQxDHh3dJU7nnatWY6q6dxKJALmcmNrff9EYicQJANhaWro5QkAEQcitrFxZBgBOFIMVw8PgrVZ7hcs1AQB8IhrtcXZ09BteL1ggAN7lgsXrBUcIAICqKgRB+C8RBJcBfLNkMh0Dbvc8/6aurkdOJDqlrq5t8eZNj7WuDhwhKBQVvH33AV/WvqLzycPySdxu1YzFqjVN+0lESarVFCUPSfafhwSBR1fnoytXIZLs1ygt8qLoI6ZpAhxHGGPsPGQTRfhqa647B4NpcgQwia5pSask2TlaOriOvpSScmiVZVnTtCRRstllZhh6aWMjdZG7FQzg9UDfpb4Si6VODUOnmcwyaY5G4yfp9CJbX281Kd05DzoddtwOBsrKJqV7WFtrKWQyn5tmZ7cIABRyuUlDVZV8OMwzSn9cN7lJ6W5+epozKC3ks9n3wN9PBIC9kZGXVX7/FG+x2BEKbcnt7R5IcgNjjHAlZV+JxbJYX281KC3kksmRwNTUQpkAALYHB+/d8Hgm7W73c95isarFogIAot0uG7quFzKZhZOjo4mmmZmts06Z4Czf+/ruSm73M4so1gKArqq/S9nsUtPs7NZF9g+llinOrS68YAAAAABJRU5ErkJggg==');
            background-repeat: no-repeat;
            width: 20px;
            height: 20px;
            background-size: cover;
        }

        .clock-image {
            background-image: url('data:image/png;base64,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');
            background-repeat: no-repeat;
            width: 20px;
            height: 20px;
            background-size: cover;
        }

        .domain-image {
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAE7klEQVRoge1ZXWgcVRT+zp1NjNCwGrENmvSl2lZRah5sG43g7CwJFIyipSUUXyqsL8ampqAWH4pFwZemhfqQQPsi0lrsg/WhbJi5Q+NqCmqD4F8Ei5AQgpr4k1A3zdw5PnQ37k5mZnd2Nxhxv7d77jnnfmfuveeeeweoo446/tOgWjmSUu5wXdcgot0AtgFoB7Ah170IYArAJBGNA5CJROKrWoxbVQCZTKY5m82miOgFAA9ENP+Omc80NTWNdHV1LVTKoaIAbNuOMXM/M78BoKXSwXOYB3BcCHFa13UnqnHkAGzb3q6UOkdEj0S1LYEJIupLJBKTUYxEFGUpZa/rup8HkFcArjDzIBHtdhxnUzweb4zH442O42wSQnQy8xEAYzldLzqY+QspZW8UTmXPgGVZzwM4CyDm6bpBRCeJaEjX9V/L8TU2Nnb38vLyKwAOAbjd0+0AOGgYxnvl+CorACllLzNfxGry55VSg93d3TPl+PHCsqx7AZwAsM/T5QB41jCMj0v5KBnA6Ojo/ZqmfQmguUDMAN40DONY+XSDYZrmISI6geIlvSiEeFTX9e/DbEMDsG07ppTyrnlFRPsTicTFKjivgmmae4noAxQHMSGE2BmWnUI3MTP3ezcsEb1ea/IAkEwmPwRw1CPucF33pTC7wBnIZDLNS0tLP6E4z583DKMv35BS7mHmYQBt0SlXjWkAqcAZyGazKRSTv6GUGizU+RfJA0AbEQ0HBpArDwoxVGm2WUv4BiCl3IHi2kYJIU76qKaIaGpNmJUAEU25rpvy5nUAgOu6SSIqVP7E75AyDOMygM1rQdCyrDEATxSIDhuGseoj+s4AEe3yiC7VkFtZYOaPPKJOP72gPbDd0/6sakYRkbs3rICZt/rp+S4hAPcUKcVi1/2U+MptewBUk4mmwUjRk0uXV/lm/tGzjH3HCJqBwrIBs7OzfwToVZtG20AY9uu4efPm72Gc8ohUTq9HBAVQdMVrbW2N+2oxUrh1160UU3CR8utobGy8I4xTHkF7YAbAXfmGUmoLgF+8Srm1uyZpVAhxHzOvtJl52lcvwL6ohFVKPVY7auWBmYvSJhH94KfnGwAzX/UYP107amXjGU973E+J1kNFmTvRV5BOpzfGYrEZAFpeJoR4WNf1r70OxHqoKL1CTdOOoIA8gG/9yAPrMI2m0+l2IuovlDHzmSB9gXVQUebbzEyapg0BaCpQm9M0bSTQR9gAlmUNABjyiF8zDOOdSgiXgmmaR4norUIZMw8kk8lTQTahS0gIcRrAhEf8tmmaeyun6Q8p5T4iOu4RX9M07d0wu9AAdF13lFL7AfxZaENEFyzLOsbMVb9uMzNZlvUqM5/D6meVA6XeS6t92LoghBjUdd33lCyFdDrdrmnaEBE95+mq3cNWHiFPi38BOOU4zlBPT8/P5fhKp9MbGxoaBpn5ZRRvWGAtnhbzsCzrKQDvw7+0Vbh18bnEzJ8CuD4/P/8bALS0tNxJRFuI6HEAvbkyQfPxsQDgQDlfvqIAAEBKuS23Xjui2pbANWbuSyaTvjVPECIfZIlEYlIIsRPAYQBzUe19MMfMA0KIXVHJA1X+YrJte4NS6kUiOgjgwYjm3zDzWU3TRnRdX6yUQ81+8tm2/ZDrukkAncy8lYg245+ffAvMPJUriceFEGZQbVNHHXX8z/A33lbLxhz/x9YAAAAASUVORK5CYII=');
            background-repeat: no-repeat;
            width: 20px;
            height: 20px;
            background-size: cover;
        }


        #closed-tickets-table_wrapper input[type=search] {
            border: 0.7px solid lightgrey;
            border-radius: 5px;
        }

        table tfoot input[type=search] {
            border: 0.7px solid lightgrey;
            border-radius: 5px;
        }

        div.dataTables_length select {
            width: 75px;
            padding: 0;
            height: 26px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Closed Tickets -->
    <div class="row">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                    </div>
                    <h2 class="panel-title">User Tickets</h2>
                </header>
                <div class="panel-body" style="display: block; padding-left: 20px !important; padding-right: 20px !important; max-height: 800px; overflow-y: auto">

                    <table class="table table-bordered table-striped mb-none" id="user-tickets-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Counts</th>
                                <th>Last Ticket</th>
                                <th>Operations</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%foreach (System.Data.DataRow cDR in UserCountsDT.Rows) %>
                            <%{ %>
                            <tr>
                                <td><%= cDR["Name"].ToString() %></td>
                                <td><%= cDR["Email"].ToString() %></td>
                                <td><%= cDR["Phone"].ToString() %></td>
                                <td><%= cDR["Counts"].ToString() %></td>
                                <td><%= cDR["LastTicket"].ToString() %></td>
                                <td>
                                    <button type="button" onclick="FetchUserDetails('<%= cDR["Email"].ToString() %>')" class="btn btn-info btn-md">Details</button>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Counts</th>
                                <th>Last Ticket</th>
                                <th>Operations</th>
                            </tr>
                        </tfoot>
                    </table>

                </div>
            </section>
        </div>
    </div>
    <!-- Closed Tickets -->
    <div class="row" id="DSetParent" style="display:none">
        <div class="col-md-12">
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                    </div>
                    <h2 class="panel-title">Closed Tickets</h2>
                </header>
                <div id="DSet"  class="panel-body" style="display: block; padding-left: 20px !important; padding-right: 20px !important; max-height: 800px; overflow-y: auto">
                </div>
            </section>
        </div>
    </div>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <!-- Specific Page Vendor -->
    <script src="assets/vendor/select2/select2.js"></script>
    <script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.min.js"></script>
    <%--<script src="assets/vendor/jquery-datatables/media/js/jquery.dataTables.js"></script>--%>
    <script src="assets/vendor/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
    <script src="assets/vendor/jquery-datatables-bs3/assets/js/datatables.js"></script>
    <script>
        $(document).ready(function () {
            $('#reportBtn').siblings().removeClass('nav-active');
            $('#reportBtn').addClass("nav-active");
            $('#rptUserBtn').siblings().removeClass('nav-active');
            $('#rptUserBtn').addClass("nav-active");
            //
            $('#user-tickets-table tfoot th').each(function () {
                var title = $(this).text();
                if (title != '') {
                    $(this).html('<input type="search" placeholder="\uf0b0 ' + title + '" />');
                }
            });
            //Initaiting DataTable
            var table = $('#user-tickets-table').DataTable({ scrollX: true });
            //Setting Search Options in DataTable Footer TextBoxes    
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change clear', function () {
                    if (that.search() !== this.value) {
                        that.search(this.value).draw();
                    }
                });
            });
            ////////////////
            /// Details Section
            ///////////////
            //#user-ticket-details-table

        });

        function FetchUserDetails(Email) {
    
            $.ajax({
                url: 'API/TicketAPI.asmx/GetUserDetails',
                type: 'POST',
                data: { Email: Email },
                success: function (response) {
                    response = JSON.parse(response);
                    document.getElementById('DSet').innerHTML = `
                    <table class="table table-bordered table-striped mb-none" id="userdetail-ticket-table">
                        <thead>
                            <tr>
                                <th>Operations</th>
                                <th id='belowTableIDCol'>ID</th>
                                <th>Subject</th>
                                <th>Domain</th>
                                <th>Priority & Urgency</th>
                                <th>CreationTime</th>
                                <th>ClosingTime</th>
                                <th>ClosedBy</th>
                            </tr>
                        </thead>
                        <tbody id="userDetailsTBody">
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Operations</th>
                                <th>ID</th>
                                <th>Subject</th>
                                <th>Domain</th>
                                <th>Priority & Urgency</th>
                                <th>CreationTime</th>
                                <th>ClosingTime</th>
                                <th>ClosedBy</th>
                            </tr>
                        </tfoot>
                    </table>
`;

                    $('#userDetailsTBody').html('');
                    var t = '';
                    for (var i = 0; i <= response.length - 1; i++) {
                        t+=`
                        <tr>
                            <td><a class="btn btn-info btn-md" target="_blank" href="/TicketView?ID=` + response[i].ID + `">Show</a>  </td>');
                            <td>` + response[i].ID + `</td>
                            <td>` + response[i].Subject + `</td>
                            <td>` + response[i].Domain +`</td>
                            <td>P:&nbsp;<b>` + response[i].Priority + `</b> &nbsp;&nbsp; -&nbsp;&nbsp; U:& nbsp; <b>` + response[i].Urgency + `</b></td>
                            <td>` + response[i].CreationTime + `</td>
                            <td>` + response[i].ClosedTime + `</td>
                            <td>` + response[i].ClosedByUser + `</td>
                        </tr>`;
                    }
                    $('#userDetailsTBody').html(t);
                    //$('#userdetail-ticket-table tfoot th').each(function () {
                    //    var title = $(this).text();
                    //    if (title != '') {
                    //        $(this).html('<input type="search" placeholder="\uf0b0 ' + title + '" />');
                    //    }
                    //});
                    //Initaiting DataTable
                    //$('#userdetail-ticket-table').DataTable().clear();
                    //$('#userdetail-ticket-table').DataTable().destroy();

                    var table2 = $('#userdetail-ticket-table').DataTable({ scrollX: true });
                    //Setting Search Options in DataTable Footer TextBoxes    
                    //table2.columns().every(function () {
                    //    var that = this;
                    //    $('input', this.footer()).on('keyup change clear', function () {
                    //        if (that.search() !== this.value) {
                    //            that.search(this.value).draw();
                    //        }
                    //    });
                    //});
                    document.getElementById('DSet').scrollIntoView();
                    $('#DSetParent').show();
                    $('#belowTableIDCol').click();
                },


            });
        }
    </script>
</asp:Content>
