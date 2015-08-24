<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitPage.aspx.cs" Inherits="SLIIT.ITP.UI.GP.SubmitPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-md-6 col-sm-12">
        <div class="portlet blue-hoki box">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>Summary of the Gate Pass
                </div>
                <div class="actions">
                    <a href="RequestPage.aspx" class="btn btn-default btn-sm">
                        <i class="fa fa-pencil"></i>Edit </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Company Name:
                        <asp:Label ID="lblcompanyname" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-7 value">
                        Address
                        <asp:Label ID="lbladdress" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Email:
                    </div>
                    <div class="col-md-7 value">
                        jhon@doe.com
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        State:
                    </div>
                    <div class="col-md-7 value">
                        New York
                    </div>
                </div>
                <div class="row static-info">
                    <div class="col-md-5 name">
                        Phone Number:
                    </div>
                    <div class="col-md-7 value">
                        12234389
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
