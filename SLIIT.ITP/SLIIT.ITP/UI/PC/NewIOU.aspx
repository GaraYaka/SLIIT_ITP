<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewIOU.aspx.cs" Inherits="SLIIT.ITP.UI.PC.NewIOU" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        var rowNumber = 1;
        var itemDS = null;
        var popWindow = null;
        var cbxApproval = null;
        var cbxPCOfficer = null;
        var notification = null;

        //$(document).ready(function () {

        //    $("#headerToolbar").kendoToolBar({
        //        items: [
        //                { template: "<span padding-right:15px;'></span>" }
        //        ]
        //    });

        //    notification = $("#notification").kendoNotification({
        //        position: {
        //            pinned: true,
        //            top: 30,
        //            right: 30
        //        },
        //        autoHideAfter: 5000,
        //        show: onShow,
        //        stacking: "down",
        //        templates: [{
        //            type: "error",
        //            template: $("#errorTemplate").html()
        //        }, {
        //            type: "upload-success",
        //            template: $("#successTemplate").html()
        //        }]

        //    }).data("kendoNotification");

        //    popWindow = $('#popupWindow').kendoWindow({
        //        width: "400px",
        //        title: 'Cash Receipt',
        //        modal: true
        //    }).data("kendoWindow");

        //    cbxApproval = $("#cbxApproveBy").kendoDropDownList({
        //        dataTextField: "DisplayName",
        //        dataValueField: "UserID",
        //        dataSource: {
        //            transport: {
        //                read: {
        //                    type: "POST",
        //                    url: "../../../Services/PettyCash.asmx/GetApproveUsers",
        //                    dataType: "json",
        //                    contentType: "application/json; charset=utf-8",
        //                }
        //            },
        //            schema: {
        //                parse: function (response) {
        //                    return response.d;
        //                }
        //            }
        //        }
        //    }).data("kendoDropDownList");

        //    cbxPCOfficer = $("#cbxPCOfficer").kendoDropDownList({
        //        dataTextField: "DisplayName",
        //        dataValueField: "UserID",
        //        dataSource: {
        //            transport: {
        //                read: {
        //                    type: "POST",
        //                    url: "../../../Services/PettyCash.asmx/GetPCOfficers",
        //                    dataType: "json",
        //                    contentType: "application/json; charset=utf-8",
        //                }
        //            },
        //            schema: {
        //                parse: function (response) {
        //                    return response.d;
        //                }
        //            }
        //        }
        //    }).data("kendoDropDownList");

        //    setupDataSource();
        //    $.ajax({
        //        url: "../../../Services/IOU.asmx/GetAllOpenIous",
        //        dataType: "json",
        //        contentType: "application/json; charset=utf-8",
        //        type: "POST",
        //        success: function (result) {
        //            toolbarControls(result);
        //        }
        //    });

        //});


        function freezeAllInputs() {
            //var type = getParameterByName("type");
            var grd = $('#grdItems').data("kendoGrid");
            $("#grdItems .k-add").parent().remove();
            grd.hideColumn(3);//hides the contol button column
        }

        function checkIOUs() {

            loadBasicData();

        }

        function setupDataSource() {

            itemDS = new kendo.data.DataSource({
                transport: {
                    read: {
                        type: "POST",
                        url: "../../../Services/IOU.asmx/GetIOUItems",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {

                                var temp = JSON.parse(data.responseText);

                                if (temp.d.length > 0) {
                                    setHeaderID();
                                }
                            }
                        }
                    },
                    create: {
                        type: "POST",
                        url: "../../../Services/IOU.asmx/SaveIOUItem",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdItems').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    update: {
                        type: "POST",
                        url: "../../../Services/IOU.asmx/UpdateIOUItem",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdItems').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    destroy: {
                        type: "POST",
                        url: "../../../Services/IOU.asmx/DeleteIOUItem",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8"
                    },
                    parameterMap: function (options, operation) {

                        if (operation !== "read" && options.models) {

                            if (operation == "create") {

                                if (operation == "create") {
                                    options.models[0].DetailID = 0;
                                    options.models[0].IOUHeaderID = 0;
                                }

                            }

                            var model = JSON.stringify({ iouItem: options.models[0] });
                            return model;
                        }
                    }
                },
                error: function (e) {
                    if (e.status == "error") {
                        var error = JSON.parse(e.xhr.responseText);
                        notification.hide();

                        notification.show({
                            message: error.Message
                        }, "error");
                        this.cancelChanges();
                    }
                },
                batch: true,
                pageSize: 30,
                schema: {
                    model: {
                        id: "DetailID",
                        fields: {
                            DetailID: { editable: false, nullable: true, type: "number" },
                            PettyCashHeaderID: { editable: false, nullable: true, type: "number" },
                            Category: { validation: { required: true }, defaultValue: { RnCategoryID: 1, CategoryName: '' } },
                            Description: {
                                type: "string",
                                validation: {
                                    required: true,
                                    descriptionCheckLength: function (input) {
                                        input.attr("data-descriptionCheckLength-msg", "Description cannot be longer than 200 Characters!");
                                        return input.val().length <= 200;
                                    }
                                }
                            },
                            Amount: {
                                type: "number",
                                validation: {
                                    required: true
                                }
                            }
                        }
                    },
                    parse: function (response) {
                        return response.d;
                    }
                },
                aggregate: [{ field: "Amount", aggregate: "sum" }]
            });

            loadGrid();
        }

        function setHeaderID() {

            $.ajax({
                url: "../../../Services/IOU.asmx/GetIOUFormatID",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                    $('#lblVoucherNo').html(result.d);
                    $('#portletVoucherNo').html("Voucher # " + result.d);

                }
            });
        }

        function toolbarControls(iou) {
            $.ajax({
                url: "../../../Services/IOU.asmx/GetIOUHeader",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    if (result.d != null) {

                        setHeaderID();

                        if (result.d.Status != 1) {
                            loadHistoryTbl();
                        }

                        if (result.d.Status == 1) {
                            var grd = $('#grdItems').data("kendoGrid");

                            var toolbar = $("#headerToolbar").data("kendoToolBar");
                            toolbar.add({ type: "button", text: "Submit", icon: "tick", click: onSubmitClick, id: 'btnSubmit' });

                            grd.showColumn(4);

                            cbxApproval.enable(true);
                            cbxPCOfficer.enable(true);
                        } else {

                            cbxApproval.enable(false);
                            cbxPCOfficer.enable(false);

                            var toolbar = $("#headerToolbar").data("kendoToolBar");
                            $('#headerToolbar').hide();//toolbar hide
                            //$('#toolbarBR').hide();//toolbar <br /> hide

                        }

                        if (result.d.ApprovedBy != null && result.d.ApprovedBy > 0) {
                            cbxApproval.value(result.d.ApprovedBy);
                        }

                        if (result.d.PCOfficer != null && result.d.PCOfficer > 0) {
                            cbxPCOfficer.value(result.d.PCOfficer);
                        }


                    } else {

                        var toolbar = $("#headerToolbar").data("kendoToolBar");
                        toolbar.add({ type: "button", text: "Submit", icon: "tick", click: onSubmitClick, id: 'btnSubmit' });
                    }

                    //disable submit button when IOU limit is exceeded
                    if (iou.d.OpenIOUCount >= iou.d.MaxOpenIOULimit) {
                        var toolbar = $("#headerToolbar").data("kendoToolBar");

                        repeatButton = $("#btnSubmit"),
                        isDisabled = repeatButton.hasClass("k-state-disabled");

                        toolbar.enable(repeatButton, isDisabled);

                    }

                    changeButtonStyles();
                }
            });
        }

        function loadBasicData(iou) {
            $.ajax({
                url: "../../../Services/IOU.asmx/GetIOUHeader",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    if (result.d != null) {

                        setHeaderID();

                        if (result.d.Status != 1) {
                            loadHistoryTbl();
                        }

                        if (result.d.Status == 1 || result.d.Status == 4) {
                            var grd = $('#grdItems').data("kendoGrid");

                            grd.showColumn(4);

                        } else {
                            var grd = $('#grdItems').data("kendoGrid");
                            grd.hideColumn(4);
                            $("#grdItems .k-add").parent().remove();

                            $(".k-grid-delete", "#grdItems").hide();
                            $(".k-grid-edit", "#grdItems").hide();

                        }

                    } else {
                        var grd = $('#grdItems').data("kendoGrid");

                        $(".k-grid-delete", "#grdItems").hide();
                        $(".k-grid-edit", "#grdItems").hide();
                    }
                }
            });
        }

        function onBackClick() {
            window.location.replace(document.referrer);
        }

        function onSubmitClick() {

            if (!cbxApproval.value()) {
                notification.hide();

                notification.show({
                    message: 'Please select approve person'
                }, "info");
                return;
            }

            if (!cbxPCOfficer.value()) {
                notification.hide();

                notification.show({
                    message: 'Please select petty cash officer'
                }, "info");
                return;
            }

            var item = itemDS.at(0);
            if (item == null) {
                return;
            }

            $('#popupWindow').empty();
            $('#popupWindow').html("Loading...");
            popWindow.center().open();

            var sendData = JSON.stringify({ approveBy: cbxApproval.value(), pcOfficer: cbxPCOfficer.value() });

            $.ajax({
                url: "../../../Services/IOU.asmx/SubmitIOU",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                data: sendData,
                success: function (result) {

                    //hide controls col
                    var grd = $('#grdItems').data("kendoGrid");
                    grd.hideColumn(3);

                    freezeAllInputs();
                    $(".k-grid-delete", "#grdItems").hide();
                    $(".k-grid-edit", "#grdItems").hide();


                    cbxApproval.enable(false);
                    cbxPCOfficer.enable(false);

                    popWindow.close();
                    notification.hide();

                    notification.show({
                        message: "Successfully Submitted"
                    }, "upload-success");

                    //refresh history grid after submission
                    //$('#grdHistory').data('kendoGrid').dataSource.read();
                    //$('#grdHistory').data('kendoGrid').refresh();

                    $('#headerToolbar').hide();//toolbar hidetoolbarBR
                    //$('#toolbarBR').hide();//toolbar <br /> hide

                    loadHistoryTbl();

                    setupControllers();
                }, error: function (request, status, error) {

                    var temp = JSON.parse(request.responseText);

                    popWindow.close();
                    notification.hide();

                    notification.show({
                        message: temp.Message
                    }, "error");
                }
            });
        }


        function setupControllers() {

            var grd = $('#grdItems').data("kendoGrid");
            $("#grdItems .k-add").parent().remove();
            grd.hideColumn(3);

            var toolbar = $("#headerToolbar").data("kendoToolBar");

            toolbar.remove("#btnSubmit");
        }

        function loadGrid() {
            $("#grdItems").kendoGrid({
                dataSource: itemDS,
                dataBound: onDataBound,
                pageable: {
                    refresh: false,
                    pageSizes: false
                },
                toolbar: [{ name: "create", text: "Add Item" }],
                aggregate: [{ field: "Amount", aggregate: "sum" }],
                columns: [
                {
                    field: "Category",
                    title: "Category",
                    editor: CategoryDropDownEditor,
                    template: "#=Category.CategoryName#",
                    hidden: false
                },
                {
                    field: "Description",
                    editor: textEditor,
                },
                {
                    field: "Amount",
                    format: "{0:n}",
                    footerTemplate: "Sum:  #=  kendo.toString(sum, 'n')#"
                },
                { command: [{ name: "edit", text: "Modify" }, "destroy"], title: "&nbsp;", width: "180px", hidden: false }],
                editable: "popup"
            });

        }

        function onDataBound() {
            checkIOUs();
        }

        function accountDropDownEditor(container, options) {
            $('<input required data-text-field="AccountCode" data-value-field="AccountCodeID" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoDropDownList({
                    autoBind: false,
                    index: -1,
                    dataSource: {
                        transport: {
                            read: {
                                type: "POST",
                                url: "../../../Services/PettyCash.asmx/GetAllAccountCodes",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8"
                            }
                        },
                        schema: {
                            parse: function (response) {
                                return response.d;
                            }
                        }
                    }
                });
        }

        function CategoryDropDownEditor(container, options) {
            $('<input required data-text-field="CategoryName" data-value-field="RnCategoryID" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoDropDownList({
                    autoBind: false,
                    index: -1,
                    dataSource: {
                        transport: {
                            read: {
                                type: "POST",
                                url: "../../../Services/IOU.asmx/GetAllCategories",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8"
                            }
                        },
                        schema: {
                            parse: function (response) {
                                return response.d;
                            }
                        }
                    }
                });
        }

        function renderRecordNumber(data) {
            var page = parseInt($("#grdItems").data("kendoGrid").dataSource.page()) - 1;
            var pagesize = $("#grdItems").data("kendoGrid").dataSource.pageSize();
            return parseInt(rowNumber + (parseInt(page) * parseInt(pagesize)));
        }

        function textEditor(container, options) {
            var width = container.width() - 10;
            $('<textarea required  name="' + options.field + '" style="width:auto; height: 50px;" />')
             .appendTo(container);
        }

        function onShow(e) {
            if (!$("." + e.sender._guid)[1]) {
                var element = e.element.parent(),
                    eWidth = element.width(),
                    eHeight = element.height(),
                    wWidth = $(window).width(),
                    wHeight = $(window).height(),
                    newTop, newLeft;

                newLeft = Math.floor(wWidth / 2 - eWidth / 2);
                newTop = Math.floor(wHeight / 2 - eHeight / 2);

                e.element.parent().css({ top: newTop, left: newLeft });
            }
        }

        function loadHistoryTbl() {

            $("#grdHistory").kendoGrid({
                dataSource: {
                    transport: {
                        read: {
                            type: "POST",
                            url: "../../../Services/IOU.asmx/GetActionHistoryByID",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8"
                        },
                    },
                    schema: {
                        parse: function (response) {
                            return response.d;
                        }
                    },
                    pageSize: 20
                },
                columns: [
                {
                    field: "Action",
                    title: "Action"
                },
                {
                    field: "UserDisplayName",
                    title: "Name"
                },
                {
                    field: "ActionDate",
                    title: "Date"
                },
                {
                    field: "Remark",
                    title: "Remark"
                }]
            });
        }


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
                <span id="portletVoucherNo"></span><%--<span class="hidden-480">| Dec 27, 2013 7:16:25 </span>--%>
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
                                                <div class="table-container" id="grdItems"></div>
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

