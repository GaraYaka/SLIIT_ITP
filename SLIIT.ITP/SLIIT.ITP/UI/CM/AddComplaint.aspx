<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddComplaint.aspx.cs" Inherits="SLIIT.ITP.UI.CM.CM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i> Complaint Form
							</div>
							<div class="tools">
								<a href="" class="collapse" data-original-title="" title="">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title="">
								</a>
								<a href="" class="reload" data-original-title="" title="">
								</a>
								<a href="" class="remove" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form role="form">
								<div class="form-body">
                                    <div class="form-group">
										<label>Complaint ID</label>
										<div class="input-group">
											<span class="input-group-addon">
                                             </span>
											<input type="text" class="form-control" placeholder="Complaint ID">
										</div>
									</div>
									<div class="form-group">
										<label>Customer name</label>
										<div class="input-group">
											<span class="input-group-addon">
                                                <i class="fa fa-user"></i>
											</span>
											<input type="text" class="form-control" placeholder="Customer Name">
										</div>
									</div>
									<div class="form-group">
										<label>E-mail address</label>
										<div class="input-group">
											<span class="input-group-addon input-circle-left">
											<i class="fa fa-envelope"></i>
											</span>
											<input type="text" class="form-control input-circle-right" placeholder="Email Address">
										</div>
									</div>
									
                                    <div class="form-group">
										<label>Home address</label>
										<div class="input-group">
											<span class="input-group-addon input-circle-left">
											<i class="fa fa-bell-o"></i>
											</span>
											<input type="text" class="form-control input-circle-right" placeholder="Home Address">
										</div>
									</div>


                                    <div class="form-group">
										<label>Complaint type</label>
										<select class="form-control">
											<option>Product related</option>
											<option>Service related</option>
											<option>Other</option>
										</select>
									</div>
									<div class="form-group">
										<label>Complaint description</label>
										<textarea class="form-control" rows="3"></textarea>
									</div>
									
									<div class="form-group">
										<label>Priority</label>
										<div class="radio-list">
											<label>
											<div class="radio" id="uniform-optionsRadios1"><span><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked=""></span></div> High</label>
											<label>
											<div class="radio" id="uniform-optionsRadios2"><span><input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"></span></div> Medium </label>
											<label>
											<div class="radio" id="uniform-optionsRadios3"><span><input type="radio" name="optionsRadios" id="optionsRadios3" value="option3"></span></div> Low </label>
										</div>
									</div>
									
								</div>
								<div class="form-actions">
									<button type="submit" class="btn blue">Submit</button>
									<button type="button" class="btn default">Cancel</button>
								</div>
							</form>
						</div>
					</div>
</asp:Content>
