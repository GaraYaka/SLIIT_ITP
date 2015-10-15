<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNew.aspx.cs" Inherits="SLIIT.ITP.UI.PC.AddNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								</div>
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-container">
								
								<div id="datatable_products_wrapper" class="dataTables_wrapper dataTables_extended_wrapper no-footer"><div class="row"><div class="col-md-8 col-sm-12"><div class="dataTables_paginate paging_bootstrap_extended" id="datatable_products_paginate"></div><div class="dataTables_info" id="datatable_products_info" role="status" aria-live="polite"></div></div><div class="col-md-4 col-sm-12"></div></div><div class="table-scrollable"><table class="table table-striped table-bordered table-hover dataTable no-footer" id="datatable_products" aria-describedby="datatable_products_info" role="grid">
								<thead>
								<tr role="row" class="heading"><th width="10%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="height: 22px">
										 Date</th><th class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="width: 15%; height: 22px;">
										 Suppiler</th><th width="15%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="height: 22px">
										 Description</th><th width="10%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="height: 22px">
										 Cost Centre
									</th><th width="10%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="height: 22px">
										 Amount
									</th><th width="15%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1" style="height: 22px">
										 Approving</th></tr>
								<tr role="row" class="filter"><td rowspan="1" colspan="1" style="height: 14px">
										&nbsp;<asp:TextBox ID="txt_date" runat="server" Enabled="False" Height="32px" Width="100px"></asp:TextBox>
									</td><td rowspan="1" colspan="1" style="width: 15%; height: 14px;">
										&nbsp;<asp:DropDownList ID="drop_supplier"  runat="server" Height="32px" Width="173px">
                                        </asp:DropDownList>
									</td><td rowspan="1" colspan="1" style="height: 14px">
										<asp:TextBox ID="TextBox1"  runat="server" Height="32px" Width="170px"></asp:TextBox>
									</td><td rowspan="1" colspan="1" style="height: 14px">
										<div class="margin-bottom-5">
											&nbsp;<asp:DropDownList ID="drop_costcentre"  runat="server" Height="32px" Width="122px" style="margin-bottom: 12px">
                                            </asp:DropDownList>
										</div>
										</td><td rowspan="1" colspan="1" style="height: 14px">
										<div class="margin-bottom-5">
											&nbsp;<asp:TextBox ID="txt_amount"  runat="server" Height="32px" TextMode="Number" Width="100px"></asp:TextBox>
										</div>
										</td><td rowspan="1" colspan="1" style="height: 14px">
										<div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
											&nbsp;<asp:DropDownList ID="drop_approve"  runat="server" Height="32px" Width="153px">
                                            </asp:DropDownList>


                                            <%--<input type="text" class="form-control" id="form_control_1">--%>


										</div>
									</td>







								</tr>
								<tr role="row" class="filter"><td colspan="1">
										&nbsp;</td><td colspan="1" style="width: 15%">
										&nbsp;</td><td colspan="1">
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Description" Font-Italic="True" ForeColor="#FF3300" ValidationGroup="sub"></asp:RequiredFieldValidator>
									</td><td colspan="1">
										&nbsp;</td><td colspan="1">
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_amount" ErrorMessage="Enter Amount" Font-Italic="True" ForeColor="Red" ValidationGroup="sub"></asp:RequiredFieldValidator>
										</td><td colspan="1">
										&nbsp;</td></tr>
								</thead>
								<tbody>
								</tbody>
								</table></div><div class="row"><div class="col-md-8 col-sm-12"><div class="dataTables_info">
                                        Requested by :<br />
                                        <br />
                                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" Height="32px" Width="243px">
                                        </asp:DropDownList>

                            

                                        <br />
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" OnClick="Button1_Click1" Text="Submit" ValidationGroup="sub" />

                                    
                                   
                                    <asp:Button ID="Button2" class="btn btn-danger" runat="server" OnClick="Button1_Click1" Text="Print" PostBackUrl="~/UI/PC/printReciept.aspx" Width="66px" />


                                        <asp:Button ID="Button3" class="btn btn-warning" runat="server" Text="Search" PostBackUrl="~/UI/PC/Search.aspx" />
                                   

                                        <br />
                                        
                                          
                                        </div></div><div class="col-md-4 col-sm-12"></div></div></div>
							</div>
						</div>
					</div>

</asp:Content>
