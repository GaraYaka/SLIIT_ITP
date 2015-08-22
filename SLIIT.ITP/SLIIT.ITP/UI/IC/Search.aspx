<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SLIIT.ITP.UI.IC.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <form action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Search Item </h3>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Category</label>
															<select class="form-control">
																<option value="">Cat 1</option>
																<option value="">Cat 2</option>
                                                                <option value="">Cat 3</option>
															</select>
															<span class="help-block">
															Select Item category </span>
														</div>
													</div>

                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Search by</label>
															<select class="form-control">
																<option value="">Item code</option>
																<option value="">Item name</option>
                                                                
															</select>
															
														</div>
													</div>
                                                    </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                    <div class="form-group">
															<label class="control-label">Search</label>
															<input type="text" id="ItemName" class="form-control" placeholder="Search here">
                                                        <div class="form-actions left">
                                                           <button id="btnSearch" class="btn blue btn-block margin-top-20">SEARCH <i class="m-icon-swapright m-icon-white"></i></button>
                                                        </div>
                                                        
                                                       
														</div>
                                                        </div>
                                                   
                                                    

                                                    </div>

                                                </div>
       </form>

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
									<th>
										 #
									</th>
									<th>
										 Item Code
									</th>
									<th>
										 Item Category
									</th>
									<th>
										 Item Name
									</th>
									<th>
										 Unit Price
									</th>
                                    <th>
										 Availble Quantity
									</th>
                                   
								</tr>
								</thead>
								<tbody>
								<tr>
                                    
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>

                                            <div class="form-actions right">
												
												<button id="btnDone" type="submit" class="btn blue"><i class="fa fa-check"></i> Done</button>
											</div>
</asp:Content>
