<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rfq.aspx.cs" Inherits="SLIIT.ITP.UI.PR.rfq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <head>
 <style>
redstar {color:red}
</style>
        <title>BOQ in Procurement Management</title>
 <style>
redstar {color:red}
</style>
    </head>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-4">
        <span class="caption-subject font-green-sharp bold uppercase">Add/Edit/Cancel RFQ</span>
        <br />  <br />
    <b>   Enter RFQ reference No </b> <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="RFQ Reference No" type="text">

    <br />
       Enter Company Name <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="Company Name" type="text">

    <br />
                     <span class="caption-subject font-red-sunglo bold uppercase">Date of the RFQ</span> <redstar>*</redstar> <br />
                          <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
											<input class="form-control form-filter input-sm" readonly="" name="product_created_from" placeholder="Date" type="text">
											<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
        <br />

                 <b>   Enter BOQ reference No </b> <redstar>*</redstar>
	                <input class="form-control input-circle"  placeholder="BOQ Reference No" type="text">

             <br />
                    <span class="caption-subject font-red-sunglo bold uppercase">Select Contact Person</span> <redstar>*</redstar>
            <select name="product_category" class="form-control form-filter input-sm">
											<option value="">Select...</option>
											<option value="1">Default</option>
            </select>
        <br />
        <button id="addnewprcontact" class="btn green">
            Add Contact Person <i class="fa fa-plus"></i>
             </button>
            

        <br />  <br />
           <button id="finishrfq" class="btn blue">
            Finish
            </button>

        <br />

        </div> 
        <div class="col-md-4">
                                <span class="caption-subject font-red-sunglo bold uppercase">Add Or Delete ?</span> <redstar>*</redstar>
            <select name="product_category" class="form-control form-filter input-sm">
											<option value="">Add</option>
											<option value="1">Delete Existing</option>
                </select>
                <br />
                  <div class="form-group form-md-line-input form-md-floating-label">
										<input class="form-control" id="form_control_1" type="text">
										<label for="form_control_1">Remarks</label>
										<span class="help-block">Enter brief remark if necessary</span>
            </div> 
</asp:Content>