<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterDataEntry.aspx.cs" Inherits="SLIIT.ITP.UI.IC.MasterDataEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>
    <script type="text/javascript">

        function PassData()
        {
            location.href = '../../UI/IC/BinCard.aspx?' + document.getElementById("txtItemCode").value.trim();

        }

        function ValidateTxt()
        {
            var valtxtItemName = document.getElementbyId("txtItemName").value;
            var valtxtorder = document.getElementbyId("txtUnitP").value;
            if(valtxtItemName.length != 0 && valtxtorder.length != 0)
            {
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
            
            var txtItemCode = document.getElementById("txtItemCode").value.trim();
            var txtItemName = document.getElementById("txtItemName").value.trim();
             

            var txtorder = document.getElementById("txtUnitP").value.trim();
            //var txtQuantity = document.getElementById("txtQty").value;

            var e = document.getElementById("cmbCat");
            var Category = e.options[e.selectedIndex].value.trim();

            var sendData = JSON.stringify({ itemCode: txtItemCode, itemName: txtItemName, category: Category, reorderqty: txtorder });

            $.ajax({
                
                url: "../../Services/ICServices.asmx/SaveItem",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (result) {
                    
                    popHTMLContent = '<div class="alert alert-success"><strong>Success!</strong> The recored has been added.</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "",
                        closeButton: true,
                    });

                    

                }, error: function (request, status, error) {

                    popHTMLContent = '<div class="alert alert-danger"><strong>Error!</strong> Please fill the Customer Name & Phone No.</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Invalid details<small></small></h3>",
                        closeButton: true,
                    });
                }
            });
        }

        function UpdateItem() {
            var txtItemCode = document.getElementById("txtItemCode").value.trim();
            var txtItemName = document.getElementById("txtItemName").value.trim();

            var txtorder = document.getElementById("txtUnitP").value.trim();

            var RnID = document.getElementById("lblItemID").value.trim();

            var e = document.getElementById("cmbCat");
            var Category = e.options[e.selectedIndex].value.trim();

            var sendData = JSON.stringify({ RnItemID: RnID, itemCode: txtItemCode, itemName: txtItemName, category: Category, reorderqty: txtorder });

            $.ajax({

                url: "../../Services/ICServices.asmx/UpdateItem",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (result) {
                    alert("Successfully Added");
                    location.reload();

                }, error: function (request, status, error) {
                    alert("Error")
                }
            });
        }

        function LoadGridData() {

            $.ajax({
                url: "../../Services/ICServices.asmx/GetMasterData",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",

                success: function (result) {

                    $("#ItemTable tbody").empty();
                    //var table = '<table class="table table-hover"><thead><tr><td>Item Code</td><td>Item Name</td><td>Item Category</td><td>Re-Oreder Qty</td></tr></thead></table><tbody>';
                    var table = document.getElementById("ItemTable").getElementsByTagName("tbody")[0];

                    //document.getElementById("lblItemCode").innerText = parseInt(result.d[result.d.length - 1].RnItemID) + parseInt(1);

                    document.getElementById("txtItemCode").value = parseInt(result.d[result.d.length - 1].RnItemID) + parseInt(1);
                    for (var i = 0; i < result.d.length; i++)
                    {

                        

                        var row = document.createElement("tr");
                        var col1 = document.createElement("td");
                        var col2 = document.createElement("td");
                        var col3 = document.createElement("td");
                        var col4 = document.createElement("td");
                        var col5 = document.createElement("td");

                        col1.innerHTML = result.d[i].ItemCode;
                        col2.innerHTML = result.d[i].ItemName;
                        col3.innerHTML = result.d[i].ItemCategory;
                        col4.innerHTML = result.d[i].ReOrderQty;
                        col5.innerHTML = result.d[i].RnItemID;
                        col5.style.visibility = "hidden";

                        row.appendChild(col1);
                        row.appendChild(col2);
                        row.appendChild(col3);
                        row.appendChild(col4);
                        row.appendChild(col5);

                        table.appendChild(row);

                       // document.getElementById("ItemTable").getElementsByTagName("tbody")[0];

                        row.onclick = function () {


                            document.getElementById("txtItemCode").value = table.rows[this.rowIndex - 1].cells[0].innerHTML.trim();
                            document.getElementById("txtItemName").value = table.rows[this.rowIndex - 1].cells[1].innerHTML.trim();
                            document.getElementById("txtUnitP").value = table.rows[this.rowIndex - 1].cells[3].innerHTML.trim();
                            document.getElementById("lblItemID").value = table.rows[this.rowIndex - 1].cells[4].innerHTML.trim();
                            document.getElementById("cmbCat").value = table.rows[this.rowIndex - 1].cells[2].innerHTML.trim();

                            document.getElementById("lblItemID").style.visibility = "hidden";
                            document.getElementById("btnAdd").style.visibility = "hidden";

                            
                            

                            var html = "";
                            html += "<button id=btnUpdate type=button class=btn btn-success onclick=UpdateItem(); style=width: 56px;>Update</button>";


                            $('#btn').append(html);

                        };
                    }



                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
                }
            });


            $.ajax({
                url: "../../Services/ICServices.asmx/GetAllCategories",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                    var html = "";
                    html += "<select id=cmbCat class=form-control>";
                    for (var i = 0; i < result.d.length; i++) {


                        html += "<option value=" + result.d[i].RnCatID + ">" + result.d[i].CategoryName + "</option>";
                    }

                    html += "</select>";

                    $('#divCat').append(html);
                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
                }
            });



            $.ajax({
                url: "../../Services/ICServices.asmx/GetBinCard",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",

                success: function (result)
                {
                    var table = document.getElementById("ItemTable").getElementsByTagName("tbody")[0];

                    for (var i = 0; i < table.rows.length; i++)
                    {
                        var ItemCode = table.rows[i].cells[0].innerText;
                        //var Reorder = table.rows[i].cells[3].innerText;

                        for (var j = 0; j < result.d.length; j++)
                        {
                            
                            if(ItemCode.trim() == result.d[j].ItemCode.trim())
                            {
                                var Reorder = table.rows[i].cells[3].innerText;
                                var ItemName = table.rows[i].cells[1].innerText;
                                var cat = table.rows[i].cells[2].innerText;

                                if(result.d[j].Quantity <= Reorder.trim())
                                {
                                    popHTMLContent = '<div class="note note-warning"><h4 class="block">Some Items are running low</h4><p>' + ItemCode + ' --' + ItemName + '</p></div>';
                                    bootbox.dialog({
                                        message: popHTMLContent,
                                        title: "<h3 class='page-title'>Warning!<small></small></h3>",
                                        closeButton: true,
                                    });

                                    var row = table.rows[i];
                                    
                                    row.setAttribute("style", "background:#FF4D4D");
                                }
                            }
                            

                        }


                    }
                    
                    

                        
                    

                   
                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
                }
            });

        }


        function AddbinCard() {
            var txtItemCode = document.getElementById("txtItemCode").value;


            var sendData = JSON.stringify({ ItemCode: txtItemCode });

            $(document).ready(function () {


                $.ajax({
                    type: "POST",
                    url: "../../Services/ICServices.asmx/takeItem",
                    data: sendData,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (result) {
                        // show returned message in a pop up
                        alert(txtItemCode);
                        //location.href = "../../UI/IC/BinCard.aspx";
                    },
                    error: function (request, status, error) {
                        alert("Error! Cannot Load Categorie.");
                    }
                });

            });
        }

        $(document).ready(function () {

            document.getElementById("txtItemCode").readOnly = true;
            LoadGridData();
            
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
                <h3 class="form-section">Master Data </h3>
                <label id="lblItemCode" class="control-label"></label>
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
                            <div id="divCat"></div>
                            <%--<select id="cmbCat" class="form-control">
																<option value="">AutoMobile Items</option>
																<option value="">Hardware Items</option>
                                                                <option value="">Other</option>
															</select>--%>
                            <span class="help-block">Select Item category </span>
                        </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label">Re-Order Quantity</label>
                            <input type="text" id="txtUnitP" class="form-control" placeholder="">
                        </div>
                    </div>


                    <!--/span-->

                    <!--/span-->
                </div>
                <!--/row-->
            </div>
            <!--/row-->
            <div class="col-md-1">
                <div id="btnb" class="form-actions right">

                    <button id="btnBinCard" type="button" class="btn green-meadow" style="width: 80px" onclick="PassData();">Bin Card</button>
                </div>
            </div>

            <div id="btn" class="form-actions right">

                <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="InsertItem();">Add</button>
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
                <a href="javascript:;" class="collapse" data-original-title="" title=""></a>

            </div>
        </div>
        <div class="portlet-body">
            <div id="divTable">
                <table id="ItemTable" class="table table-hover">
                    <thead>
                        <tr>

                            <th style="height: 24px">Item Code
                            </th>
                            <th style="height: 24px">Item Name
                            </th>
                            <th style="height: 24px">Item Category
                            </th>

                            <th style="height: 24px">Re-Quantity
                            </th>
                            <th id="ID" style="height: 24px">
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="ReorderTB">

    </div>

</asp:Content>


