<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyStats.aspx.cs" Inherits="SLIIT.ITP.UI.VF.DailyStats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>


    <script type="text/javascript">

        function InsertItem() {

            var txtFromLocation = document.getElementById("txtFromLocation").value;
            var txtToLocation = document.getElementById("txtToLocation").value;
            var txtDistanceToday = document.getElementById("txtDistance").value;
            var txtMaintenanceNotes = document.getElementById("txtMaintenanceNotes").value;

            var e = document.getElementById("cmbCat");
            var txtVehicleID = e.options[e.selectedIndex].value;


            var sendData = JSON.stringify({ VehicleID: txtVehicleID, FromLocation: txtFromLocation, ToLocation: txtToLocation, DistanceToday: txtDistanceToday, MaintenanceNotes: txtMaintenanceNotes });

            $.ajax({
                type: "POST",
                url: "../../Services/VFServices.asmx/AddStats",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert("Successfully Added!");
                    LoadGridData();
                    clearInputs();

                }, error: function (request, status, error) {
                    alert("Error! Could not Save.");
                }
            });
        }

        $(document).ready(function () {

            LoadItemsOnPageLoad();
            LoadGridData();

        });

        function UpdateStats(rnIDtxt) {

            var txtFromLocation = document.getElementById("txtFromLocation1").value.trim();
            var txtToLocation = document.getElementById("txtToLocation1").value.trim();
            var txtDistanceToday = document.getElementById("txtDistance1").value.trim();
            var txtMaintenanceNotes = document.getElementById("txtMaintenanceNotes1").value.trim();

            var sendData = JSON.stringify({ FromLocation: txtFromLocation, ToLocation: txtToLocation, DistanceToday: txtDistanceToday, MaintenanceNotes: txtMaintenanceNotes, rnId: rnIDtxt });


            $.ajax({

                url: "../../Services/VFServices.asmx/UpdateStats",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (result) {
                    LoadGridData();
                    CloseModal();
                    alert("Successfully Updated");
                   // location.reload();

                }, error: function (request, status, error) {
                    alert("Error")
                }
            });
        }


        function clearInputs() {
            document.getElementById("txtFromLocation").value = "";
            document.getElementById("txtToLocation").value = "";
            document.getElementById("txtDistanceToday").value = "";
            document.getElementById("txtMaintenanceNotes").value = "";
        }

        function Search() {

            var searchText = document.getElementById("txtSearch").value;

            var sendData = JSON.stringify({ searchString: searchText });

            $.ajax({
                url: "../../Services/VFServices.asmx/SearchDailyVehicleStats",
                dataType: "json",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    var htmlText = "";

                    htmlText += "<table class='table table-hover' id='VehicleTable'>";
                    htmlText += "<tr>";
                    htmlText += "<th style='height: 24px'>Vehicle ID </th>";
                    htmlText += "<th style='height: 24px'>From</th>";
                    htmlText += "<th style='height: 24px'>To</th>";
                    htmlText += "<th style='height: 24px'>Distance</th>";
                    htmlText += "<th style='height: 24px'>Maintenance Notes</th>";
                    htmlText += "<th style='height: 24px'>Recorded Date</th>";
                    htmlText += "<th style='height: 24px'>Action</th>";
                    htmlText += "</tr>";

                    for (var i = 0; i < result.d.length; i++) {
                        htmlText += "<tr>";
                        htmlText += "<td>" + result.d[i].RegNo + "</td>";
                        htmlText += "<td>" + result.d[i].FromLocation + "</td>";
                        htmlText += "<td>" + result.d[i].ToLocation + "</td>";
                        htmlText += "<td>" + result.d[i].DistanceToday + "</td>";
                        htmlText += "<td>" + result.d[i].MaintenanceNotes + "</td>";
                        htmlText += "<td>" + result.d[i].DisplayInsertedDate + "</td>";
                        htmlText += "<td><button id='btnUpdate' type='button' class='btn blue' onclick='Update(" + result.d[i].RnVehicleDaily + ");'><i class='icon-pencil'> </i> Update</button></td>";
                        htmlText += "</tr>";
                    }

                    htmlText += "</table>";

                    dailyVehicleStatsTbl.innerHTML = htmlText;

                }, error: function (request, status, error) {
                    alert("Error! Could not search");
                }
            });


        }

        function LoadItemsOnPageLoad() {

            $.ajax({
                url: "../../Services/VFServices.asmx/GetAllVehicles",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                    var html = "";
                    html += "<select id=cmbCat class=form-control>";
                    for (var i = 0; i < result.d.length; i++) {


                        html += "<option value=" + result.d[i].RnVehicleID + ">" + result.d[i].RegNo + "</option>";
                    }

                    html += "</select>";

                    $('#cmbVehicleID').append(html);
                }, error: function (request, status, error) {
                    alert("Error! Cannot load vehicle list");
                }
            });
        }


        function LoadGridData() {

            $.ajax({
                url: "../../Services/VFServices.asmx/GetDailyVehicleStats",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    var htmlText = "";

                    htmlText += "<table class='table table-hover' id='VehicleTable'>";
                    htmlText += "<tr>";
                    htmlText += "<th style='height: 24px'>Vehicle ID </th>";
                    htmlText += "<th style='height: 24px'>From</th>";
                    htmlText += "<th style='height: 24px'>To</th>";
                    htmlText += "<th style='height: 24px'>Distance</th>";
                    htmlText += "<th style='height: 24px'>Maintenance Notes</th>";
                    htmlText += "<th style='height: 24px'>Recorded Date</th>";
                    htmlText += "<th style='height: 24px'>Action</th>";
                    htmlText += "</tr>";

                    for (var i = 0; i < result.d.length; i++) {
                        htmlText += "<tr>";
                        htmlText += "<td>" + result.d[i].RegNo + "</td>";
                        htmlText += "<td>" + result.d[i].FromLocation + "</td>";
                        htmlText += "<td>" + result.d[i].ToLocation + "</td>";
                        htmlText += "<td>" + result.d[i].DistanceToday + "</td>";
                        htmlText += "<td>" + result.d[i].MaintenanceNotes + "</td>";
                        htmlText += "<td>" + result.d[i].DisplayInsertedDate + "</td>";
                        htmlText += "<td><button id='btnUpdate' type='button' class='btn blue' onclick='Update(" + result.d[i].RnVehicleDaily + ");'><i class='icon-pencil'> </i> Update</button></td>";
                        htmlText += "</tr>";
                    }

                    htmlText += "</table>";

                    dailyVehicleStatsTbl.innerHTML = htmlText;

                }, error: function (request, status, error) {
                    alert("Error! Cannot Load The Grid");
                }
            });



        }


        function Update(rnId) {

            popHTMLContent = '<div id="grdItemsModal" style="">';
            popHTMLContent += '  <label class="control-label">From</label>';
            popHTMLContent += '  <input type="text" id="txtFromLocation1" class="form-control" placeholder="Enter start location"><br />';
            popHTMLContent += '  <label class="control-label">To</label>';
            popHTMLContent += '  <input type="text" id="txtToLocation1" class="form-control" placeholder="Enter end location"><br />';
            popHTMLContent += '  <label class="control-label">Distance (in KM)</label>';
            popHTMLContent += '  <input type="text" id="txtDistance1" class="form-control" placeholder="Enter the distance travelled"><br />';
            popHTMLContent += '  <label class="control-label">Trip Details</label>';
            popHTMLContent += '  <input type="text" id="txtMaintenanceNotes1" class="form-control" placeholder="Enter a brief description of the trip"><br />';
            popHTMLContent += '  <div id="btn" class="form-actions right">';
            popHTMLContent += '<button id="btnUpdate2" type="button" class="btn blue" onclick=UpdateStats(' + rnId + ');>Update</button>';
            popHTMLContent += '<button id="btnUpdate2" type="button" class="btn dark" onclick=CloseModal();>Cancel</button>';
            popHTMLContent += ' </div>';
            bootbox.dialog({
                message: popHTMLContent,
                title: "<h3 class='page-title'>Update Statistics<small></small></h3>",
                closeButton: false,
            });

            var sendData = JSON.stringify({id : rnId});
            $.ajax({
                url: "../../Services/VFServices.asmx/GetByID",
                dataType: "json",
                data:sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {


                    document.getElementById("txtFromLocation1").value = result.d.FromLocation;
                    document.getElementById("txtToLocation1").value = result.d.ToLocation;
                    document.getElementById("txtDistance1").value = result.d.DistanceToday;
                    document.getElementById("txtMaintenanceNotes1").value = result.d.MaintenanceNotes;
                    

                }, error: function (request, status, error) {
                }

            });

        }

        function CloseModal() {
            //close posting modal
            bootbox.hideAll();
        }


        function searchSel() {
            var input = document.getElementById('cmbCat').value.toLowerCase();

            len = input.length;
            output = document.getElementById('cmbCat').options;
            for (var i = 0; i < output.length; i++)
                if (output[i].text.toLowerCase().indexOf(input) != -1) {
                    output[i].selected = true;
                    break;
                }
            if (input == '')
                output[0].selected = true;
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="portlet-body">
        <div class="tabbable">
            <ul class="nav nav-tabs nav-tabs-lg">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab" aria-expanded="true">Add Daily Stats
                    </a>
                </li>
                <li class="">
                    <a href="#tab_2" data-toggle="tab" aria-expanded="false">Trip Details
                    </a>
                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="portlet light bordered">
                        <div class="portlet-body form" style="display: block;">
                            <div class="portlet-title">
                                <div class="caption font-red-sunglo">
                                    <span class="caption-subject bold uppercase">
                                        <h3 class="form-section">Vehicle Details</h3>
                                    </span>
                                </div>
                                <!-- BEGIN FORM-->
                                <form id="Master" action="#" class="horizontal-form">
                                    <div class="form-body">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <div id="cmbVehicleID">
                                                        <label class="control-label">Vehicle #</label>
                                                    </div>

                                                    <br />
                                                    <%--for search boc--%>
                                                    <%-- <hr />

                                            <div class="form-group">
                                                <label class="control-label col-md-3">Small Input</label>
                                                <div class="col-md-4">
                                                    <select class="form-control input-large select2me input-sm" data-placeholder="Select...">
                                                        <option value="AL">Alabama</option>
                                                        <option value="WY">Wyoming</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <hr />

                                            <br />--%>

                                                    <label class="control-label">From</label>
                                                    <input type="text" id="txtFromLocation" class="form-control" placeholder="Enter start location"><br />
                                                    <label class="control-label">To</label>
                                                    <input type="text" id="txtToLocation" class="form-control" placeholder="Enter end location"><br />
                                                    <label class="control-label">Distance (in KM)</label>
                                                    <input type="text" id="txtDistance" class="form-control" placeholder="Enter the distance travelled"><br />
                                                    <label class="control-label">Trip Details</label>
                                                    <input type="text" id="txtMaintenanceNotes" class="form-control" placeholder="Enter a brief description of the trip"><br />
                                                    <div id="btn" class="form-actions right">

                                                        <button id="btnAdd" type="button" class="btn blue" style="width: 56px" onclick="InsertItem();">Add</button>
                                                        <button id="btnClear" type="button" class="btn default" style="width: 56px" onclick="clearInputs();">Clear</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>




                </div>
                <div class="tab-pane fade" id="tab_2">
                    <div class="table-container">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-globe"></i>Daily Statistics
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse" data-original-title="" title=""></a>

                                    <a href="javascript:;" class="reload" data-original-title="" title="" onclick="LoadGridData();"></a>

                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-6 col-sm-12">
                                                <div id="sample_1_filter" class="dataTables_filter">
                                                    <label>
                                                        Search:
                                                        <input type="search" class="form-control input-small input-inline" placeholder="Enter Search Text" aria-controls="sample_1" id="txtSearch" onkeyup="Search();"></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                                <%-- Begin Table--%>


                                <div class="portlet-body">
                                    <div id="dailyVehicleStatsTbl"></div>
                                    <%--End Table--%>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>



            </div>
        </div>
    </div>

</asp:Content>
