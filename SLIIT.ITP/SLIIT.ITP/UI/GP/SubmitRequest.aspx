<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitRequest.aspx.cs" Inherits="SLIIT.ITP.UI.GP.SubmitRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">












       
            <table class="table table-striped table-bordered table-advance table-hover" style="width: 71%;">
                <tr>
                    <td style="width: 135px">GP ID</td>
                    <td style="width: 437px">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Company Name</td>
                    <td style="width: 437px">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Address</td>
                    <td style="width: 437px; margin-left: 80px">
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">TP NO</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Email</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Reason</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Approvinf authority</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Area</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">Date</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">From</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 135px">To</td>
                    <td style="width: 437px; margin-left: 160px">
                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; width: 135px">Visitor Name</td>
                    <td style="height: 23px; width: 437px; margin-left: 160px">
                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; width: 135px">NIC</td>
                    <td style="height: 23px; width: 437px; margin-left: 160px">
                        <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 23px; width: 135px">Status</td>
                    <td style="height: 23px; width: 437px; margin-left: 160px">
                        <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
     



    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />













            <asp:Button ID="Button2" class="btn btn-primary" runat="server" PostBackUrl="~/UI/GP/SubmitRequest.aspx" Text="Refresh" />





    







            <br />
            <br />
           











            <br />
            <asp:TextBox ID="txt_mymail" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txt_pawrd" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txt_to" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txt_sub" runat="server" OnTextChanged="txt_sub_TextChanged" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txt_msg" runat="server" Visible="False"></asp:TextBox>
           











</asp:Content>
