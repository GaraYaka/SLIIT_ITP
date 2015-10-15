<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrintInvoice.aspx.cs" Inherits="SLIIT.ITP.UI.IC.PrintInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>
    <script type="text/javascript">

        function phonenumber(inputtxt)  
        {  
            var phoneno = /^\d{10}$/;  
            if(inputtxt.match(phoneno))
            {  
                return true;  
            }  
            else  
            {  
                //("Invalid phone No");  
                return false;  
            }  
        } 


        function btnAddClick()
        {
           var RCnm = document.getElementById("txtCSName").value; 
            var RSTP = document.getElementById("txtPhone").value;
            

            var Rtp = phonenumber(document.getElementById("txtPhone").value);

            if(Rtp == true && RCnm.length != 0)
            {
                
                textsearch();
            }
            else
            {
                

                popHTMLContent = '<div class="alert alert-danger"><strong>Error!</strong> Please fill the Customer Name & Phone No.</div>';
                bootbox.dialog({
                    message: popHTMLContent,
                    title: "<h3 class='page-title'>Invalid details<small></small></h3>",
                    closeButton: true,
                });
            }

            
        }



        function getEmail() {



            var queryDect = {}
            queryDect = location.search.substr(1).split("?");

            //alert()


            document.getElementById("txtCSEmail").value = queryDect[0];


            
            var putInvoice = "<label id=inID class=control-label>" + queryDect[1] + "</label>";


            $('#lblInvoiceID').append(putInvoice);
            document.getElementById("inID").style.visibility = "hidden";

            

        }



        function textsearch() {

            $("#InvoiceTB tbody").empty();
            $("#CustomerName").empty();
            $("#phone").empty();
            $("#email").empty();
            $("#divtotal").empty();
            


            // var sendData = JSON.stringify({ RnCatID: Category });
            var Issuetable = [];
            var Invoice = document.getElementById("inID").innerHTML;
            $.ajax({
                type: "POST",
                url: "../../Services/ICServices.asmx/GetIssueData",
                //data: sendData,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {

                    for (var i = 0; i < result.d.length; i++)
                    {


                        //alert(result.d[i].InvoiceNum);
                        if (Invoice.trim() == result.d[i].InvoiceNum.trim())
                        {
                            Issuetable.push({


                                RnIssueID: result.d[i].RnIssueID,
                                ItemCode: result.d[i].ItemCode,
                                IssuePrice: result.d[i].IssuePrice,
                                IssueQty: result.d[i].IssueQty,
                                RnCatID: result.d[i].RnCatID,
                                RnBinCardID: result.d[i].RnBinCardID,
                                Cemail: result.d[i].Cemail,
                                InvoiceNum: result.d[i].InvoiceNum

                            });
                        }

                    }

                    //for (var i = 0; i < Issuetable.length; i++) {

                    //    //alert(Issuetable[i].ItemCode);
                    //}


                }, error: function (request, status, error) {
                    alert("Error")
                }
            });

            var table = document.getElementById("InvoiceTB").getElementsByTagName("tbody")[0];
            var CSemail = document.getElementById("txtCSEmail").value;
            

            var Mastertable = [];
            var Subtotal = parseFloat(0);
            $.ajax({
                url: "../../Services/ICServices.asmx/GetMasterData",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    for (var i = 0; i < result.d.length; i++) {
                        //alert(result.d[i].ItemCode);
                        var id = 1;
                        for (var j = 0; j < Issuetable.length ; j++) {
                            // alert(Issuetable[j].ItemCode + "---" + result.d[i].ItemCode);
                            
                            if (Issuetable[j].ItemCode == result.d[i].ItemCode)
                            {


                                    var row = document.createElement("tr");
                                    var col1 = document.createElement("td");
                                    var col2 = document.createElement("td");
                                    var col3 = document.createElement("td");
                                    var col4 = document.createElement("td");
                                    var col5 = document.createElement("td");
                                    var col6 = document.createElement("td");



                                    var total = (Issuetable[j].IssuePrice * Issuetable[j].IssueQty);

                                    Subtotal = Subtotal + parseFloat(total);

                                    col1.innerHTML = j + 1;
                                    col2.innerHTML = Issuetable[j].ItemCode;
                                    col3.innerHTML = result.d[i].ItemName;
                                    col4.innerHTML = Issuetable[j].IssuePrice;
                                    col5.innerHTML = Issuetable[j].IssueQty;
                                    col6.innerHTML = total;

                                    row.appendChild(col1);
                                    row.appendChild(col2);
                                    row.appendChild(col3);
                                    row.appendChild(col4);
                                    row.appendChild(col5);
                                    row.appendChild(col6);



                                    table.appendChild(row);


                                
                            }


                        }



                    }

                    //alert(Subtotal);
                    var AddTotal = "<label class=control-label>Sub-Total : " + Subtotal + "</label>";
                    $('#divtotal').append(AddTotal);


                    $('html, body').animate({
                        scrollTop: 350
                    }, 600);

                }, error: function (request, status, error) {
                    alert("Error")
                }
            });

            var CSname = "<label class=control-label>" + document.getElementById("txtCSName").value; +"</label>";
            var CSTP = "<label class=control-label>" + document.getElementById("txtPhone").value; +"</label>";
            var mail = "<label class=control-label>" + document.getElementById("txtCSEmail").value; +"</label>";
            
            
            $('#CustomerName').append(CSname);
            $('#phone').append(CSTP);
            $('#email').append(mail);
           

           
            
            //CalTot();
        }

       


        function printDiv()
        {
            
            var divElements = document.getElementById("divToPrint").innerHTML;
           
            var oldPage = document.body.innerHTML;

           
            document.body.innerHTML =
              "<html><head><title></title></head><body>" +
              divElements + "</body>";

           
            window.print();

           
            document.body.innerHTML = oldPage;


        }

        function sendMail() {
            $.ajax({
                type: 'POST',
                url: 'https://mandrillapp.com/api/1.0/messages/send.json',
                data: {
                    'key': 'mkdkrp19931130',
                    'message': {
                        'from_email': 'kalana3029@gmail.com',
                        'to': [
                            {
                                'email': 'imnotusingmail@yahoo.com',
                                'name': 'kalana',
                                'type': 'to'
                            }
                        ],
                        'autotext': 'true',
                        'subject': 'invoice',
                        'html': 'YOUR EMAIL CONTENT HERE! YOU CAN USE HTML!'
                    }
                }

            
        
        });done(function(response) {
            console.log(response); // if you're into that sorta thing

            
        });
        }
        
        function GetInvoice() {
            $.ajax({
                url: "../../Services/ICServices.asmx/GetIssueData",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                   
                    for (var i = 0; i < result.d.length; i++)
                    {
                        if(result.d[result.d.length-1].InvoiceNum == null)
                        {
                            var inNum = 1;
                        }
                        else
                        {
                            var str = result.d[result.d.length - 1].InvoiceNum.split('_');
                            var inNum = str[1];
                        }
                            
                        
                    }
                    
                    var Invoice = "ME-00_" + inNum;

                    var putInvoice = "<label id=inID class=control-label>" + Invoice + "</label>";

                    
                    $('#lblInvoiceID').append(putInvoice);
                   // $('#IssueNo').append(putInvoice);

                    //document.getElementById("Invoiceno").innerText = Invoice;
                    document.getElementById("inID").style.visibility = "hidden";
                   // alert(Invoice);
                    //document.getElementById("lblInvoiceID").value = Invoice;

                }, error: function (request, status, error) {
                    alert("Error! Cannot Load Categorie.");
                }
            });
        }
        
        function UpdateInvoice()
        {
            var CSemail = document.getElementById("txtCSEmail").value;

            var sendData = JSON.stringify({ Cemail: CSemail });

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


    $(document).ready(function () {

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1;

        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        var today = dd + '/' + mm + '/' + yyyy;
        document.getElementById("DATE").innerText = today;


        getEmail();

        var tet = document.getElementById("txtCSEmail").value;



        if (tet.length != 0) {
            document.getElementById("txtCSEmail").readOnly = true;

        }
        else {
            document.getElementById("txtCSEmail").readOnly = false;
        }
        
        GetInvoice();
        
        //textsearch();

        
        

    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

                                    <form id="Master" action="#" class="horizontal-form">
											<div class="form-body">
												<%--<h3 class="form-section">Print Invoice</h3>--%>
                                                
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
                                                            
															<label class="control-label">Customer Name</label>
                                                            <input type="text" id="txtCSName" class="form-control" placeholder="">
                                                        </div>
													</div>
													<!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
															<label class="control-label">Customer Email</label>
															<input type="text" id="txtCSEmail" class="form-control" placeholder="">
															 
														</div>
                                                     	<!--/span-->
                                                       
												</div>
                                                    </div>
                                                    
												<!--/row-->

												<div class="row">
                                                    <div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Tele-Phone</label>
															<input type="text" id="txtPhone" class="form-control" placeholder="">
															
														</div>
													</div>
                                                    
													
													<!--/span-->
													
													

                                                     <!--/span-->
													
													<!--/span-->
                                                    
												</div>
												<!--/row-->
												</div>
												<!--/row-->
                                               
											<div class="form-actions right">
												
                                                 <button id="btnAdd" type="button" class="btn btn-primary" style="width: 56px" onclick="btnAddClick();">Add</button>
											</div>	
											
										</form>




    <div id="divToPrint" class="page-content" style="min-height:598px">
			
			<div class="invoice">
				<div class="row invoice-logo">
					<div class="col-xs-6 invoice-logo-space">
						
                        <img src="../../Images/midaslogo.jpg" class="img-responsive" alt=""/>
					</div>
					<div class="col-xs-8">
						<h1>Milindu Enterprises (PVT) Ltd.</h1>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-4">
                        <h2>Issue No:</h2>
                         <div id="lblInvoiceID"></div>
						<h3>Client:</h3>
						<ul class="list-unstyled">
							<li>
								<div id ="CustomerName"></div> 
							</li>
							<li>
								 <div id ="phone"></div>
							</li>
							<li>
                                <div id="email"></div>
							</li>
                            <li>
                              <p>Date of Issue : <label id="DATE" class="control-label"></label></p>  
							</li>
						</ul>
					</div>
					<div class="col-xs-4">
						
					</div>
					<div class="col-xs-4 invoice-payment">
						
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<table id="InvoiceTB" class="table table-striped table-hover">
						<thead>
						<tr>
							<th>
								 #
							</th>
							<th>
								 Item Code
							</th>
							<th class="hidden-480">
								 Item Name
							</th>
							<th class="hidden-480">
								 Quantity
							</th>
							<th class="hidden-480">
								 Unit Cost
							</th>
							<th>
								 Total
							</th>
						</tr>
						</thead>
						<tbody>
						
						</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<div class="well">
							<address>
							<strong>Milindu Enterprices.</strong><br>
							2/11<br>
							Colombo<br>
							<abbr title="Phone">TP:</abbr> 0112-1256336 </address>
							<address>
							<strong>Email</strong><br>
							<a href="mailto:#">
							milinduenterprices@email.com </a>
							</address>
						</div>
					</div>
					<div class="col-xs-8 invoice-block">
						<ul class="list-unstyled amounts">
							<li>
                                <div id ="divtotal"></div>
							</li>
						</ul>
						<br>
						<a class="btn btn-lg blue hidden-print margin-bottom-5" onclick="javascript:printDiv();">
						Print <i class="fa fa-print"></i>
						</a>
						<a class="btn btn-lg green hidden-print margin-bottom-5" onclick="sendMail();">
						Mail Invoice <i class="fa fa-check"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
		</div>


</asp:Content>
