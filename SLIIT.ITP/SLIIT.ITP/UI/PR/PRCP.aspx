<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PRCP.aspx.cs" Inherits="SLIIT.ITP.UI.PR.PRCP" %>

<asp:Content ID="Content99" ContentPlaceHolderID="HeadContent" runat="server">


    <head>
 <style>
redstar {color:red}
</style>
        <title>BOQ in Procurement Management</title>

        
    </head>

 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-4">
        <span class="caption-subject font-green-sharp bold uppercase">Add New Contact Person</span>
        <br />  <br />

                <b>   Enter Name </b> <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="New Contact Person" type="text">

        <br />
            <b>   TP No </b> <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="TP No" type="text">

         <br />
    <span class="caption-subject font-red-sunglo bold uppercase">Enter Address</span>
        <br /> <br />
      Enter Address line 1
	<input class="form-control input-circle"  placeholder="Address Line1" type="text">

                <br />        
      Enter Address line 2
	<input class="form-control input-circle"  placeholder="Address Line2" type="text">

         <br />
      Enter Street
	<input class="form-control input-circle"  placeholder="Street" type="text">

                <br />
      Enter City <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="City" type="text">
    <br />

        <button id="sample_editable_1_new" class="btn green">
            Done 
            </button>
                        <br />
        </div> 

 </asp:Content>