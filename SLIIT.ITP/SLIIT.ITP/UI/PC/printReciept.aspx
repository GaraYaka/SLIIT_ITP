<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="printReciept.aspx.cs" Inherits="SLIIT.ITP.UI.PC.printReciept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">




    <div class="portlet box blue" style="width: 361px">
						<div class="portlet-title">
							<div class="caption">
								Petty Cash Reciept</div>
							
						</div>
						<div class="portlet-body">
							<table class="table table-bordered table-striped">
							<thead>
							</thead>
							<tbody>
							<tr>
								<td style="width: 125px; height: 23px;">
									 Date</td>
								<td style="height: 23px; width: 175px">
									<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="width: 125px" class="k-fontName">
									 Supplier
								</td>
								<td style="width: 175px">
									<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="width: 125px" class="k-fontName">
									 Description</td>
								<td style="width: 175px">
									<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="width: 125px" class="k-fontName">
									 Cost Centre
								</td>
								<td style="width: 175px">
									<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="width: 125px" class="k-fontName">
									 Amount</td>
								<td style="width: 175px">
									<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							<tr>
								<td style="width: 125px; height: 12px;" class="k-fontName">
									 Approved by</td>
								<td style="width: 175px; height: 12px">
									<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>

                                	<tr>
								<td style="width: 125px" class="k-fontName">
									 Req By</td>
								<td style="width: 175px">
									<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
								</td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>

    <div style="height: 70px">






        <button class="btn btn-danger" type="button" OnClick="window.print()">
            Print Reciept
        </button>


        
        



        <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click" Text="Send Email" />

 


        <asp:Button ID="Button2" class="btn yellow-crusta" runat="server" PostBackUrl="~/UI/PC/AddNew.aspx" Text="Add New Entry" />



    </div>






    <div style="height: 161px">
        <asp:TextBox ID="txt_email" runat="server" ></asp:TextBox>
        <br />
        <asp:TextBox ID="txt_pass" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="txt_to" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="txt_sub" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:TextBox ID="txt_msg" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
    </div>






</asp:Content>
