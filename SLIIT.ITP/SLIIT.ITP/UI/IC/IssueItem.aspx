<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueItem.aspx.cs" Inherits="SLIIT.ITP.UI.IC.IssueItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">
    function InsertItem()
    {
        var txtItemCode =  document.getElementById("ItemCode").val();
        var txtItemName =  document.getElementById("ItemName").val();

        var sendData = JSON.stringify({ itemCode: txtItemCode, itemName: txtItemName });

        $.ajax({
            url: "../../Services/ICServices.asmx/Insert",
            dataType: "json",
            data: sendData,
            contentType: "application/json; charset=utf-8",
            type: "POST",
            success: function (result) {


            }, error: function (request, status, error) {
                
            }
        });


    }
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet-body form" style="display: block;">
										<!-- BEGIN FORM-->
										<form action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Issue Item </h3>
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
                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Category</label>
															<input type="text" id="ItemCat" class="form-control" placeholder="">
															
														</div>
													</div>
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
															<label class="control-label">Availble Quantity</label>
															<input type="text" class="form-control" placeholder="">
														</div>
													</div>
                                                    </div>
												</div>
												<!--/row-->
                                               
												
											<div class="form-actions right">
												
												<button id="btnAdd" type="button" class="btn btn-primary">Add</button>
											</div>
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
										 Quantity
									</th>
                                    <th>
										 Total Price
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
												
												<button id ="btnIssue" type="submit" class="btn blue"><i class="fa fa-check"></i> Issue Item</button>
											</div>
</asp:Content>
