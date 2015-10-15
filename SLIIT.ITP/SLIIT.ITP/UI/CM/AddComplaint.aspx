<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddComplaint.aspx.cs" Inherits="SLIIT.ITP.UI.CM.CM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="<%: ResolveUrl("~/assets/global/plugins/bootbox/bootbox.min.js")%>" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            //loadData();
            //alert('unchecked');
        });

        function loadData() {


            var urlParams;
            (window.onpopstate = function () {
                var match,
                    pl = /\+/g,  // Regex for replacing addition symbol with a space
                    search = /([^&=]+)=?([^&]*)/g,
                    decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
                    query = window.location.search.substring(1);

                urlParams = {};
                while (match = search.exec(query))
                    urlParams[decode(match[1])] = decode(match[2]);
            })();


            var qstring = parseInt(urlParams["cmId"]);
            var sendData = JSON.stringify({ cmId: qstring });

            $.ajax({
                url: "../../Services/CMServices.asmx/GetCMById",
                dataType: "json",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                complete: function (data, status) {
                    //alert(data.responseText);
                    if (status === "success") {
                        var temp = JSON.parse(data.responseText);
                        //alert(temp.d[0].CM_CUSTOMER_NAME);
                        document.getElementById("txtCMID").value = temp.d[0].CM_ID;
                        document.getElementById("txtCustomerName").value = temp.d[0].CM_CUSTOMER_NAME;
                        document.getElementById("txtEmail").value = temp.d[0].CM_EMAIL;
                        document.getElementById("txtHAddress").value = temp.d[0].CM_HOME_ADDRESS;
                        document.getElementById("txtCMDescription").value = temp.d[0].CM_DESCRIPTION;
                        document.getElementById("ddlCMType").value = temp.d[0].CM_TYPE;

                        var val = temp.d[0].CM_PRIORITY;
                        
                        var rdoPriority = document.getElementsByName('optionsRadios');
                        var rdoPriorityValue;
                        for (var i = 0, length = rdoPriority.length; i < length; i++) {
                            if (val == i) {
                                rdoPriority[i].checked = true;
                                //break;
                            }
                        }

                    }
                    


                }, error: function (request, status, error) {
                    bootbox.hideAll();

                    popHTMLContent = '<div id="grdItemsModal" style="">Sending Failed.</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Complaint Response<small></small></h3>",
                        closeButton: false,
                    });

                    setInterval(function () { bootbox.hideAll(); }, 3000);
                }
            });

        }

        function btnAddCM_Click() {

            var txtCustomerName = $("#txtCustomerName").val();
            var txtEmail = $("#txtEmail").val();
            var txtHAddress = $("#txtHAddress").val();
            var txtCMDescription = $("#txtCMDescription").val();

            var rdoPriority = document.getElementsByName('optionsRadios');
            var rdoPriorityValue;
            for (var i = 0, length = rdoPriority.length; i < length; i++) {
                if (rdoPriority[i].checked) {
                    rdoPriorityValue = rdoPriority[i].value;
                    break;
                }
            }

            var ddlCMType = document.getElementById("ddlCMType");
            var ddlCMTypeValue = ddlCMType.options[ddlCMType.selectedIndex].text;

            alert(ddlCMTypeValue);


            var sendData = JSON.stringify({ CM_CUSTOMER_NAME: txtCustomerName, CM_EMAIL: txtEmail, CM_HOME_ADDRESS: txtHAddress, CM_DESCRIPTION: txtCMDescription, CM_PRIORITY: rdoPriorityValue, CM_TYPE: ddlCMTypeValue });



            $.ajax({
                url: "../../Services/CMServices.asmx/addCMPT",
                dataType: "json",
                data: sendData,
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {

                    bootbox.hideAll();

                    popHTMLContent = '<div id="grdItemsModal" style="">Sucessfully Sent</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Complaint Response<small></small></h3>",
                        closeButton: false,
                    });

                    setInterval(function () { bootbox.hideAll(); }, 3000);


                }, error: function (request, status, error) {
                    bootbox.hideAll();

                    popHTMLContent = '<div id="grdItemsModal" style="">Sending Failed.</div>';
                    bootbox.dialog({
                        message: popHTMLContent,
                        title: "<h3 class='page-title'>Complaint Response<small></small></h3>",
                        closeButton: false,
                    });

                    setInterval(function () { bootbox.hideAll(); }, 3000);
                }
            });
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i> Complaint Form
							</div>
							<div class="tools">
								<a href="" class="collapse" data-original-title="" title="">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title="">
								</a>
								<a href="" class="reload" data-original-title="" title="">
								</a>
								<a href="" class="remove" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form role="form">
								<div class="form-body">
                                    <div class="form-group">
										<label>Complaint ID</label>
										<div class="input-group">
											<span class="input-group-addon">
                                             </span>
											<input type="text" id="txtCMID"  class="form-control" placeholder="Complaint ID">
										</div>
									</div>
									<div class="form-group">
										<label>Customer name</label>
										<div class="input-group">
											<span class="input-group-addon">
                                                <i class="fa fa-user"></i>
											</span>
											<input type="text" id="txtCustomerName" class="form-control" placeholder="Customer Name">
										</div>
									</div>
									<div class="form-group">
										<label>E-mail address</label>
										<div class="input-group">
											<span class="input-group-addon input-circle-left">
											<i class="fa fa-envelope"></i>
											</span>
											<input type="text" class="form-control input-circle-right" id="txtEmail" placeholder="Email Address">
										</div>
									</div>
									
                                    <div class="form-group">
										<label>Home address</label>
										<div class="input-group">
											<span class="input-group-addon input-circle-left">
											<i class="fa fa-bell-o"></i>
											</span>
											<input type="text" class="form-control input-circle-right" id="txtHAddress" placeholder="Home Address">
										</div>
									</div>

                                    <div class="form-group">
										<label>Complaint type</label>
										<select class="form-control" id="ddlCMType">
											<option>Product related</option>
											<option>Service related</option>
											<option>Other</option>
										</select>
									</div>
									<div class="form-group">
										<label>Complaint description</label>
										<textarea class="form-control" id="txtCMDescription" rows="3"></textarea>
									</div>
									
									<div class="form-group">
										<label>Priority</label>
										<div class="radio-list">
											<label>
											<div class="radio" id="uniform-optionsRadios1"><span><input type="radio" name="optionsRadios" id="optionsRadios1" value="1"></span></div> High</label>
											<label>
											<div class="radio" id="uniform-optionsRadios2"><span><input type="radio" name="optionsRadios" id="optionsRadios2" value="2"></span></div> Medium </label>
											<label>
											<div class="radio" id="uniform-optionsRadios3"><span><input type="radio" name="optionsRadios" id="optionsRadios3" value="3"></span></div> Low </label>
										</div>
									</div>
									
								</div>
								<div class="form-actions">
									<button type="submit" class="btn red" id="btnAddCM" onclick="btnAddCM_Click();">Submit</button>
									<button type="button" class="btn default">Cancel</button>
								</div>
							</form>
						</div>
					</div>

    

</asp:Content>
