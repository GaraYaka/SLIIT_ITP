<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="SLIIT.ITP.UI.GP.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">





   

    <br />
    <br />
    <table class="table table-bordered table-hover" style="width:30%; margin-left: 40px;">
        <tr>
            <td class="k-formatBlock" style="width: 200px">GP ID</td>
            <td style="width: 1766px"> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px"></td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Company</td>
            <td style="width: 1766px"> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Address</td>
            <td style="width: 1766px"> <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">TP</td>
            <td style="width: 1766px"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Email</td>
            <td style="width: 1766px"><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Reason</td>
            <td style="width: 1766px"><asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Approving Authority</td>
            <td style="width: 1766px"><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Area</td>
            <td style="width: 1766px"><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Date</td>
            <td style="width: 1766px"><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Time From</td>
            <td style="width: 1766px"><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">To</td>
            <td style="width: 1766px"><asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Name</td>
            <td style="width: 1766px"><asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">NIC</td>
            <td style="width: 1766px"><asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        <tr>
            <td class="k-formatBlock" style="width: 200px">Status</td>
            <td style="width: 1766px"><asp:Label ID="Label14" runat="server" Text="Label"></asp:Label></td>
            <td style="width: 283px">&nbsp;</td>
        </tr>
        </table>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="225px">
        <asp:ListItem Value="1">Pending</asp:ListItem>
        <asp:ListItem Value="2">Approved</asp:ListItem>
        <asp:ListItem Value="3">Rejected</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
    <br />





</asp:Content>
