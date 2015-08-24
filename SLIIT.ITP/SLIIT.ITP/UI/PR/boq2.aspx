<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="boq2.aspx.cs" Inherits="SLIIT.ITP.UI.PR.boq2" %>

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

    <div class="col-md-12">
        <span class="caption-subject font-green-sharp bold uppercase">Add/Edit/Cancel BOQ</span>
        <br />  <br />
        </div> 

<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-edit"></i>BOQ Items
							</div>

						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button id="sample_editable_1_new" class="btn green">
											Add New <i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="dataTables_wrapper no-footer" id="sample_editable_1_wrapper"><div class="row"><div class="col-md-6 col-sm-12"><div id="sample_editable_1_length" class="dataTables_length"><label> <div id="s2id_autogen1" class="select2-container form-control input-xsmall input-inline"><a href="javascript:void(0)" class="select2-choice" tabindex="-1">  <span id="select2-chosen-2" class="select2-chosen">&nbsp;</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></><label for="s2id_autogen2" class="select2-offscreen"></label><input id="s2id_autogen2" aria-labelledby="select2-chosen-2" class="select2-focusser select2-offscreen" aria-haspopup="true" role="button" type="text"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label for="s2id_autogen2_search" class="select2-offscreen"></label>       <input placeholder="" id="s2id_autogen2_search" aria-owns="select2-results-2" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" type="text">   </div>   <ul id="select2-results-2" class="select2-results" role="listbox">   </ul></div></div><select title="" tabindex="-1" class="form-control input-xsmall input-inline select2-offscreen" aria-controls="sample_editable_1" name="sample_editable_1_length"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select> records</label></div></div><div class="col-md-6 col-sm-12"><div class="dataTables_filter" id="sample_editable_1_filter"><label>Search:<input aria-controls="sample_editable_1" placeholder="" class="form-control input-small input-inline" type="search"></label></div></div></div><div class="table-scrollable"><table aria-describedby="sample_editable_1_info" role="grid" class="table table-striped table-hover table-bordered dataTable no-footer" id="sample_editable_1">
							<thead>
							<tr role="row"><th aria-sort="descending" aria-label="
									 Item No
								: activate to sort column ascending" style="width: 179px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting_desc">
									 Item No
								</th><th aria-label="
									 Item Name
								: activate to sort column ascending" style="width: 225px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Item Name
								</th><th aria-label="
									 Qty
								: activate to sort column ascending" style="width: 121px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Qty
								</th><th aria-label="
									 Item Price
								: activate to sort column ascending" style="width: 156px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Item Price
                                </th><th aria-label="
									 Total Price
								: activate to sort column ascending" style="width: 156px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Total Price
								</th><th aria-label="
									 Edit
								: activate to sort column ascending" style="width: 86px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Edit
								</th><th aria-label="
									 Delete
								: activate to sort column ascending" style="width: 123px;" colspan="1" rowspan="1" aria-controls="sample_editable_1" tabindex="0" class="sorting">
									 Delete
								</th></tr>
							</thead>
							<tbody>
							
							
							
							
							
							
							<tr class="odd" role="row">
								<td class="sorting_1">
									 1
								</td>
								<td>
									 Prada
								</td>
								<td>
									 4
								</td>
								<td class="center">
									 99000
								</td>
								
								<td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="even" role="row">
								<td class="sorting_1">
									 2
								</td>
								<td>
									 Nickles
								</td>
								<td>
									 100
								</td>
								<td class="center">
									 120
								</td>
                                <td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="odd" role="row">
								<td class="sorting_1">
									 3
								</td>
								<td>
									 Vitza
								</td>
								<td>
									 48
								</td>
								<td class="center">
									 78000
								</td>
                                <td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="even" role="row">
								<td class="sorting_1">
									 4
								</td>
								<td>
									 Manga
								</td>
								<td>
									 132
								</td>
								<td class="center">
									 75
								</td>
                                <td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="odd" role="row">
								<td class="sorting_1">
									 5
								</td>
								<td>
									 Banjo
								</td>
								<td>
									 62
								</td>
								<td class="center">
									 3250
								</td>
                                <td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="even" role="row">
								<td class="sorting_1">
									 6
								</td>
								<td>
									 Rex
								</td>
								<td>
									 1234
								</td>
								<td class="center">
									 65
								</td>
                                <td class="center">
									 
								</td>
								<td>
									<a class="edit" href="javascript:;">
									Edit </a>
								</td>
								<td>
									<a class="delete" href="javascript:;">
									Delete </a>
								</td>
							</tr><tr class="odd" role="row"><td class="sorting_1"><input class="form-control input-small" value="" type="text"></td><td><input class="form-control input-small" value="" type="text"></td><td><input class="form-control input-small" value="" type="text"></td><td><input class="form-control input-small" value="" type="text"></td><td><input class="form-control input-small" value="" type="text"></td><td><a class="edit" href="">Save</a></td><td><a class="cancel" href="">Cancel</a></td></tr></tbody>
							</table></div><div class="row"><div class="col-md-5 col-sm-12"><div aria-live="polite" role="status" id="sample_editable_1_info" class="dataTables_info">Showing 1 to 7 of 7 entries</div></div><div class="col-md-7 col-sm-12"><div id="sample_editable_1_paginate" class="dataTables_paginate paging_simple_numbers"><ul class="pagination"><li id="sample_editable_1_previous" tabindex="0" aria-controls="sample_editable_1" class="paginate_button previous disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li><li tabindex="0" aria-controls="sample_editable_1" class="paginate_button active"><a href="#">1</a></li><li id="sample_editable_1_next" tabindex="0" aria-controls="sample_editable_1" class="paginate_button next disabled"><a href="#"><i class="fa fa-angle-right"></i></a></li></ul></div></div></div></div>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
    <div>
        <button type="button" id="finishboq" class="btn red"><b>Finish </b></button>
        </div>

</asp:Content>
