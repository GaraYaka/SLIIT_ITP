<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="SLIIT.ITP.UI.VF.AddVehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">






    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN EXAMPLE TABLE PORTLET-->
            <div class="portlet">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-shopping-cart"></i>Manage Vehicles
                    </div>
                    <div class="actions">
                        <a href="javascript:;" class="btn default yellow-stripe">
                            <i class="fa fa-plus"></i>
                            <span class="hidden-480">Add new vehicle </span>
                        </a>
                        <div class="btn-group">
                            <a class="btn default yellow-stripe" href="javascript:;" data-toggle="dropdown">
                                <i class="fa fa-share"></i>
                                <span class="hidden-480">Tools </span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:;">Export to Excel </a>
                                </li>
                                <li>
                                    <a href="javascript:;">Export to CSV </a>
                                </li>
                                <li>
                                    <a href="javascript:;">Export to XML </a>
                                </li>
                                <li class="divider"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="table-container">

                        <div id="datatable_ajax_wrapper" class="dataTables_wrapper dataTables_extended_wrapper no-footer">
                            <div class="row">
                                <div class="col-md-8 col-sm-12">
                                    <div class="dataTables_paginate paging_bootstrap_extended" id="datatable_ajax_paginate">
                                        <div class="pagination-panel">Page <a href="#" class="btn btn-sm default prev disabled" title="Prev"><i class="fa fa-angle-left"></i></a>
                                            <input type="text" class="pagination-panel-input form-control input-mini input-inline input-sm" maxlenght="5" style="text-align: center; margin: 0 5px;"><a href="#" class="btn btn-sm default next disabled" title="Next"><i class="fa fa-angle-right"></i></a> of <span class="pagination-panel-total"></span></div>
                                    </div>
                                    <div class="dataTables_length" id="datatable_ajax_length">
                                        <label><span class="seperator">|</span>View
                                            <select name="datatable_ajax_length" aria-controls="datatable_ajax" class="form-control input-xsmall input-sm input-inline">
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                                <option value="150">150</option>
                                                <option value="-1">All</option>
                                            </select>
                                            records</label></div>
                                    <div class="dataTables_info" id="datatable_ajax_info" role="status" aria-live="polite"></div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="table-group-actions pull-right">
                                        <span></span>
                                        <select class="table-group-action-input form-control input-inline input-small input-sm">
                                            <option value="">Select...</option>
                                            <option value="Cancel">Available</option>
                                            <option value="Cancel">Unavailable</option>
                                            <option value="Cancel">Maintenance</option>
                                        </select>
                                        <button class="btn btn-sm yellow table-group-action-submit"><i class="fa fa-check"></i>Submit</button>
                                    </div>
                                </div>
                            </div>
                            <div class="table-scrollable">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="datatable_ajax" aria-describedby="datatable_ajax_info" role="grid">
                                    <thead>
                                        <tr role="row" class="heading">
                                            <th width="2%" class="sorting_disabled" rowspan="1" colspan="1">
                                                <div class="checker"><span>
                                                    <input type="checkbox" class="group-checkable"></span></div>
                                            </th>
                                            <th width="5%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Vehicle&nbsp;#
                                            </th>
                                            <th width="15%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Model
                                            </th>
                                            <th width="15%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Year
                                            </th>
                                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Registration number
                                            </th>
                                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Province
                                            </th>
                                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Mileage
                                            </th>
                                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Status
                                            </th>
                                            <th width="10%" class="sorting" tabindex="0" aria-controls="datatable_ajax" rowspan="1" colspan="1">Actions
                                            </th>
                                        </tr>
                                        <tr role="row" class="filter">
                                            <td rowspan="1" colspan="1"></td>
                                            <td rowspan="1" colspan="1">
                                                <input type="text" class="form-control form-filter input-sm" name="VehicleID">
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <input type="text" class="form-control form-filter input-sm" name="VehicleModel">
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
                                                    <input type="text" class="form-control form-filter input-sm" readonly="" name="order_date_from" placeholder="Year">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
                                                    </span>
                                                </div>

                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <input type="text" class="form-control form-filter input-sm" name="">
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <input type="text" class="form-control form-filter input-sm" name="Province">
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <input type="text" class="form-control form-filter input-sm" name="Mileage">
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <select name="order_status" class="form-control form-filter input-sm">
                                                    <option value="">Select...</option>
                                                    <option value="pending">Available</option>
                                                    <option value="closed">Unavailable</option>
                                                    <option value="hold">Maintenance</option>

                                                </select>
                                            </td>
                                            <td rowspan="1" colspan="1">
                                                <div class="margin-bottom-5">
                                                    <button class="btn btn-sm yellow filter-submit margin-bottom"><i class="fa fa-search"></i>Search</button>
                                                </div>
                                                <button class="btn btn-sm red filter-cancel"><i class="fa fa-times"></i>Reset</button>
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-sm-12">
                                    <div class="dataTables_paginate paging_bootstrap_extended">
                                        <div class="pagination-panel">Page <a href="#" class="btn btn-sm default prev disabled" title="Prev"><i class="fa fa-angle-left"></i></a>
                                            <input type="text" class="pagination-panel-input form-control input-mini input-inline input-sm" maxlenght="5" style="text-align: center; margin: 0 5px;"><a href="#" class="btn btn-sm default next disabled" title="Next"><i class="fa fa-angle-right"></i></a> of <span class="pagination-panel-total"></span></div>
                                    </div>
                                    <div class="dataTables_length">
                                        <label><span class="seperator">|</span>View
                                            <select name="datatable_ajax_length" aria-controls="datatable_ajax" class="form-control input-xsmall input-sm input-inline">
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                                <option value="150">150</option>
                                                <option value="-1">All</option>
                                            </select>
                                            records</label></div>
                                    <div class="dataTables_info"></div>
                                </div>
                                <div class="col-md-4 col-sm-12"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
    </div>
    <table class="spacedTable">
        <tbody>
            <tr>
                <th>Add Vehicle</th>
            </tr>
            <tr>
                <td>Vehicle Number:</td>
                <td>
                    <input type="text" /></td>
            </tr>
            <tr>
                <td>Vehicle Year:</td>
                <td>
                    <input type="date" /></td>
            </tr>
            <tr>
                <td>Vehicle Name/ Model:&emsp;</td>
                <td>
                    <select id="optVehicleMake">
                        <option value="1">Honda</option>
                        <option value="2">Toyota</option>
                        <option value="3">Isuzu</option>
                        <option value="4">Mitsubishi</option>
                    </select></td>
            </tr>
            <tr>
                <td>Registration Number:</td>
                <td>
                    <input type="text" /></td>
            </tr>
            <tr>
                <td>Province:</td>
                <td>
                    <input type="text" /></td>
            </tr>
            <tr>
                <td>Mileage:</td>
                <td>
                    <input type="text" /></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td>
                    <select id="optStatus">
                        <option value="1">Available</option>
                        <option value="2">Unavailable</option>
                        <option value="3">Maintenance</option>
                    </select></td>
            </tr>
            <tr>
                <td>Additional info:</td>

                <td>
                    <input type="text" />
                </td>
            </tr>
        </tbody>
    </table>


</asp:Content>
