<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="SLIIT.ITP.UI.VF.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="portlet-body">
        <div class="tabbable">
            <ul class="nav nav-tabs nav-tabs-lg">
                <li class="active">
                    <a href="#tab_1" data-toggle="tab" aria-expanded="true">Vehicle Fleet Report
                    </a>
                </li>
                <li class="">
                    <a href="#tab_2" data-toggle="tab" aria-expanded="false">Daily Statistics Report
                    </a>
                </li>

            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1">
                    <div class="portlet light bordered">
                        <div class="portlet-body form" style="display: block;">
                            <div class="portlet-title">
                                <div class="caption font-red-sunglo">
                                    <span class="caption-subject bold uppercase">
                                        <h3 class="form-section">Vehicle Fleet Report</h3>
                                    </span>
                                </div>
                                <!-- BEGIN FORM-->
                                
                                <!-- END FORM-->
                            </div>
                        </div>
                    </div>




                </div>
                <div class="tab-pane fade" id="tab_2">
                    <div class="table-container">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-globe"></i>Daily Statistics Report
                                </div>
                                
                    </div>
                </div>



            </div>
        
    </div>
</asp:Content>
