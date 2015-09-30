<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="SLIIT.ITP.UI.HR.Modify" %>

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
                        url: "../../Services/HRServices.asmx/GetAllAttendenceLogs",
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
                        url: "../../Services/HRServices.asmx/Insert",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdLog').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    update: {
                        type: "POST",
                        url: "../../Services/HRServices.asmx/Update",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdLog').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    destroy: {
                        type: "POST",
                        url: "../../Services/HRServices.asmx/Delete",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8"
                    },
                    parameterMap: function (options, operation) {

                        if (operation !== "read" && options.models) {

                            if (operation == "create") {

                                if (operation == "create") {
                                    options.models[0].RnLogID = 0;
                                }

                            }

                            var model = JSON.stringify({ log: options.models[0] });
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
                        id: "RnLogID",
                        fields: {
                            RnLogID: { editable: false, nullable: false, type: "text" },
                            LogTime: { editable: true, nullable: false, type: "date" },
                            UserID: { editable: false, nullable: false, type: "text" },
                            UserName: { editable: false, nullable: false, type: "text" },
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

            $("#grdLog").kendoGrid({
                dataSource: itemDS,
                pageable: {
                    refresh: false,
                    pageSizes: false
                },
                toolbar: [{ name: "create", text: "Add Item" }],
                columns: [
                {
                    field: "RnLogID",
                    title: "LogID"
                },
                {
                    field: "LogTime",
                    title: "LogTime",
                    editor: dateTimeEditor,
                    template: "#=kendo.toString(kendo.parseDate(LogTime, 'yyyy-MM-dd  HH:mm'), 'MM/dd/yyyy  HH:mm')#"
                },
                {
                    field: "UserName",
                    title: "UserName"
                },
                {
                    field: "Type",
                    title: "Type"
                },
                { command: [{ name: "edit", text: "Modify" }, "destroy"], title: "&nbsp;", width: "180px", hidden: false }],
                editable: "popup"
            });

        }

        function dateTimeEditor(container, options) {
            $('<input data-text-field="' + options.field + '" data-value-field="' + options.field + '" data-bind="value:' + options.field + '" data-format="' + options.format + '"/>')
                    .appendTo(container)
                    .kendoDateTimePicker({});
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


    <div id="grdLog"></div>



</asp:Content>
