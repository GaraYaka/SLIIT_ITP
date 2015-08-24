<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllRequestor.aspx.cs" Inherits="SLIIT.ITP.UI.PC.ViewAllRequestor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">
        var windowType = null;
        var dataView = null;

        $(document).ready(function () {

            windowType = $('#windowType').kendoWindow({
                width: "400px",
                title: "Select Cash Receipt Type",
                modal: true,
                actions: [
                    "Close"
                ]
            }).data("kendoWindow");

            $('#btnPCSelection').kendoButton({
                click: btnPCSelection_click
            });

            $("#tbPC").kendoTabStrip({
                animation: {
                    open: {
                        effects: "fadeIn"
                    }
                }
            });

            loadIOUGrid();


            function btnPCSelection_click() {

                if ($('input[name=pctype]:checked').length > 0) {
                    var val = $('input[name=pctype]:checked').val();

                    if (val) {
                        window.location.href = "NewPettyCash.aspx?type=" + val;
                    }

                } else {
                    // alert('unchecked');
                }
            }
        });


        function loadIOUGrid() {
            $("#grdIOU").kendoGrid({
                dataSource: {

                    transport: {
                        read: {
                            type: "POST",
                            url: "../../../Services/PCServices.asmx/GetAllIOUs",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8"
                        },
                    },
                    sort: { field: "FormatIOUHeaderID", dir: "desc" },
                    schema: {
                        parse: function (response) {

                            //make Verification code null if verfication code == 0
                            for (var i = 0; i < response.d.length; i++) {
                                item = response.d[i];
                                if (item.VerificationCode == 0) {
                                    item.VerificationCode = null;
                                }
                            }
                            //////////

                            return response.d;
                        }
                    },
                    pageSize: 20
                },
                groupable: true,
                sortable: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 5
                },
                //detailInit: detailInitIOU,
                columns: [
                 {
                     field: "FormattedIOUID",
                     title: "Voucher #",
                 },
                 {
                     field: "IOUDate",
                     title: "Date",
                     template: "#= IOUDate != 'null' ? kendo.toString(kendo.parseDate(IOUDate, 'yyyy-MM-dd'), 'MM/dd/yyyy')  : 'Please Select' #"
                 },
                 {
                     field: "DisplayInsertedBy",
                     title: "Name"
                 },
                {
                    field: "StatusText",
                    title: "Status"
                },
                 {
                     field: "TotalAmount",
                     title: "Total Amount",
                     format: "{0:n}"
                 },
                 { command: { text: "View Details", click: viewIOUDetails }, title: " ", width: "120px" }],
                dataBound: function (e) {
                    dataView = this.dataSource.view();
                    for (var i = 0; i < dataView.length; i++) {
                        if (dataView[i].Status != null) {
                            var uid = dataView[i].uid;
                            $("#grdIOU").data("kendoGrid").table.find("tr[data-uid='" + dataView[i].uid + "']").css("background-color", dataView[i].StatusColor);
                        }
                    }
                }
            });




            $(".k-grid-newiou").click(function (e) {
                window.location.href = NewIOU.aspx; //"ViewIOU.aspx";

            });

            function viewIOUDetails(e) {
                alert("under construction!");
            }
        }



        function onBackClick() {
            window.location.replace(document.referrer);
        }




        function menuTypeSelection(e) {

            var windowType = $('#windowType').kendoWindow({
                width: "400px",
                title: "Select Cash Receipt Type",
                modal: true,
                actions: [
                    "Close"
                ]
            }).data("kendoWindow");


            $("#tbPC").kendoTabStrip({
                animation: {
                    open: {
                        effects: "fadeIn"
                    }
                }
            });

            windowType.center().open();

            $('#btnPCSelection').kendoButton({
                click: btnPCSelection_click
            });

        }


    </script>

    <style type="text/css">
        input {
            width: 40px;
        }

        alarm {
            background-color: black;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div id="tbPC">
        <ul>
            <li class="k-state-active">Cash Advance &emsp;
            </li>

        </ul>
        <div>
            <div id="grdIOU"></div>
        </div>
    </div>
</asp:Content>