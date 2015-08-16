<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PunchCard.aspx.cs" Inherits="SLIIT.ITP.UI.HR.PunchCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <head>
        <title>Punch Card</title>

        <script type="text/javascript">
            $(document).ready(function(){
                $('#txtCardNo').keyup(function () {
                    var cardNoTxt = $("#txtCardNo").val();
                    if (cardNoTxt.length >= 3) {
                        document.getElementById("txtCardNo").disabled = true;
                        CardPunched(cardNoTxt);
                    }
                });
            });

            function CardPunched(cardNoTxt)
            {
                

                var sendData = JSON.stringify({ cardNo: cardNoTxt });

                $.ajax({
                    url: "../../Services/HRServices.asmx/PunchCard",
                    dataType: "json",
                    data: sendData,
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    success: function (result) {
                        alert("sucess");
                    }, error: function (request, status, error) {
                        alert("fail");
                    }
                });

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
            <input type="text" id="txtCardNo" class="form-control" name="" placeholder="Card No" autofocus="autofocus">
        </div>
    </div>

    <div class="portlet">
        <div class="portlet-title">
            <div class="caption">
                <asp:label id="portletVoucherNo" runat="server" Text="">Employee Details </asp:label>
            </div>
        </div>  
        <div class="tabbable">
            <ul class="nav nav-tabs nav-tabs-lg">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab" aria-expanded="true">Header Details</a>
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
                                        User Info
                                    </div>

                                </div>
                                <div class="portlet-body">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </div>
</asp:Content>
