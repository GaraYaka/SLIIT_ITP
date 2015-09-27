<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PunchCard.aspx.cs" Inherits="SLIIT.ITP.UI.HR.PunchCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>


    <head>
        <title>Punch Card</title>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#txtCardNo').keyup(function () {
                    var cardNoTxt = $("#txtCardNo").val();
                    if (cardNoTxt.length >= 5) {
                        document.getElementById("txtCardNo").disabled = true;
                        CardPunched(cardNoTxt);
                    }
                });
                    
                display_ct();

            });

            function CardPunched(cardNoTxt) {

                var sendData = JSON.stringify({ cardNo: cardNoTxt });


                popLoadingHTMLContent = '<div id="grdItemsModal" style=""><div id="grdItemsModal" style="">&emsp;<img src="../../Images/LoadingGif.gif" style="height:120px; width:120px;" />Punching you in :)</div>';
                var postingMsg = bootbox.dialog({
                    message: popLoadingHTMLContent,
                    title: "<h3 class='page-title'>Attence Log<small> powered by eClash</small></h3>",
                    closeButton: false
                });


                $.ajax({
                    url: "../../Services/HRServices.asmx/PunchCard",
                    dataType: "json",
                    data: sendData,
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    success: function (result) {


                        //close posting modal
                        bootbox.hideAll();


                        popHTMLContent = '<div id="grdItemsModal" style="">Sucessfully Logged</div>';
                        bootbox.dialog({
                            message: popHTMLContent,
                            title: "<h3 class='page-title'>Attence Log<small></small></h3>",
                            closeButton: false,
                        });

                        setInterval(function () { bootbox.hideAll(); }, 3000);

                        document.getElementById("txtCardNo").disabled = false;
                        document.getElementById("txtCardNo").value = "";
                        document.getElementById("txtCardNo").focus;

                    }, error: function (request, status, error) {
                        //close posting modal
                        bootbox.hideAll();

                        popHTMLContent = '<div id="grdItemsModal" style="">Card Not Found</div>';
                        bootbox.dialog({
                            message: popHTMLContent,
                            title: "<h3 class='page-title'>Attence Log<small></small></h3>",
                            closeButton: false,
                        });

                        setInterval(function () { bootbox.hideAll(); }, 3000);

                        document.getElementById("txtCardNo").disabled = false;
                        document.getElementById("txtCardNo").value = "";
                        document.getElementById("txtCardNo").focus;
                    }
                });

            }

            function display_c() {
                var refresh = 1000; // Refresh rate in milli seconds
                mytime = setTimeout('display_ct()', refresh)
            }

            function display_ct() {
                var strcount
                var x = new Date()
                document.getElementById('ct').innerHTML = x;
                tt = display_c();
            }

        </script>

    </head>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


    <div class="form-group">
        <label class="col-md-2 control-label">
            <span class="label label-sm label-danger">Swipe Your Card</span>
        </label>
        <div class="col-md-10">
            <input type="text" id="txtCardNo" class="form-control" name="" placeholder="Card No" autofocus="autofocus" autocomplete="off">
        </div>
    </div>

    <div class="portlet">
        <div class="portlet-title">
            <div class="caption">
                <asp:Label ID="portletVoucherNo" runat="server" Text="">eClash Attendence System </asp:Label>
            </div>
        </div>
        <div class="tabbable">
            <ul class="nav nav-tabs nav-tabs-lg">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab" aria-expanded="true">Time</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- BEGIN Portlet PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        GMT/UTC (UTC+05:30)
                                    </div>

                                </div>
                                <div class="portlet-body">
                                    <h1 id='ct'  ></h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
