<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenerateReport.aspx.cs" Inherits="SLIIT.ITP.UI.HR.Report.GenerateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function X() {

            var fmDt = document.getElementById("fromTxtDate").value;
            var toDt = document.getElementById("toTxtDate").value;
            window.open("Downloader.aspx?tag=PC&fmDt=" + fmDt + "&toDt=" + toDt);
        }

    </script>
    <input id="fromTxtDate" type="date" />
    <input id="toTxtDate" type="date" />
    <button type="button" onclick="X()">Generate</button>

</asp:Content>
