<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterDataEntry.aspx.cs" Inherits="SLIIT.ITP.UI.IC.MasterDataEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">

        function btnAdd_Click()
        {
            
            var txtItemCode = $("#txtItemCode").val();
            var txtItemName = $("#txtItemName").val();
            var txtQty = $("#txtQty").val();
            var txtUnitP = $("#txtUnitP").val();
            var cmbCat = $("#cmbCat").val();

            var sendData = JSON.stringify({ ItemCode: txtItemCode, ItemName: txtItemName,Quantity:txtQty,UnitPrice:txtUnitP,Category:cmbCat });


            $.ajax({
                url: "../../Services/UserServices.asmx/AuthUser",
                dataType: "json",
                data : sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    window.location = "../../Default.aspx";
                }, error: function (request, status, error) {
                    $("#lblIncorrectCredentails").html("Incorrect Username or Password");
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
												<h3 class="form-section">Master Data </h3>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Code</label>
															<input type="text" id="txtItemCode" class="form-control" placeholder="">
															
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Name</label>
															<input type="text" id="txtItemName" class="form-control" placeholder="">
															
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Item Category</label>
															<select id="cmbCat" class="form-control">
																<option value="">Cat 1</option>
																<option value="">Cat 2</option>
                                                                <option value="">Cat 3</option>
															</select>
															<span class="help-block">
															Select Item category </span>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Unit Price</label>
															<input type="text" id="txtUnitP" class="form-control" placeholder=".00">
														</div>
													</div>
													

                                                     <!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Quantity</label>
															<input type="text" id="txtQty" class="form-control" placeholder="">
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												</div>
												<!--/row-->
                                               
												
											<div class="form-actions right">
												
												<button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="">Add</button>
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
									<th style="height: 24px">
										 #
									</th>
									<th style="height: 24px">
										 Item Code
									</th>
									<th style="height: 24px">
										 Item Category
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

                                            <div class="form-actions right">
												
												<button id="btnSave" type="submit" class="btn blue"><i class="fa fa-check"></i> Save</button>
											</div>
</asp:Content>

    
