<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerReturns.aspx.cs" Inherits="SLIIT.ITP.UI.IC.CustomerReturns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <div class="portlet-body form" style="display: block;">
										<!-- BEGIN FORM-->
										<form action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Customer Returns </h3>
												
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Category</label>
															<select id="category" class="form-control">
																<option value="">Cat 1</option>
																<option value="">Cat 2</option>
                                                                <option value="">Cat 3</option>
															</select>
															
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Issue Code</label>
															<input type="text" id="txtUnitP" class="form-control" placeholder="Enter here">
                                                            <button type="button" class="btn blue k-align-right"><i class="fa fa-search"></i></button>
															</a>
														</div>
													</div>
													

												</div>
												<!--/row-->
												</div>
												<!--/row-->
                                               
												
										
										</form>
										<!-- END FORM-->
        </div>

     <div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Item Table
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
							<div class="table-scrollable">
								<table class="table table-hover">
								<thead>
								<tr>
									<th style="height: 24px">
										 Issue Code
									</th>
									<th style="height: 24px">
										 Item Code
									</th>
									
									<th style="height: 24px">
										 Item Name
									</th>
									<th style="height: 24px">
										 Unit Price
									</th>
                                    <th style="height: 24px">
										 Quantity
									</th>
                                    <th style="height: 24px">
										 Total Price
									</th>
								</tr>
								</thead>
								<tbody>
								</tbody>
								</table>
							</div>
						</div>
					</div>

                                            

     <div class="portlet-body form" style="display: block;">
										<!-- BEGIN FORM-->
										<form action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Return Item </h3>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Code</label>
															<input type="text" id="ItemCode" class="form-control" placeholder="">
															
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Name</label>
															<input type="text" id="ItemName" class="form-control" placeholder="">
															
														</div>
													</div>
													<!--/span-->
                                                    
												</div>
												<!--/row-->
												<div class="row">
													
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Stock Quantity</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
													

                                                     <!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Unit Price</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
                                                <div class="row">
													
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Issue Quantity</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
													

                                                     <!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Issue Price</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
													<!--/span-->
												</div>
                                                <!--row-->
                                                <div class="row">
													
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Return Quantity</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
                                                    </div>
												</div>
												<!--/row-->
                                            <div class="form-actions right">
												
												<button id="btnReturn" type="submit" class="btn blue"><i class="fa fa-check"></i> Return</button>
											</div>
                                               
										</form>
										<!-- END FORM-->
									</div>
</asp:Content>
