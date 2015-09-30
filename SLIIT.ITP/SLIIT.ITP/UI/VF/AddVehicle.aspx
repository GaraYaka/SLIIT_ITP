<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="SLIIT.ITP.UI.VF.AddVehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">

        var rowNumber = 1;
        var itemDS = null;
        var popWindow = null;
        var notification = null;

        $(document).ready(function () {
            setupDataSource();
        });

        function setupDataSource() {

            itemDS = new kendo.data.DataSource({
                transport: {
                    read: {
                        type: "POST",
                        url: "../../../Services/VFServices.asmx/GetAllVehicles",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {

                                var temp = JSON.parse(data.responseText);

                            }
                        }
                    },
                    create: {
                        type: "POST",
                        url: "../../../Services/VFServices.asmx/Insert",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdVehicle').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    update: {
                        type: "POST",
                        url: "../../../Services/VFServices.asmx/Update",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdVehicle').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    destroy: {
                        type: "POST",
                        url: "../../../Services/VFServices.asmx/Delete",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8"
                    },
                    parameterMap: function (options, operation) {

                        if (operation !== "read" && options.models) {

                            if (operation == "create") {

                                if (operation == "create") {
                                    options.models[0].RnVehicleID = 0;
                                }

                            }

                            var model = JSON.stringify({ vehicle: options.models[0] });
                            return model;
                        }
                    }
                },
                error: function (e) {
                    if (e.status == "error") {
                        var error = JSON.parse(e.xhr.responseText);
                        alert(error.Message);
                    }
                },
                batch: true,
                pageSize: 30,
                schema: {
                    model: {
                        id: "RnVehicleID",
                        fields: {
                            RegNo: { editable: true, nullable: false, type: "text" },
                            Model: { editable: true, nullable: false, type: "text" },
                            YearOfManuf: { editable: true, nullable: false, type: "date" },
                            YearOfPurchase: { editable: true, nullable: false, type: "date" },
                            EngineNo: { editable: true, nullable: false, type: "text" },
                            ChassisNo: { editable: true, nullable: false, type: "text" },
                            Status: { editable: true, nullable: false, validation: { required: true }, defaultValue: { Status: 0, StatusText: '' } },
                            Driver: { editable: true, nullable: false, validation: { required: true }, defaultValue: { RnAttendUserID: 0, FirstName: '' } }
                        }
                    },
                    parse: function (response) {
                        return response.d;
                    }
                }
            });

            loadGrid();
        }


        function loadGrid() {

            $("#grdVehicle").kendoGrid({
                dataSource: itemDS,
                pageable: {
                    refresh: false,
                    pageSizes: false
                },
                toolbar: [{ name: "create", text: "Add Vehicle" }],
                columns: [
                {
                    field: "RegNo",
                    title: "Registration Number",
                    editor: textEditor
                },
                {
                    field: "Model",
                    title: "Model",
                    editor: textEditor
                },
                {
                    field: "YearOfManuf",
                    title: "Year of manufacture",
                    template: "#=kendo.toString(kendo.parseDate(YearOfManuf, 'yyyy-MM-dd'), 'MM/dd/yyyy')#"
                },
                {
                    field: "YearOfPurchase",
                    title: "Year of purchase",
                    template: "#=kendo.toString(kendo.parseDate(YearOfPurchase, 'yyyy-MM-dd'), 'MM/dd/yyyy')#"
                },
                {
                    field: "EngineNo",
                    title: "Engine Number",
                    editor: textEditor
                },
                {
                    field: "ChassisNo",
                    title: "Chassis Number",
                    editor: textEditor,
                },
                {
                    field: "Driver",
                    title: "Driver",
                    editor: DriverDropDownEditor,
                    template: "#=Driver.FirstName#"
                },
                {
                    field: "Status",
                    title: "Status",
                    editor: StatusDropDownEditor,
                    template: "#=Status.StatusText#",
                },

                {
                    field: "TotalMilage",
                    title: "TotalMilage"
                },
                { command: [{ name: "edit", text: "Update" }, "destroy"], title: "&nbsp;", width: "180px", hidden: false }],
                editable: "popup"
            });

        }


        function StatusDropDownEditor(container, options) {
            $('<input required data-text-field="StatusText" data-value-field="StatusID" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoDropDownList({
                    autoBind: false,
                    index: -1,
                    dataSource: {
                        transport: {
                            read: {
                                type: "POST",
                                url: "../../Services/VFServices.asmx/GetAllStatuses",
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

        function DriverDropDownEditor(container, options) {
            $('<input required data-text-field="FirstName" data-value-field="RnAttendUserID" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoDropDownList({
                    autoBind: false,
                    index: -1,
                    dataSource: {
                        transport: {
                            read: {
                                type: "POST",
                                url: "../../Services/HRServices.asmx/GetAllUsers",
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


        function textEditor(container, options) {
            var width = container.width() - 10;
            $('<textarea required  name="' + options.field + '" style="width:auto; height: 50px;" />')
             .appendTo(container);
        }


    </script>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">



    <div id="grdVehicle"></div>


</asp:Content>
