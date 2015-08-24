<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewIOU.aspx.cs" Inherits="SLIIT.ITP.UI.PC.NewIOU" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        var rowNumber = 1;
        var itemDS = null;
        var popWindow = null;
        var cbxApproval = null;
        var cbxPCOfficer = null;
        var notification = null;

        $(document).ready(function () {

            cbxApproval = $("#cbxApproveBy").kendoDropDownList({
                dataTextField: "FirstName",
                dataValueField: "RnUserID",
                dataSource: {
                    transport: {
                        read: {
                            type: "POST",
                            url: "../../../Services/HRServices.asmx/GetAllUsers",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                        }
                    },
                    schema: {
                        parse: function (response) {
                            return response.d;
                        }
                    }
                }
            }).data("kendoDropDownList");

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div id="headerToolbar"></div>
    <%--<br id="toolbarBR" />--%>


    <div class="portlet">
        <div class="portlet-title">
            <div class="caption">
                <span id="portletVoucherNo"><button type="button" class="btn btn-red">Submit</button> </span><%--<span class="hidden-480">| Dec 27, 2013 7:16:25 </span>--%>
            </div>
        </div>
        <div class="tabbable">
            <ul class="nav nav-tabs nav-tabs-lg">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab" aria-expanded="true">Header Details</a>
                </li>
                <li>
                    <a href="#tab_2" data-toggle="tab" aria-expanded="true">History</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN Portlet PORTLET-->
                            <div class="portlet-body">
                                <div class="portlet-body">
                                    <div class="scroller" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
                                        <div class="row">
                                            <div class="col-md-6 ">
                                                <!-- BEGIN Portlet PORTLET-->
                                                <div class="portlet light bordered">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            Basic Information
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <table class="spacedTable">
                                                            <tr>
                                                                <td style="width: 200px;"><b>Voucher No.</b></td>
                                                                <td><span id="lblVoucherNo"></span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Date</b></td>
                                                                <td>
                                                                    <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Approve By</b></td>
                                                                <td>
                                                                    <input id="cbxApproveBy" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Petty Cash Officer</b></td>
                                                                <td>
                                                                    <input id="cbxPCOfficer" /></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- END Portlet PORTLET-->
                                            </div>
                                            <div class="col-md-6 ">
                                                <!-- BEGIN Portlet PORTLET-->
                                                <div class="portlet light bordered">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            Pre-Requisites
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <table class="spacedTable">
                                                            <tr>
                                                                <td>Your number of unclosed CA's</td>
                                                                <td>
                                                                    <asp:Label ID="lblUnclosedIOUs" runat="server" Text=""></asp:Label>&emsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Vouchers Submitted for Approval</td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblSubmittedForApproval" runat="server" Text=""></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblMaxIOUMsg" runat="server" Text="" CssClass="label label-danger"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>CA Settelment Period</td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="lblSettlementPeriod" runat="server" Text=""></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- END Portlet PORTLET-->
                                            </div>
                                        </div>

                                        <!-- BEGIN Portlet PORTLET-->
                                        <div class="portlet light bordered">
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    Voucher Details
                                                </div>
                                            </div>
                                            <div class="portlet-body">
                                                <%--<div class="table-container" id="grdItems"></div>--%>
                                                <table class="spacedTable">
                                                    <tr>
                                                        <th>Description</th>
                                                        <th>Date</th>
                                                        <th>Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" style="width:500px;" /> </td>
                                                        <td><input type="date" /> </td>
                                                        <td><input type="text" /> </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- END Portlet PORTLET-->
                                    </div>
                                </div>
                            </div>
                            <!-- END Portlet PORTLET-->
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_2">
                    <div class="table-container" id="grdHistory"></div>
                </div>
            </div>
        </div>
    </div>
    <br />

    <div id="popupWindow" style="display: none; margin: auto; text-align: center;">
    </div>
    <br />


    <span id="notification" style="display: none;"></span>
    <script id="errorTemplate" type="text/x-kendo-template">
                <div class="wrong-pass">
                    <img src="../../../Images/error-icon.png" />                  
                    <p>#= message #</p>
                </div>
    </script>

    <script id="successTemplate" type="text/x-kendo-template">
                <div class="upload-success">
                    <img src="../../../Images/success-icon.png" />
                    <h3>#= message #</h3>
                </div>
    </script>


    <style type="text/css">
        #headerToolbar {
            padding: 5px 10px;
        }

        .k-notification {
            border: 0;
        }

        /* Info template */
        .k-notification-info.k-group {
            background: rgba(0%,0%,0%,.7);
            color: #fff;
        }

        .new-mail {
            width: 300px;
            height: 100px;
        }

            .new-mail h3 {
                font-size: 1em;
                padding: 32px 10px 5px;
            }

            .new-mail img {
                float: left;
                margin: 30px 15px 30px 30px;
            }

        /* Error template */
        .k-notification-error.k-group {
            background: rgba(100%,0%,0%,.7);
            color: #ffffff;
        }

        .wrong-pass {
            width: 500px;
            height: 130px;
        }

            .wrong-pass h3 {
                font-size: 1em;
                padding: 32px 10px 5px;
            }

            .wrong-pass p {
                padding: 5px;
                text-align: justify;
            }

            .wrong-pass img {
                float: left;
                margin: 30px 15px 30px 15px;
            }

        /* Success template */
        .k-notification-upload-success.k-group {
            background: rgba(0%,60%,0%,.7);
            color: white;
        }

        .upload-success {
            width: 320px;
            height: 80px;
            padding: 10px 15px;
            /*line-height: 100px;*/
        }

            .upload-success h3 {
                font-size: 1.7em;
                font-weight: normal;
                display: inline-block;
                vertical-align: middle;
            }

            .upload-success img {
                float: left;
                margin: 30px 15px 30px 15px;
            }

        .spacedTable {
            border-spacing: 10px;
            border-collapse: separate;
        }

        .spacedTable {
            border-spacing: 10px;
            border-collapse: separate;
        }
    </style>

    <script type="text/javascript">
        function changeButtonStyles() {
            $("#btnSubmit").addClass("btn btn-danger");
            $("#btnBack").addClass("btn grey-cascade");
        }
    </script>
</asp:Content>

