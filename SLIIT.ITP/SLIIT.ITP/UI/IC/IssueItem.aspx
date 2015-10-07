<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IssueItem.aspx.cs" Inherits="SLIIT.ITP.UI.IC.IssueItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">

        var IssTable = [];

        function PassData() {
            SaveIssue();
            location.href = '../../UI/IC/PrintInvoice.aspx?' + document.getElementById("txtEmail").value.trim() + "?" + document.getElementById("lblInvID").innerHTML;

        }



        function BtnAdd() {
            InsertItem();
            UpdateItem();

            document.getElementById("txtIssueQty").value = "";
            document.getElementById("txtIssuePrice").value = "";
            //location.reload();
        }
    function InsertItem()
    {
        var txtItemCode = document.getElementById("txtItemCode").value;
        var txtQuantity = document.getElementById("txtQuantity").value;
        var txtUnit = document.getElementById("txtUnit").value;
        var txtIssueQty = document.getElementById("txtIssueQty").value;
        var txtUnitPrice = document.getElementById("txtUnitPrice").value;
        var RnBinID = document.getElementById("lblRnBinId").innerHTML;
        var IssuePrice = document.getElementById("txtIssuePrice").value;
        var Email = document.getElementById("txtEmail").value;
        var invoice = document.getElementById("lblInvID").innerHTML;

        //alert(invoice);

        var e = document.getElementById("cmbCat");
        var Category = e.options[e.selectedIndex].value.trim();
        

        

        IssTable.push({


            ItemCode: txtItemCode,
            IssuePrice: IssuePrice,
            IssueQty: txtIssueQty,
            RnCatID: Category,
            
            RnBinCardID: RnBinID,
            Cemail: Email,
            InvoiceNum: invoice

        });
        
    }

    function SaveIssue() {


        for (var i = 0; i < IssTable.length; i++)
        {

            //alert(Issuetable[i].ItemCode);


            var sendData = JSON.stringify({ ItemCode: IssTable[i].ItemCode, IssuePrice: IssTable[i].IssuePrice, IssueQty: IssTable[i].IssueQty, RnCatID: IssTable[i].RnCatID, RnBinCardID: IssTable[i].RnBinCardID, Cemail: IssTable[i].Cemail, InvoiceNum: IssTable[i].InvoiceNum });

            $.ajax({
                url: "../../Services/ICServices.asmx/IssueItem",
                dataType: "json",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    alert("done");

                }, error: function (request, status, error) {
                    alert("error");
                }
            });
        }
    }
    function UpdateItem()
    {
        var txtItemCode = document.getElementById("txtItemCode").value;
        var txtQuantity = document.getElementById("txtQuantity").value;
        var txtUnit = document.getElementById("txtUnit").value;
        var txtIssueQty = document.getElementById("txtIssueQty").value;
        var txtUnitPrice = document.getElementById("txtUnitPrice").value;
        var RnBinID = document.getElementById("lblRnBinId").innerHTML;

        var e = document.getElementById("cmbCat");
        var Category = e.options[e.selectedIndex].value.trim();

        var order = parseFloat(txtQuantity) - parseFloat(txtIssueQty);

        var sendData = JSON.stringify({ RnBinCardID: RnBinID, ItemCode: txtItemCode, Unit: txtUnit, UnitPrice: txtUnitPrice, Quantity: order, RnCatID: Category });

        $.ajax({
            type: "POST",
            url: "../../Services/ICServices.asmx/UpdateBinItem",
            data: sendData,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                alert("Successfully Updated");
                //popHTMLContent = '<div id="grdItemsModal" style="">Sucessfully</div>';
                //bootbox.dialog({
                //    message: popHTMLContent,
                //    title: "<h3 class='page-title'>Successfully Updated<small></small></h3>",
                //    closeButton: true,
                //});
                //location.reload();
            }, error: function (request, status, error) {
                alert("Error")
            }
        });
    }

    function GetData() {
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

                        //col6.style.visibility = "hidden";

                        row.onclick = function () {


                            //alert();

                            document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                            document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                            document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                            document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();

                            

                            document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();

                            document.getElementById("lblRnBinId").innerText = table.rows[this.rowIndex - 1].cells[5].innerHTML;
                            

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

    function GetCategory()
    {
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

                        //col6.style.visibility = "hidden";

                        row.onclick = function () {


                            //alert();

                            document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                            document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                            document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                            document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();

                            

                            document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();
                            document.getElementById("lblRnBinId").innerText = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();

                           // document.getElementById("btnAdd").style.visibility = "hidden";
                            //document.getElementById("btnUpdate").style.visibility = "visible";
                            //document.getElementById("txtQuantity").style.visibility = "visible";

                        };
                    }

                }


            }, error: function (request, status, error) {
                alert("Error")
            }
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

                    if (Category == "") {
                        GetData();
                    }

                    for (var i = 0; i < result.d.length; i++) {

                        if (Category.trim() == result.d[i].RnCatID)
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

                            //alert(col6.innerHTML);

                            row.appendChild(col1);
                            row.appendChild(col2);
                            row.appendChild(col3);
                            row.appendChild(col4);
                            row.appendChild(col5);
                            row.appendChild(col6);

                            table.appendChild(row);

                            //col6.style.visibility = "hidden";



                            row.onclick = function () {


                                //alert();

                                document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                                document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                                document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                                document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();




                                document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();




                                document.getElementById("lblRnBinId").innerText = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();

                                //document.getElementById("btnAdd").style.visibility = "hidden";
                                //document.getElementById("btnUpdate").style.visibility = "visible";
                                //document.getElementById("txtQuantity").style.visibility = "visible";


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


    function GetInvoice()
    {
        $.ajax({
            url: "../../Services/ICServices.asmx/GetIssueData",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            type: "POST",
            success: function (result) {

                //for (var i = 0; i < result.d.length; i++) {

                    //alert(result.d[result.d.length - 1].InvoiceNum);
                    if (result.d[result.d.length - 1].InvoiceNum == null)
                    {
                        var inNum = 1;
                    }
                    else {
                        var str = result.d[result.d.length - 1].InvoiceNum.split('_');
                        //alert(str[0]);
                        var inNum = parseInt(str[1]) + parseInt(1);
                    }


                //}

                var Invoice = "ME-00_" + inNum;

                //var putInvoice = "<label id=inID class=control-label>" + Invoice + "</label>";
                document.getElementById("lblInvID").innerText = Invoice;

               // $('#lblInvoiceID').append(putInvoice);
                document.getElementById("lblInvID").style.visibility = "hidden";
                 //alert(Invoice);
                //document.getElementById("lblInvID").value = Invoice;

            }, error: function (request, status, error) {
                alert("Error! Cannot Load Categorie.");
            }
        });
    }

    function genReport() {

        location.href = "../../UI/IC/Report.aspx"
    }

    $(document).ready(function () {

        GetInvoice();
        GetCategory();
        GetData();
        document.getElementById("lblRnBinId").style.visibility = "hidden";
    });

    
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <div class="portlet-body form" style="display: block;">
										<!-- BEGIN FORM-->
										<form id="Master" action="#" class="horizontal-form">
											<div class="form-body">
												<h3 class="form-section">Issue Item</h3>
                                                <div id="lblInvoiceID"><label id="lblInvID" class="control-label"></label>
                                                    <label id="lblRnBinId" class="control-label"></label>
                                                </div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
                                                            
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
															<label class="control-label">Issue Quantity</label>
															<input type="text" id="txtIssueQty" class="form-control" placeholder="">
														</div>
														
													</div>
													<div class="col-md-6">
                                                        <div class="form-group">
															<label class="control-label">Unit</label>
															<input type="text" id="txtUnit" class="form-control" placeholder="">
														</div>
														
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Unit Price</label>
															<input type="text" id="txtUnitPrice" class="form-control" placeholder="">
														</div>
													</div>
													

                                                     <!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Issue Price</label>
															<input type="text" id="txtIssuePrice" class="form-control" placeholder="">
														</div>
													</div>
													<!--/span-->
                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Customer Email</label>
															<input type="text" id="txtEmail" class="form-control" placeholder="">
														</div>
													</div>
												</div>
												<!--/row-->
												</div>
												<!--/row-->
                                               <div class="col-md-1">
                <div id="btnb" class="form-actions right">

                    <button id="btnBinCard" type="button" class="btn green-meadow" style="width: 120px" onclick="PassData();">Print Invoice</button>

                    <div class="form-actions right">
                        <button type="button" class="btn btn-info" onclick="genReport();">Generate Reports</button>
                    </div>

                    
                </div>
            </div>
											<div class="form-actions right">
												
                                                 <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="BtnAdd();">Add</button>

                                                
											</div>	
											
                                            
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
