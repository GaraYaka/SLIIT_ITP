<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyStats.aspx.cs" Inherits="SLIIT.ITP.UI.VF.DailyStats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">

        function InsertItem() {
            //var txtVehicleID = document.getElementById("txtVehicleID").value;
            var txtFromLocation = document.getElementById("txtFromLocation").value;
            var txtToLocation = document.getElementById("txtToLocation").value;
            var txtDistanceToday = document.getElementById("txtDistance").value;
            var txtMaintenanceNotes = document.getElementById("txtMaintenanceNotes").value;                             
            var e = document.getElementById("cmbVehicleID");
            var txtVehicleID = e.options[e.selectedIndex].value;
            alert(txtVehicleID);
            var sendData = JSON.stringify({ RnVehicleID: txtVehicleID, FromLocation: txtFromLocation, ToLocation: txtToLocation, DistanceToday: txtDistance, MaintenanceNotes: txtMaintenanceNotes });

            $.ajax({
                type: "POST",
                url: "../../Services/VFServices.asmx/AddStats",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert("Done");

                }, error: function (request, status, error) {
                    alert("Error")
                }
            });
        }
       
        $(document).ready(function () {


            $.ajax({
                url: "../../Services/VFServices.asmx/getVehicleID",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                    var html = "";
                    html += "<select id=cmbCat class=form-control>";
                    for (var i = 0; i < result.d.length; i++) {


                        html += "<option value=" + result.d[i].RnVehicleID + ">" + result.d[i].RnVehicleID + "</option>";
                    }

                    html += "</select>";

                    $('#cmbVehicleID').append(html);
                }, error: function (request, status, error) {
                    alert("Error! Cannot load vehicle list");
                }
            });
        });

        function my() {
           
            var txtFromLocation = document.getElementById("txtFromLocation").value;
            var txtToLocation = document.getElementById("txtToLocation").value;
            var txtDistanceToday = document.getElementById("txtDistance").value;
            var txtMaintenanceNotes = document.getElementById("txtMaintenanceNotes").value;
            //var e = document.getElementById("cmbVehicleID");
            //var txtVehicleID = e.options[e.selectedIndex].value;
            //alert(txtVehicleID);
            var sendData = JSON.stringify({ RnVehicleID: txtVehicleID, FromLocation: txtFromLocation, ToLocation: txtToLocation, DistanceToday: txtDistance, MaintenanceNotes: txtMaintenanceNotes });

            $.ajax({
                type: "POST",
                url: "../../Services/VFServices.asmx/AddStats",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert("Done");

                }, error: function (request, status, error) {
                    alert("Error")
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
										<a href="#tab_1" data-toggle="tab" aria-expanded="true">
                                        Add Daily Stats
										 </a>
									</li>
									<li class="">
										<a href="#tab_2" data-toggle="tab" aria-expanded="false">
										 Vehicle Info
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
                            <div id="cmbVehicleID"><label class="control-label">Vehicle #</label>
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

                <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="my();">Add</button>
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
								<a href="javascript:;" class="collapse" data-original-title="" title="">
								</a>
								
								<a href="javascript:;" class="reload" data-original-title="" title="">
								</a>
								
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										 <div class="col-md-6 col-sm-12"><div id="sample_1_filter" class="dataTables_filter"><label>Search: <input type="search" class="form-control input-small input-inline" placeholder="" aria-controls="sample_1"></label></div></div>
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li>
													<a href="javascript:;">
													Print </a>
												</li>
												<li>
													<a href="javascript:;">
													Save as PDF </a>
												</li>
												<li>
													<a href="javascript:;">
													Export to Excel </a>
												</li>
											</ul>
										</div>
                                       
									</div>
								</div>
							</div>
							<%-- Begin Table--%>
                                            
						
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-hover">
								<thead>
								<tr>
									<th style="height: 24px">
										 Vehicle ID
									</th>
									<th style="height: 24px">
										 From
									</th>
									<th style="height: 24px">
										 To
									</th>
									<th style="height: 24px">
										 Distance
									</th>
									<th style="height: 24px">
										Maintenance Notes
									</th>
                                    
                                    
								</tr>
								</thead>
								<tbody>
								</tbody>
								</table>
							
						</div>
                                            <%--End Table--%>
						</div>
                            <div class="row"><div class="col-md-5 col-sm-12"><div class="dataTables_info" id="sample_1_info" role="status" aria-live="polite">Showing 1 to 5 of 25 entries</div></div><div class="col-md-7 col-sm-12"><div class="dataTables_paginate paging_bootstrap_full_number" id="sample_1_paginate"><ul class="pagination" style="visibility: visible;"><li class="prev disabled"><a href="#" title="First"><i class="fa fa-angle-double-left"></i></a></li><li class="prev disabled"><a href="#" title="Prev"><i class="fa fa-angle-left"></i></a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li class="next"><a href="#" title="Next"><i class="fa fa-angle-right"></i></a></li><li class="next"><a href="#" title="Last"><i class="fa fa-angle-double-right"></i></a></li></ul></div></div></div>
					</div>
											
					</div>
											
										</div>
									</div>
									
									
									
								</div>
							</div>
						</div>

</asp:Content>
