<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="po_view.aspx.cs" Inherits="SLIIT.ITP.UI.PR.po_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    

    <script type="text/javascript">

        var up;

        function LoadGridData() {

            $.ajax({
                url: "../../Services/PRServices.asmx/GetRnPO",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",

                success: function (result) {

                    $("#view_table tbody").empty();
                    //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                    var table = document.getElementById("view_table").getElementsByTagName("tbody")[0];

                    for (var i = 0; i < result.d.length; i++) {
                        var row = document.createElement("tr");
                        var col1 = document.createElement("td");
                        var col2 = document.createElement("td");
                        var col3 = document.createElement("td");
                        var col4 = document.createElement("td");
                        var col5 = document.createElement("td");
                        var col6 = document.createElement("td");
                        

                        col1.innerHTML = result.d[i].RnRFQ;
                        col2.innerHTML = result.d[i].Company;
                        col3.innerHTML = result.d[i].Date;
                        col4.innerHTML = result.d[i].RnBOQ;
                        col5.innerHTML = result.d[i].RnRefv;
                        col6.innerHTML = result.d[i].Remarks;
                        
                        row.appendChild(col1);
                        row.appendChild(col2);
                        row.appendChild(col3);
                        row.appendChild(col4);
                        row.appendChild(col5);
                        row.appendChild(col6);
                       


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

            location.href = '../../UI/PR/po?' + qwe;

        }

        function Delete() {

            var qwe = document.getElementById("lblRef").value;
            var sendData = JSON.stringify({ RnRFQ: qwe });

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


<div class="col-md-8">
        <span class="caption-subject font-green-sharp bold uppercase">Search PO</span>
        <br />  <br />
        <b>   Enter BOQ reference No </b> 
	<input id="Ref" class="form-control input-circle" placeholder="Reference No" type="text">
           
       <br />

        <button id="search" class="btn green">
            Search Payment
            </button>    <br /> <br />    <button id="update" class="btn blue">
            Update Selected Payment
            </button>  <button id="delete" class="btn red">
            Delete Selected Payment
            </button>
                        <br />
    <div class="portlet-body">
							<div class="table-scrollable">
								<table id="view_table" class="table table-hover">
								<thead>
								<tr>

									<th>
										 PO Ref No
									</th>
									<th>
										 BOQ Reference No
									</th>
                                    <th>
										 Contact Person's Ref No
									</th>
									<th>
										 Amount
									</th>
									<th>
										 Date
									</th>
                                   <th>
										 Status
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