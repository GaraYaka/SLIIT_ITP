<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PRCP_view.aspx.cs" Inherits="SLIIT.ITP.UI.PR.PRCP_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

   <script type="text/javascript">

       var up;

       function LoadGridData() {

           $.ajax({
               url: "../../Services/PRServices.asmx/GetRnRef",
               dataType: "json",
               contentType: "application/json; charset=utf-8",
               type: "POST",

               success: function (result) {

                   $("#CTable tbody").empty();
                   //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                   var table = document.getElementById("CTable").getElementsByTagName("tbody")[0];

                   for (var i = 0; i < result.d.length; i++)
                   {
                       var row = document.createElement("tr");
                       var col1 = document.createElement("td");
                       var col2 = document.createElement("td");
                       var col3 = document.createElement("td");
                       var col4 = document.createElement("td");
                       var col5 = document.createElement("td");
                       var col6 = document.createElement("td");
                       var col7 = document.createElement("td");

                       col1.innerHTML = result.d[i].RnRefv;
                       col2.innerHTML = result.d[i].Name;
                       col3.innerHTML = result.d[i].TPNO;
                       col4.innerHTML = result.d[i].AdrL1;
                       col5.innerHTML = result.d[i].AdrL2;
                       col6.innerHTML = result.d[i].Street;
                       col7.innerHTML = result.d[i].City;




                       row.appendChild(col1);
                       row.appendChild(col2);
                       row.appendChild(col3);
                       row.appendChild(col4);
                       row.appendChild(col5);
                       row.appendChild(col6);
                       row.appendChild(col7);

                       table.appendChild(row);

                       // document.getElementById("ItemTable").getElementsByTagName("tbody")[0];

                       row.onclick = function () {

                           up = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                           
                           document.getElementById("lblRef").value = up;
                           
                           alert(up);

                           
                       };
                   }



               }, error: function (request, status, error) {
                   alert("Error! Cannot Load Categorie.");
               }
           });
       }

       function update() {

           var qwe = document.getElementById("lblRef").value;
           
           location.href = '../../UI/PR/PRCP?' + qwe;

       }

       function Delete() {
           
           var qwe = document.getElementById("lblRef").value;
           var sendData = JSON.stringify({ RnRefv: qwe });

           $.ajax({
               url: "../../Services/PRServices.asmx/DeleteRow",
               dataType: "json",
               data: sendData,
               contentType: "application/json; charset=utf-8",
               type: "POST",

               
               
               success: function (result) {

                   
                   
                   alert("ok")


               }, error: function (request, status, error) {
                   alert("Error! Cannot Load Categorie.");
               }
           });

       }
       
       $(document).ready(function () {

           LoadGridData();

       });

       
       </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      
    <div >
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Contact View
							</div>
                            <label id="lblRef" class="control-label"></label>
							<div class="tools">
								<a title="" data-original-title="" href="javascript:;" class="collapse">
								</a>
								<a title="" data-original-title="" href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a title="" data-original-title="" href="javascript:;" class="reload">
								</a>
								<a title="" data-original-title="" href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table id="CTable" class="table table-hover">
								<thead>
								<tr>

									<th>
										 Refference ID
									</th>
									<th>
										 Name
									</th>
                                    <th>
										 Telephone
									</th>
									<th>
										 Adress L1
									</th>
									<th>
										 Adress L2
									</th>
									<th>
										 Street
									</th>
									<th>
										 City
									</th>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
								</table>
							</div>
             <button id="updateid" type="button" class="btn btn-primary" onclick="update();">Update Selected Contact</button>
             <button id="delete" type="button" class="btn btn-primary" onclick="Delete();">Delete Selected Contact</button>
						</div>

					</div>
					
				
					
    </div>

</asp:Content>