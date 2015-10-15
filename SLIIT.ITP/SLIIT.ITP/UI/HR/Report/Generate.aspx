<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Generate.aspx.cs" Inherits="SLIIT.ITP.UI.HR.Report.Generate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width: 100%;">
        <tr>
            <td style="text-align: center;">
                <img src="../../Images/Processing.gif" /><br />
                <font style="font-size: 25px;"> Please wait while we are processing your request</font>

            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <font style="font-size: 15px;"> Processing Errors:</font>
                <asp:Label ID="lblErrorNote" ForeColor="Red" runat="server" Text="N/A"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
