<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BinCard.aspx.cs" Inherits="SLIIT.ITP.UI.IC.BinCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>
    <script type="text/javascript">

        function getItemCode(){


            
            var queryDect = {}
            queryDect = location.search.substr(1).split("?");

            //alert()
               

            document.getElementById("txtItemCode").value = queryDect[0];

            
        }

        
            function getCategory(){
                $.ajax({
                    url: "../../Services/ICServices.asmx/GetAllCategories",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    success: function (result) {
                        var html = "";
                        html += "<select id=cmbCat class=form-control onchange=DropSearch();>";
                        html += "<option value=>-Select Category-</option>";
                        
                        for (var i = 0; i < result.d.length; i++) {


                            html += "<option value=" + result.d[i].RnCatID + ">" + result.d[i].CategoryName + "</option>";
                        }

                        html += "</select>";

                        $('#divCat').append(html);
                    }, error: function (request, status, error) {
                        alert("Error! Cannot Load Categorie.");
                    }
                });
           
        }

            $(document).ready(function () {

                

                getItemCode();

                var tet = document.getElementById("txtItemCode").value;

                

                if (tet.length !=0)
                {
                    document.getElementById("txtItemCode").readOnly = true;

                }
                else
                {
                    document.getElementById("txtItemCode").readOnly = false;
                }

                
            
            document.getElementById("txtQuantity").style.visibility = "hidden";
            document.getElementById("btnUpdate").style.visibility = "hidden";
            
            getCategory();
            GetData();
        });


        function GetData()
        {
            $(document).ready(function () {
                $.ajax({
                    url: "../../Services/ICServices.asmx/GetBinCard",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",

                    success: function (result) {

                        $("#BinCardTB tbody").empty();
                        //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                        var table = document.getElementById("BinCardTB").getElementsByTagName("tbody")[0];

                        for (var i = 0; i < result.d.length; i++)
                        {
                            var row = document.createElement("tr");
                            var col1 = document.createElement("td");
                            var col2 = document.createElement("td");
                            var col3 = document.createElement("td");
                            var col4 = document.createElement("td");
                            var col5 = document.createElement("td");
                            var col6 = document.createElement("td");

                            //if (result.d[i].RnCatID == 1) {
                            //    var cat = "AutoMobile Items";
                            //}
                            //else if (result.d[i].RnCatID == 2) {
                            //    var cat = "Hardware Items";
                            //}
                            //else {
                            //    var cat = "Other";
                            //}

                            col1.innerHTML = result.d[i].ItemCode;
                            col2.innerHTML = result.d[i].Unit;
                            col3.innerHTML = result.d[i].UnitPrice;
                            col4.innerHTML = result.d[i].Quantity;
                            col5.innerHTML = result.d[i].RnCatID;
                            col6.innerHTML = result.d[i].RnBinCardID;

                            row.appendChild(col1);
                            row.appendChild(col2);
                            row.appendChild(col3);
                            row.appendChild(col4);
                            row.appendChild(col5);
                            row.appendChild(col6);

                            table.appendChild(row);

                            col6.style.visibility = "hidden";

                            row.onclick = function () {


                                //alert();

                                document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                                document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                                document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                                document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();
                                document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();
                                
                                document.getElementById("lblRnBin").value = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();
                                
                                document.getElementById("btnAdd").style.visibility = "hidden";
                                document.getElementById("btnUpdate").style.visibility = "visible";
                                document.getElementById("txtQuantity").style.visibility = "visible";
                                
                                
                                //var html = "";
                                //html += "<button id=btnAdd type=button class=btn btn-success onclick=InsertItem(); style=width: 56px;>Update</button>";


                                //$('#btn').append(html);

                            };
                        }



                    }, error: function (request, status, error) {
                        alert("Error! Cannot Load Categorie.");
                    }
                });
            });
        }


        function DropSearch()
        {
            $(document).ready(function () {
                $.ajax({
                    url: "../../Services/ICServices.asmx/GetBinCard",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",

                    
                    success: function (result) {

                        $("#BinCardTB tbody").empty();
                        //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                        var table = document.getElementById("BinCardTB").getElementsByTagName("tbody")[0];

                        var e = document.getElementById("cmbCat");
                        var Category = e.options[e.selectedIndex].value;

                        if (Category == "")
                        {
                            GetData();
                        }
                        

                        for (var i = 0; i < result.d.length; i++) {

                            
                            if (Category.trim() == result.d[i].RnCatID) {
                                var row = document.createElement("tr");
                                var col1 = document.createElement("td");
                                var col2 = document.createElement("td");
                                var col3 = document.createElement("td");
                                var col4 = document.createElement("td");
                                var col5 = document.createElement("td");
                                var col6 = document.createElement("td");

                                //if (result.d[i].RnCatID == 1) {
                                //    var cat = "AutoMobile Items";
                                //}
                                //else if (result.d[i].RnCatID == 2) {
                                //    var cat = "Hardware Items";
                                //}
                                //else {
                                //    var cat = "Other";
                                //}

                                col1.innerHTML = result.d[i].ItemCode;
                                col2.innerHTML = result.d[i].Unit;
                                col3.innerHTML = result.d[i].UnitPrice;
                                col4.innerHTML = result.d[i].Quantity;
                                col5.innerHTML = result.d[i].RnCatID;
                                col6.innerHTML = result.d[i].RnBinCardID;

                                row.appendChild(col1);
                                row.appendChild(col2);
                                row.appendChild(col3);
                                row.appendChild(col4);
                                row.appendChild(col5);
                                row.appendChild(col6);

                                table.appendChild(row);

                                col6.style.visibility = "hidden";

                                row.onclick = function () {


                                    //alert();

                                    document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                                    document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                                    document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                                    document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();
                                    document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();
                                    document.getElementById("lblRnBin").value = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();

                                    document.getElementById("btnAdd").style.visibility = "hidden";
                                    document.getElementById("btnUpdate").style.visibility = "visible";
                                    document.getElementById("txtQuantity").style.visibility = "visible";


                                    //var html = "";
                                    //html += "<button id=btnAdd type=button class=btn btn-success onclick=InsertItem(); style=width: 56px;>Update</button>";


                                    //$('#btn').append(html);

                                };


                            }
                        }

                    }, error: function (request, status, error) {
                        alert("Error! Cannot Load Categorie.");
                    }
                });
            });
        }

       
        function textsearch() {


            var txtItem = document.getElementById("txtItemCode").value;
            // var sendData = JSON.stringify({ RnCatID: Category });

            $.ajax({
                type: "POST",
                url: "../../Services/ICServices.asmx/GetBinCard",
                //data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    $("#BinCardTB tbody").empty();

                    for (var i = 0; i < result.d.length; i++) {
                        
                       

                        if (result.d[i].ItemCode.trim() == txtItem.trim())
                        {

                            
                            var table = document.getElementById("BinCardTB").getElementsByTagName("tbody")[0];

                            var row = document.createElement("tr");
                            var col1 = document.createElement("td");
                            var col2 = document.createElement("td");
                            var col3 = document.createElement("td");
                            var col4 = document.createElement("td");
                            var col5 = document.createElement("td");
                            var col6 = document.createElement("td");

                            //if (result.d[i].RnCatID == 1) {
                            //    var cat = "AutoMobile Items";
                            //}
                            //else if (result.d[i].RnCatID == 2) {
                            //    var cat = "Hardware Items";
                            //}
                            //else {
                            //    var cat = "Other";
                            //}

                            col1.innerHTML = result.d[i].ItemCode;
                            col2.innerHTML = result.d[i].Unit;
                            col3.innerHTML = result.d[i].UnitPrice;
                            col4.innerHTML = result.d[i].Quantity;
                            col5.innerHTML = result.d[i].RnCatID;
                            col6.innerHTML = result.d[i].RnBinCardID;

                            row.appendChild(col1);
                            row.appendChild(col2);
                            row.appendChild(col3);
                            row.appendChild(col4);
                            row.appendChild(col5);
                            row.appendChild(col6);

                            table.appendChild(row);

                            col6.style.visibility = "hidden";

                            row.onclick = function () {


                                //alert();

                                document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                                document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                                document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                                document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();
                                document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();
                                document.getElementById("lblRnBin").value = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();

                                document.getElementById("btnAdd").style.visibility = "hidden";
                                document.getElementById("btnUpdate").style.visibility = "visible";
                                document.getElementById("txtQuantity").style.visibility = "visible";
                                
                            };
                        }

                    }


                }, error: function (request, status, error) {
                    alert("Error")
                }
            });

        }

        function ValidateTxt() {
            var valtxtItemCode = document.getElementById("txtItemCode").value;
            var valtxtUnit = document.getElementById("txtUnit").value;
            var valtxtUprice = document.getElementById("txtUnitPrice").value;
            var valtxtNewQuantity = document.getElementById("txtNewQty").value;
            if (valtxtItemName.length != 0 && valtxtorder.length != 0) {
                InsertItem();
            }
            else
                popHTMLContent = '<div class="alert alert-danger"><strong>Error!</strong> Please fill the required fields </div>'
            bootbox.dialog({
                message: popHTMLContent,
                title: "<h3 class ='page-title'>Invalid  details<small></small></h3>",
                closeButton: true,

            });
        }

        function InsertItem()
        {
            var txtItemCode = document.getElementById("txtItemCode").value;
            //var txtStock = document.getElementById("txtQuantity").value;
            var txtUnit = document.getElementById("txtUnit").value;
            var txtUprice = document.getElementById("txtUnitPrice").value;
            var txtNewQuantity = document.getElementById("txtNewQty").value;

            var e = document.getElementById("cmbCat");
            var Category = e.options[e.selectedIndex].value;
           
            

            var sendData = JSON.stringify({ itemCode: txtItemCode, Unit: txtUnit, UnitPrice: txtUprice, Quantity: txtNewQuantity, RnCatID: Category });

            $.ajax({
                type: "POST",
                url: "../../Services/ICServices.asmx/AddtoBinCard",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert("Successfully Added");
                    popHTMLContent = '<div id="grdItemsModal" style="">Sucessfully Logged</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Successfully Added<small></small></h3>",
                        closeButton: true,
                    });
                    location.reload();
                }, error: function (request, status, error) {
                    alert("Error")
                }
            });
        }

        function UpdateItem()
        {
            var txtItemCode = document.getElementById("txtItemCode").value.trim();
            var txtStock = document.getElementById("txtQuantity").value.trim();
            var txtUnit = document.getElementById("txtUnit").value.trim();
            var txtUprice = document.getElementById("txtUnitPrice").value.trim();
            var txtNewQuantity = document.getElementById("txtNewQty").value.trim();

            var e = document.getElementById("cmbCat");
            var Category = e.options[e.selectedIndex].value.trim();

            var RnbinID = document.getElementById("lblRnBin").value.trim();

            var order = parseFloat(txtStock) + parseFloat(txtNewQuantity);
            
            

            var sendData = JSON.stringify({ RnBinCardID: RnbinID, ItemCode: txtItemCode, Unit: txtUnit, UnitPrice: txtUprice, Quantity: order, RnCatID: Category });

            $.ajax({
                type: "POST",
                url: "../../Services/ICServices.asmx/UpdateBinItem",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    //alert("Successfully Updated");
                    popHTMLContent = '<div id="grdItemsModal" style="">Sucessfully</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Successfully Updated<small></small></h3>",
                        closeButton: true,
                    });
                    location.reload();
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

     <div class="portlet-body form" style="display: block;">
										<!-- BEGIN FORM-->
										<form id="Master" action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Bin Card</h3>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
                                                            <label id ="lblRnBin" class="control-label"></label>
															<label class="control-label">Item Category</label>
                                                            <div id="divCat"></div>
                                                        </div>
													</div>
													<!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
															<label class="control-label">Item Code</label>
															<input type="text" id="txtItemCode" class="form-control" placeholder="" onchange="textSearch();">
															 
                                                            <button id="btnSrch" type="button" class="btn btn-primary" style="width: 50px" onclick="textsearch();"><i class="fa fa-search"></i></button>
                                                            
														</div>
                                                     	<!--/span-->
                                                       
												</div>
                                                    </div>
                                                    
												<!--/row-->

												<div class="row">
                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Stock Quantity</label>
															<input type="text" id="txtQuantity" class="form-control" placeholder="">
															
														</div>
													</div>
                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Unit</label>
															<input type="text" id="txtUnit" class="form-control" placeholder="">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Unit Price</label>
															<input type="text" id="txtUnitPrice" class="form-control" placeholder="">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">New Quantity</label>
															<input type="text" id="txtNewQty" class="form-control" placeholder="">
														</div>
													</div>
													

                                                     <!--/span-->
													
													<!--/span-->
												</div>
												<!--/row-->
												</div>
												<!--/row-->
                                               
												
											<div id="btn" class="form-actions right">
												
                                                    <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="InsertItem();">Add</button>
                                                    <button id="btnUpdate" type="button" class="btn btn-primary" style="width: 70px" onclick="UpdateItem();">Update</button>
												
												</div>
                                                    
												     
											

                                            
												
			                                    
	                                       
										</form>
										<!-- END FORM-->
									</div>

    


    <div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Bin Card Table
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse" data-original-title="" title="">
								</a>
								
							</div>
						</div>
						<div class="portlet-body">
							<div id="divTable">
								<table id ="BinCardTB" class="table table-hover">
								<thead>
								<tr>
									
									<th style="height: 24px">
										 Item Code
									</th>
									<th style="height: 24px">
										 Unit
									</th>
									<th style="height: 24px">
										 Unit Price
									</th>
									
                                    <th style="height: 24px">
										 Quantity
									</th>
                                     <th style="height: 24px">
										 Category
									</th>
                                     <th style="height: 24px">
										 
									</th>
                                    
								</tr>
								</thead>
								<tbody>
								</tbody>
								</table>
							</div>
						</div>
					</div>
</asp:Content>
