<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewComplaints.aspx.cs" Inherits="SLIIT.ITP.UI.CM.ViewComplaints" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-edit"></i>Complaints
								</div>
								<div class="tools">
									<a href="javascript:;" class="collapse" data-original-title="" title="">
									</a>
									<a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title="">
									</a>
									<a href="javascript:;" class="reload" data-original-title="" title="">
									</a>
									<a href="javascript:;" class="remove" data-original-title="" title="">
									</a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-toolbar">
									<div class="row">
										
										
									</div>
								</div>
								<div id="sample_editable_1_wrapper" class="dataTables_wrapper no-footer"><div class="table-scrollable"><table class="table table-striped table-hover table-bordered dataTable no-footer" id="sample_editable_1" role="grid" aria-describedby="sample_editable_1_info" style="width: 981px;">
								<thead>
								<tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 ComplaintID
									: activate to sort column ascending" style="width: 60px;" aria-sort="ascending">
										 Complaint ID
									</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 Customer Name
									: activate to sort column ascending" style="width: 208px;">
										 Customer Name
									</th>
                                    
                                    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 Complaint Type
									: activate to sort column ascending" style="width: 111px;">
										 Complaint Status
									</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 Complaint info
									: activate to sort column ascending" style="width: 144px;">
										 Complaint info
									</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 Edit
									: activate to sort column ascending" style="width: 78px;">
										 Edit
									</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" aria-label="
										 Delete
									: activate to sort column ascending" style="width: 114px;">
										 Delete
									</th></tr>
								</thead>
								<tbody>
								
								
								
								
								
								
								<tr role="row" class="odd">
									<td class="sorting_1">1</td>
									<td>Test name</td>
									<td><select name="Complaint_status" class="form-control form-filter input-sm">
                                                    <option value="">Select..</option>
                                                    <option value="pending">Pending</option>
                                                    <option value="closed">Resolved</option>
                                                    <option value="hold">Cancelled</option>

                                                </select></td>
									<td class="center">Complaint info goes here</td>
									<td><a class="edit" href="">Edit</a></td>
									<td><a class="delete" href="">Delete</a></td>
								</tr>
									</td>
								</tr></tbody>
								</table></div><div class="row"><div class="col-md-5 col-sm-5"><div class="dataTables_info" id="sample_editable_1_info" role="status" aria-live="polite">Showing 1 to 6 of 6 entries</div></div><div class="col-md-7 col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="sample_editable_1_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="sample_editable_1" tabindex="0" id="sample_editable_1_previous"><a href="#"><i class="fa fa-angle-left"></i></a></li><li class="paginate_button active" aria-controls="sample_editable_1" tabindex="0"><a href="#">1</a></li><li class="paginate_button next disabled" aria-controls="sample_editable_1" tabindex="0" id="sample_editable_1_next"><a href="#"><i class="fa fa-angle-right"></i></a></li></ul></div></div></div></div>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>

</asp:Content>
