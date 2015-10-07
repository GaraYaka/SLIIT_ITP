<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="po.aspx.cs" Inherits="SLIIT.ITP.UI.PR.po" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <script type="text/javascript">

     function AddPO() {
         
         var txtRnBOQ = document.getElementById("RnBOQ").value.trim();
         var txtAmount = document.getElementById("Amount").value.trim();
         var txtDate = document.getElementById("Date").value.trim();
         var a = document.getElementById("Type");
         var Category = a.options[a.selectedIndex].value.trim();

         var sendData = JSON.stringify({ RnBOQ: txtRnBOQ, Amount: txtAmount, Date: txtDate, Type: a });

         $.ajax({

             url: "../../Services/PRServices.asmx/SavePO",
             data: sendData,
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             type: "POST",
             success: function (result) {
                 alert("Successfully Added");


             }, error: function (request, status, error) {
                 alert("Error")
             }
         });

     }


     function getRnPO() {
         $.ajax({
             url: "../../Services/PRServices.asmx/GetRnPO",
             dataType: "json",
             contentType: "application/json; charset=utf-8",
             type: "POST",
             success: function (result) {

                 for (var i = 0; i < result.d.length; i++) {


                     if (result.d[result.d.length - 1].RnPO == null) {
                         var num = 1;
                     }
                     else {
                         var num = parseInt(result.d[result.d.length - 1].RnPOv) + parseInt(1);
                     }
                     document.getElementById("lblRef").innerText = num;
                 }

             }, error: function (request, status, error) {
                 alert("Error! Cannot Load Categorie.");
             }
         });
     }

     function UpdateItem() {

         var txtName = document.getElementById("Name").value.trim();
         var txtTPNO = document.getElementById("TPNO").value.trim();
         var txtAdrL1 = document.getElementById("AdrL1").value.trim();
         var txtAdrL2 = document.getElementById("AdrL2").value.trim();
         var txtStreet = document.getElementById("Street").value.trim();
         var txtCity = document.getElementById("City").value.trim();
         var refid = document.getElementById("lblRef").innerText;



         var sendData = JSON.stringify({ RnPO: refid, Name: txtName, TPNO: txtTPNO, AdrL1: txtAdrL1, AdrL2: txtAdrL2, Street: txtStreet, City: txtCity });

         $.ajax({
             type: "POST",
             url: "../../Services/PRServices.asmx/UpdateBinItem",
             data: sendData,
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (result) {
                 alert("Successfully Updated");
                 location.reload();
             }, error: function (request, status, error) {
                 alert("Error")
             }
         });
     }


     $(document).ready(function () {



         var qry = {}

         qry = location.search.substr(1).split("?");


         if (qry != "") {
             document.getElementById("lblRef").innerText = qry;

             $.ajax({
                 url: "../../Services/PRServices.asmx/GetRnPO",
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                 type: "POST",
                 success: function (result) {

                     for (var i = 0; i < result.d.length; i++) {

                         if (result.d[i].RnPO == qry) {
                             document.getElementById("Name").value = result.d[i].Name;
                             document.getElementById("TPNO").value = result.d[i].TPNO;
                             document.getElementById("AdrL1").value = result.d[i].AdrL1;
                             document.getElementById("AdrL2").value = result.d[i].AdrL2;
                             document.getElementById("Street").value = result.d[i].Street;
                             document.getElementById("City").value = result.d[i].City;
                         }


                     }


                 }, error: function (request, status, error) {
                     alert("Error! Cannot Load Categorie.");
                 }
             });

         }
         else {
             getRnPO();
         }

     });


            </script>
     <script type="text/javascript">

         function AddCP() {
             // var txtRFQ_Ref = document.getElementById("RFQ_Ref").value.trim();
             var txtName = document.getElementById("Name").value.trim();
             var txtTPNO = document.getElementById("TPNO").value.trim();
             var txtAdrL1 = document.getElementById("AdrL1").value.trim();
             var txtAdrL2 = document.getElementById("AdrL2").value.trim();
             var txtStreet = document.getElementById("Street").value.trim();
             var txtCity = document.getElementById("City").value.trim();

             var sendData = JSON.stringify({ Name: txtName, TPNO: txtTPNO, AdrL1: txtAdrL1, AdrL2: txtAdrL2, Street: txtStreet, City: txtCity });

             $.ajax({

                 url: "../../Services/PRServices.asmx/SavePerson",
                 data: sendData,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 type: "POST",
                 success: function (result) {
                     alert("Successfully Added");


                 }, error: function (request, status, error) {
                     alert("Error")
                 }
             });

         }


         function getRnPO() {
             $.ajax({
                 url: "../../Services/PRServices.asmx/GetRnPO",
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                 type: "POST",
                 success: function (result) {

                     for (var i = 0; i < result.d.length; i++) {


                         if (result.d[result.d.length - 1].RnPO == null) {
                             var num = 1;
                         }
                         else {
                             var num = parseInt(result.d[result.d.length - 1].RnPO) + parseInt(1);
                         }
                         document.getElementById("lblRef").innerText = num;
                     }

                 }, error: function (request, status, error) {
                     alert("Error! Cannot Load Categorie.");
                 }
             });
         }

         function UpdateItem() {

             var txtName = document.getElementById("Name").value.trim();
             var txtTPNO = document.getElementById("TPNO").value.trim();
             var txtAdrL1 = document.getElementById("AdrL1").value.trim();
             var txtAdrL2 = document.getElementById("AdrL2").value.trim();
             var txtStreet = document.getElementById("Street").value.trim();
             var txtCity = document.getElementById("City").value.trim();
             var refid = document.getElementById("lblRef").innerText;



             var sendData = JSON.stringify({ RnPO: refid, Name: txtName, TPNO: txtTPNO, AdrL1: txtAdrL1, AdrL2: txtAdrL2, Street: txtStreet, City: txtCity });

             $.ajax({
                 type: "POST",
                 url: "../../Services/PRServices.asmx/UpdateBinItem",
                 data: sendData,
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (result) {
                     alert("Successfully Updated");
                     location.reload();
                 }, error: function (request, status, error) {
                     alert("Error")
                 }
             });
         }


         $(document).ready(function () {



             var qry = {}

             qry = location.search.substr(1).split("?");


             if (qry != "") {
                 document.getElementById("lblRef").innerText = qry;

                 $.ajax({
                     url: "../../Services/PRServices.asmx/GetRnPO",
                     dataType: "json",
                     contentType: "application/json; charset=utf-8",
                     type: "POST",
                     success: function (result) {

                         for (var i = 0; i < result.d.length; i++) {

                             if (result.d[i].RnPO == qry) {
                                 document.getElementById("Name").value = result.d[i].Name;
                                 document.getElementById("TPNO").value = result.d[i].TPNO;
                                 document.getElementById("AdrL1").value = result.d[i].AdrL1;
                                 document.getElementById("AdrL2").value = result.d[i].AdrL2;
                                 document.getElementById("Street").value = result.d[i].Street;
                                 document.getElementById("City").value = result.d[i].City;
                             }


                         }


                     }, error: function (request, status, error) {
                         alert("Error! Cannot Load Categorie.");
                     }
                 });

             }
             else {
                 getRnPO();
             }

         });


            </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

     <div class="col-md-4">
        <span class="caption-subject font-green-sharp bold uppercase">Add Purchase Order</span>
        <br />  <br />
    <b> Enter BOQ Reference No </b> 
	<input id="RnBOQ" class="form-control input-circle"  placeholder="Reference No" type="text">
         <br />
<font color="Blue"><label id="lbl" class="control-label">Youare Editing Refference Number :</label></font>
                 <font color="red"><b><label id="lblRef" class="control-label"></label></b></font>
            <br />

    <br />
       Amount 
	<input id="Amount" class="form-control input-circle"  placeholder="Enter Amount" type="text">

    <br />
             <b> Enter Date </b> 
	<input id="Date" class="form-control input-circle"  placeholder="yyyy-mm-dd" type="text">
         <br />
                          <br />
            <span class="caption-subject font-red-sunglo bold uppercase">Select BOQ Status</span> 
            <select id="Type" name="Type" class="form-control form-filter input-sm">
											
											<option value="1">Paid</option>
                							<option value="2">Waiting</option>
                                            <option value="3">Rejected</option>
                                            <option value="4">Cancelled</option>
                										</select>  
         
         <br /> <br />
           <button id="finish" class="btn btn-primary" onclick ="AddPO();" >
            Finish
            </button>
         </div> 
    <div >

    </div>

</asp:Content>