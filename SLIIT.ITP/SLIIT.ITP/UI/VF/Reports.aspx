<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="SLIIT.ITP.UI.VF.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <script type="text/javascript">

            function clearInputs() {
                document.getElementById("txtFromLocation").value = "";
                document.getElementById("txtToLocation").value = "";
                document.getElementById("txtDistance").value = "";
                document.getElementById("txtMaintenanceNotes").value = "";
            }

            function Search() {

                var searchText = document.getElementById("txtSearch").value;

                var sendData = JSON.stringify({ searchString: searchText });

                $.ajax({
                    url: "../../Services/VFServices.asmx/SearchDailyVehicleStats",
                    dataType: "json",
                    data: sendData,
                    contentType: "application/json; charset=utf-8",
                    type: "POST",
                    success: function (result) {

                        var htmlText = "";

                        htmlText += "<table class='table table-hover' id='VehicleTable'>";
                        htmlText += "<tr>";
                        htmlText += "<th style='height: 24px'>Vehicle ID </th>";
                        htmlText += "<th style='height: 24px'>From</th>";
                        htmlText += "<th style='height: 24px'>To</th>";
                        htmlText += "<th style='height: 24px'>Distance</th>";
                        htmlText += "<th style='height: 24px'>Maintenance Notes</th>";
                        htmlText += "<th style='height: 24px'>Recorded Date</th>";
                        
                        htmlText += "</tr>";

                        for (var i = 0; i < result.d.length; i++) {
                            htmlText += "<tr>";
                            htmlText += "<td>" + result.d[i].RegNo + "</td>";
                            htmlText += "<td>" + result.d[i].FromLocation + "</td>";
                            htmlText += "<td>" + result.d[i].ToLocation + "</td>";
                            htmlText += "<td>" + result.d[i].DistanceToday + "</td>";
                            htmlText += "<td>" + result.d[i].MaintenanceNotes + "</td>";
                            htmlText += "<td>" + result.d[i].DisplayInsertedDate + "</td>";
                            
                            htmlText += "</tr>";
                        }

                        htmlText += "</table>";

                        dailyVehicleStatsTbl.innerHTML = htmlText;

                    }, error: function (request, status, error) {
                        alert("Error! Could not search");
                    }
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

            Search();

        });
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <h3>Search</h3><input type="search" class="form-control input-small input-inline" placeholder="Enter Search Text" aria-controls="sample_1" id="txtSearch" onkeyup="Search();">


                                <div id="divToPrint">
                                    <div id="dailyVehicleStatsTbl"></div>
                                    
                                </div>

    
       

    <div class="form-actions right">
            
            <a class="btn btn-lg blue hidden-print margin-bottom-5" onclick="javascript:printDiv();">Print <i class="fa fa-print"></i></a>
           </div>
   

</asp:Content>
