<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="boq.aspx.cs" Inherits="SLIIT.ITP.UI.PR.boq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

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
        <span class="caption-subject font-green-sharp bold uppercase">Add/Edit/Cancel BOQ</span>
        <br />  <br />
    <b>   Enter BOQ reference No </b> <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="Reference No" type="text">

    <br />
       Enter Company Name <redstar>*</redstar>
	<input class="form-control input-circle"  placeholder="Company Name" type="text">

    <br />
    <span class="caption-subject font-red-sunglo bold uppercase">Enter Address</span>
        <br />
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
    <span class="caption-subject font-red-sunglo bold uppercase">Enter TP No.</span> <redstar>*</redstar>
        <br />
        	<input class="form-control input-circle"  placeholder="Telephone" type="text">
    
    </div >


        <div class="col-md-4">
            <span class="caption-subject font-red-sunglo bold uppercase">Select BOQ Type</span> <redstar>*</redstar>
            <select name="product_category" class="form-control form-filter input-sm">
											<option value="">Select...</option>
											<option value="1">Emergency</option>

											<option value="2">Non emergency</option>
                										</select>
            <br />

             <span class="caption-subject font-red-sunglo bold uppercase">Date of the BOQ</span> <redstar>*</redstar> <br />
            <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
											<input class="form-control form-filter input-sm" readonly="" name="product_created_from" placeholder="Date" type="text">
											<span class="input-group-btn">
											<button class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
											</span>
										</div>
            <br />
            <span class="caption-subject font-red-sunglo bold uppercase">Select BOQ Status</span> <redstar>*</redstar>
            <select name="product_category" class="form-control form-filter input-sm">
											<option value="">Select...</option>
											<option value="1">Pending</option>
                							<option value="2">Approved</option>
                                            <option value="3">Rejected</option>
                                            <option value="4">Cancelled</option>
                										</select>
            </div> 


    <div class="col-md-4">
  <div class="form-group form-md-line-input form-md-floating-label">
										<input class="form-control" id="form_control_1" type="text">
										<label for="form_control_1">Remarks</label>
										<span class="help-block">Enter brief remark if necessary</span>
									</div>
        <br /> <br />
        <button type="button" id="nextboq" class="btn red"><b>Next ></b></button>
        </div> 

</asp:Content>
