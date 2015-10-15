<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SLIIT.ITP.UI.IC.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">

        function GetData() {
            $(document).ready(function () {
                $.ajax({
                    url: "../../Services/ICServices.asmx/GetIssueData",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",

                    success: function (result) {

                        $("#IssueTB tbody").empty();
                        //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                        var table = document.getElementById("IssueTB").getElementsByTagName("tbody")[0];

                        for (var i = 0; i < result.d.length; i++) {
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

                            col1.innerHTML = result.d[i].RnIssueID;
                            col2.innerHTML = result.d[i].ItemCode;
                            col3.innerHTML = result.d[i].IssuePrice;
                            col4.innerHTML = result.d[i].IssueQty;
                            col5.innerHTML = result.d[i].Cemail;
                            col6.innerHTML = result.d[i].InvoiceNum;

                            row.appendChild(col1);
                            row.appendChild(col2);
                            row.appendChild(col3);
                            row.appendChild(col4);
                            row.appendChild(col5);
                            row.appendChild(col6);

                            table.appendChild(row);

                           // col6.style.visibility = "hidden";

                            //row.onclick = function () {


                            //    //alert();

                            //    document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                            //    document.getElementById("txtQuantity").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                            //    document.getElementById("txtUnit").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                            //    document.getElementById("txtUnitPrice").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();
                            //    document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();

                            //    document.getElementById("lblRnBin").value = table.rows[this.rowIndex - 1].cells[5].innerHTML.trim();

                            //    document.getElementById("btnAdd").style.visibility = "hidden";
                            //    document.getElementById("btnUpdate").style.visibility = "visible";
                            //    document.getElementById("txtQuantity").style.visibility = "visible";


                            //    //var html = "";
                            //    //html += "<button id=btnAdd type=button class=btn btn-success onclick=InsertItem(); style=width: 56px;>Update</button>";


                            //    //$('#btn').append(html);

                            //};
                        }



                    }, error: function (request, status, error) {
                        alert("Error! Cannot Load Categorie.");
                    }
                });
            });
        }

        function printDiv() {

            var divElements = document.getElementById("divToPrint").innerHTML;

            var oldPage = document.body.innerHTML;


            document.body.innerHTML =
              "<html><head><title></title></head><body>" +
              divElements + "</body>";


            window.print();


            document.body.innerHTML = oldPage;


        }

        $(document).ready(function () {
            GetData();
        });

        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     

    <div id="divToPrint">

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
								<table id ="IssueTB" class="table table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 Item Code
									</th>
									<th>
										 Issue Price
									</th>
									<th>
										 Issue Quantity
									</th>
									<th>
										 Customer 
									</th>
                                    <th>
										 Invoice No
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

                                            <a class="btn btn-lg blue hidden-print margin-bottom-5" onclick="javascript:printDiv();">
						Print <i class="fa fa-print"></i>
						</a>
						
</asp:Content>
