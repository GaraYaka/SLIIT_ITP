<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PRCP.aspx.cs" Inherits="SLIIT.ITP.UI.PR.PRCP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

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


        function getRnRef()
        {
            $.ajax({
                url: "../../Services/PRServices.asmx/GetRnRef",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                type: "POST",
                success: function (result) {
                   
                    for (var i = 0; i < result.d.length; i++) {

                        
                        if (result.d[result.d.length - 1].RnRefv == null) {
                            var num = 1;
                        }
                        else {
                            var num = parseInt(result.d[result.d.length - 1].RnRefv) + parseInt(1);
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



            var sendData = JSON.stringify({RnRefv:refid, Name: txtName, TPNO: txtTPNO, AdrL1: txtAdrL1, AdrL2: txtAdrL2, Street: txtStreet, City: txtCity });

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
            

            if (qry != "")
            {
                document.getElementById("lblRef").innerText = qry;

                $.ajax({
                    url: "../../Services/PRServices.asmx/GetRnRef",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    success: function (result) {

                        for (var i = 0; i < result.d.length; i++)
                        {
                            
                            if (result.d[i].RnRefv == qry)
                            {
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
            else
            {
                getRnRef();
            }

        });


            </script>
    


 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
                                                   								
       
    <div class="col-md-6">

                <font color="Blue"><label id="lbl" class="control-label">You are Editing Refference Number :</label></font>
                 <font color="red"><b><label id="lblRef" class="control-label"></label></b></font>
            <br />
                <b>   Enter Name </b> <redstar>*</redstar>
	<input id="Name" class="form-control input-circle"  placeholder="New Contact Person" type="text">

        <br />
            <b>   TP No </b> <redstar>*</redstar>
	<input id="TPNO" class="form-control input-circle"  placeholder="TP No" type="text">

         <br />
    <span class="caption-subject font-red-sunglo bold uppercase">Enter Address</span>
        <br /> <br />
      Enter Address line 1
	<input id ="AdrL1" class="form-control input-circle"  placeholder="Address Line1" type="text">

                <br />        
      Enter Address line 2
	<input id="AdrL2" class="form-control input-circle"  placeholder="Address Line2" type="text">

         <br />
      Enter Street
	<input id="Street" class="form-control input-circle"  placeholder="Street" type="text">
                <br />
      Enter City <redstar>*</redstar>
	<input id="City" class="form-control input-circle"  placeholder="City" type="text">
            <br />       
            <button id="done" type="button" class="btn btn-primary" style="width: 56px" onclick="AddCP();">Add</button>             
                <button id="Update" type="button" class="btn btn-primary" style="width: 80px" onclick="UpdateItem();">Update</button>                        
        </div> 

 </asp:Content>