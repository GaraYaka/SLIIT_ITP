<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyStats.aspx.cs" Inherits="SLIIT.ITP.UI.VF.DailyStats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

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

        function clearInputs() {
            document.getElementById("txtFromLocation").value = "";
            document.getElementById("txtToLocation").value = "";
            document.getElementById("txtDistance").value = "";
            document.getElementById("txtMaintenanceNotes").value = "";
        }

        function Search() {

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
                    htmlText += "</tr>";

                    for (var i = 0; i < result.d.length; i++) {
                        htmlText += "<tr>";
                        htmlText += "<td>" + result.d[i].RegNo + "</td>";
                        htmlText += "<td>" + result.d[i].FromLocation + "</td>";
                        htmlText += "<td>" + result.d[i].ToLocation + "</td>";
                        htmlText += "<td>" + result.d[i].DistanceToday + "</td>";
                        htmlText += "<td>" + result.d[i].MaintenanceNotes + "</td>";
                        htmlText += "</tr>";
                    }

                    htmlText += "</table>";

                    dailyVehicleStatsTbl.innerHTML = htmlText;

                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
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
                    htmlText += "</tr>";

                    for (var i = 0; i < result.d.length; i++) {
                        htmlText += "<tr>";
                        htmlText += "<td>" + result.d[i].RegNo + "</td>";
                        htmlText += "<td>" + result.d[i].FromLocation + "</td>";
                        htmlText += "<td>" + result.d[i].ToLocation + "</td>";
                        htmlText += "<td>" + result.d[i].DistanceToday + "</td>";
                        htmlText += "<td>" + result.d[i].MaintenanceNotes + "</td>";
                        htmlText += "<td>" + result.d[i].DisplayInsertedDate + "</td>";
                        htmlText += "</tr>";
                    }

                    htmlText += "</table>";

                    dailyVehicleStatsTbl.innerHTML = htmlText;

                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
                }
            });

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
                    <a href="#tab_2" data-toggle="tab" aria-expanded="false">Vehicle Info
                    </a>
                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="portlet-body form" style="display: block;">
                        <!-- BEGIN FORM-->
                        <form id="Master" action="#" class="horizontal-form">
                            <div class="form-body">
                                <h3 class="form-section">Vehicle Details</h3>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div id="cmbVehicleID">
                                                <label class="control-label">Vehicle #</label>
                                            </div>

                                            <label class="control-label">From</label>
                                            <input type="text" id="txtFromLocation" class="form-control" placeholder="">
                                            <label class="control-label">To</label>
                                            <input type="text" id="txtToLocation" class="form-control" placeholder="">
                                            <label class="control-label">Distance (in KM)</label>
                                            <input type="text" id="txtDistance" class="form-control" placeholder="">
                                            <label class="control-label">Maintenance Notes</label>
                                            <input type="text" id="txtMaintenanceNotes" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="btn" class="form-actions right">

                                <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="InsertItem();">Add</button>
                            </div>
                        </form>
                        <!-- END FORM-->
                    </div>




                </div>
                <div class="tab-pane" id="tab_2">
                    <div class="table-container">
                        <div class="portlet box grey-cascade">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-globe"></i>Daily Vehicle Stats
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
                                                        <input type="search" class="form-control input-small input-inline" placeholder="" aria-controls="sample_1"></label>
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
