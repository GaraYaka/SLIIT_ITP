<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyDetails.aspx.cs" Inherits="SLIIT.ITP.UI.VF.DailyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet-body form" style="display: block;">
        <!-- BEGIN FORM-->
        <form id="Master" action="#" class="horizontal-form">
            <div class="form-body">
                <h3 class="form-section">Vehicle Details</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Vehicle #</label>
                            <input type="text" id="txtVehicleNo" class="form-control" placeholder="">
                            <label class="control-label">Mileage</label>
                            <input type="text" id="txtMileage" class="form-control" placeholder="">
                            <label class="control-label">Fuel Cost</label>
                            <input type="text" id="txtFuel" class="form-control" placeholder="">
                            <label class="control-label">Traffic Violation</label>
                            <input type="text" id="txtTrafficViolation" class="form-control" placeholder="">
                            <label class="control-label">Maintenance Notes</label>
                            <input type="text" id="txtMaintenanceNotes" class="form-control" placeholder="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-actions right">
                <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="btnAdd_Click()">Add</button>
            </div>
        </form>
        <!-- END FORM-->
    </div>


</asp:Content>
