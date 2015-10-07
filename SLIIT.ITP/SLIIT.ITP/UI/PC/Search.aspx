<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="SLIIT.ITP.UI.PC.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">











        <asp:TextBox ID="TextBox1" class="input-group-addon"  runat="server" Width="267px" Font-Italic="True" ></asp:TextBox>
        <asp:Button ID="Button1" class="btn btn-circle btn-primary" runat="server" OnClick="Button1_Click" Text="Search" />
        

   
       
        <asp:Button ID="Button2" class="btn btn-circle btn-success" runat="server" Text="Add New Entry" PostBackUrl="~/UI/PC/AddNew.aspx" />


        

   
       
        <br />
        <br />
        <asp:GridView ID="GridView1" class="table table-bordered table-striped table-condensed flip-content" runat="server">
        </asp:GridView>








    



        




        <asp:DropDownList ID="DropDownList1" class="form-control input-inline input-medium"  runat="server" Height="34px" Width="207px">
        </asp:DropDownList>
        <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClick="Button3_Click" Text="Select Supplier" />


        <br />
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView2" class="table table-bordered table-striped table-condensed flip-content" runat="server">
        </asp:GridView>
        <br />




        











</asp:Content>
