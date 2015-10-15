<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintDTL.aspx.cs" Inherits="SLIIT.ITP.UI.CM.ComplaintDTL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">



    <script type="text/javascript">

        var rowNumber = 1;
        var itemDS = null;
        var popWindow = null;
        var notification = null;

        var tempResponce = null;

        $(document).ready(function () {
            setupDataSource();
        });


        function btnGetReport_Click() {

            var data = tempResponce.d;
            if (data == '')
                return;

            JSONToCSVConvertor(data, "Complaint Report", true);

        }

        function setupDataSource() {

            itemDS = new kendo.data.DataSource({
                transport: {
                    read: {
                        type: "POST",
                        url: "../../../Services/CMServices.asmx/GetAllComplaintsGrid",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {

                                tempResponce = JSON.parse(data.responseText);
                                var temp = JSON.parse(data.responseText);

                            }
                        }
                    },
                    create: {
                        type: "POST",
                        url: "../../../Services/CMServices.asmx/addCMPT",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdCM').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    update: {
                        type: "POST",
                        url: "../../../Services/CMServices.asmx/Update",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        complete: function (data, status) {
                            if (status === "success") {
                                $('#grdCM').data("kendoGrid").dataSource.read();
                            }
                        }
                    },
                    destroy: {
                        type: "POST",
                        url: "../../../Services/CMServices.asmx/Delete",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8"
                    },
                    parameterMap: function (options, operation) {

                        if (operation !== "read" && options.models) {

                            if (operation == "create") {

                                if (operation == "create") {
                                    options.models[0].CM_ID = 0;
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
                        id: "CM_ID",
                        fields: {
                            RegNo: { editable: false, nullable: false, type: "text" },
                            LogTime: { editable: true, nullable: false, type: "date" },
                            UserID: { editable: true, nullable: false, type: "text" },
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

            $("#grdCM").kendoGrid({
                dataSource: itemDS,
                pageable: {
                    refresh: false,
                    pageSizes: false
                },
                //toolbar: [{ name: "create", text: "Add Item" }],
                columns: [
                 {
                     field: "CM_ID",
                     title: "ID",
                 },
                 {
                     field: "CM_CUSTOMER_NAME",
                     title: "Name",
                     //template: "#= IOUDate != 'null' ? kendo.toString(kendo.parseDate(IOUDate, 'yyyy-MM-dd'), 'MM/dd/yyyy')  : 'Please Select' #"
                 },
                 {
                     field: "CM_EMAIL",
                     title: "Email"
                 },
                {
                    field: "CM_HOME_ADDRESS",
                    title: "Address"
                },
                 {
                     field: "CM_DESCRIPTION",
                     title: "Description"
                 },
                 { command: [{ name: "edit", text: "Modify" }, "destroy"], title: "&nbsp;", width: "180px", hidden: false }],
                editable: "popup"
            });

        }



            

        function textEditor(container, options) {
            var width = container.width() - 10;
            $('<textarea required  name="' + options.field + '" style="width:auto; height: 50px;" />')
             .appendTo(container);
        }


        function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
            //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
            var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;

            var CSV = '';
            //Set Report title in first row or line

            CSV += ReportTitle + '\r\n\n';

            //This condition will generate the Label/Header
            if (ShowLabel) {
                var row = "";

                //This loop will extract the label from 1st index of on array
                for (var index in arrData[0]) {

                    //Now convert each value to string and comma-seprated
                    row += index + ',';
                }

                row = row.slice(0, -1);

                //append Label row with line break
                CSV += row + '\r\n';
            }

            //1st loop is to extract each row
            for (var i = 0; i < arrData.length; i++) {
                var row = "";

                //2nd loop will extract each column and convert it in string comma-seprated
                for (var index in arrData[i]) {
                    row += '"' + arrData[i][index] + '",';
                }

                row.slice(0, row.length - 1);

                //add a line break after each row
                CSV += row + '\r\n';
            }

            if (CSV == '') {
                alert("Invalid data");
                return;
            }

            //Generate a file name
            var fileName = "MyReport_";
            //this will remove the blank-spaces from the title and replace it with an underscore
            fileName += ReportTitle.replace(/ /g, "_");

            //Initialize file format you want csv or xls
            var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);

            // Now the little tricky part.
            // you can use either>> window.open(uri);
            // but this will not work in some browsers
            // or you will not get the correct file extension    

            //this trick will generate a temp <a /> tag
            var link = document.createElement("a");
            link.href = uri;

            //set the visibility hidden so it will not effect on your web-layout
            link.style = "visibility:hidden";
            link.download = fileName + ".csv";

            //this part will append the anchor tag and remove it after automatic click
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        

    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <div id="tbPC">
        <ul>
            <li class="k-state-active">Complaint Details &emsp;
            </li>

        </ul>
        <div>
            <div id="grdCM"></div>
        </div>

    </div>
    </br>
    <div class="form-actions">
		<button type="submit" class="btn red" id="btnGetReport" onclick="btnGetReport_Click();">Generate Report</button>
	</div>
</asp:Content>
