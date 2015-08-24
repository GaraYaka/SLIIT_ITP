<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestPage.aspx.cs" Inherits="SLIIT.ITP.UI.GP.RequestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Gate Pass Request
            </div>
            <div class="tools">
                <a href="" class="collapse" data-original-title="" title=""></a>

            </div>
        </div>
        <div class="portlet-body form">
            <form role="form">
                <div class="form-body">
                    <div class="form-group">
                        Company Name
											
											<input type="text" class="form-control" placeholder="Enter the Company Name" id="txtcompanyname">
                    </div>

                    <div class="form-group">
                        Address
											
											<input type="text" class="form-control" placeholder="Enter the company address" id="txtaddress">
                    </div>

                    <div class="form-group">
                        Official Telephone
											
											<input type="text" class="form-control" placeholder="Enter the Official Telephone Number" id="txttelephone">
                    </div>

                    <div class="form-group">
                        Company Email Address
											
											<input type="text" class="form-control" placeholder="Enter the company email address" id="txtemail">
                    </div>

                    <div class="form-group">
                        Reason for Request
											
											<input type="text" class="form-control" placeholder="Reason for the Request" id="txtreason">
                    </div>
                    <div class="form-group">
                        Approving Authority
											
											<select class="form-control" id="multipleapprove">
                                                <option value=""></option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                                <option value="4">Option 4</option>
                                            </select>
                    </div>

                    <div class="form-group">
                        Items to be declared
											
											<textarea class="form-control" rows="3" placeholder="(eg. Laptops, projectors etc... with serial numbers )" id="txtitems"></textarea>
                    </div>



                    <%-- /*into this div*/--%>


                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Visiting Areas
                            </div>
                            <div class="tools">
                                <a href="" class="collapse" data-original-title="" title=""></a>

                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <div class="portlet-body form">
        <form role="form">
            <div class="form-body">
                <div class="form-group">


                    <div class="radio-list" data-error-container="#form_2_membership_error">
                        <label>
                            <div class="radio">
                                <span class="checked">
                                    <input type="radio" name="membership" value="1" id="chk_warehouse1"></span>
                            </div>
                            WareHouse 1
                        </label>
                        <label>
                            </br>
												<div class="radio">
                                                    <span class="checked">
                                                        <input type="radio" name="membership" value="1" id="chk_warehouse2"></span>
                                                </div>
                            WareHouse 2
                        </label>
                        </br>
												<label>
                                                    <div class="radio">
                                                        <span class="checked">
                                                            <input type="radio" name="membership" value="1" id="chk_warehouse3"></span>
                                                    </div>
                                                    WareHouse 3
                                                </label>
                        </br>
                                                <label>
                                                    <div class="radio">
                                                        <span class="checked">
                                                            <input type="radio" name="membership" value="1" id="chk_canteen"></span>
                                                    </div>
                                                    Canteen
                                                </label>
                        </br>
                                                <label>
                                                    <div class="radio">
                                                        <span class="checked">
                                                            <input type="radio" name="membership" value="1" id="chk_admin"></span>
                                                    </div>
                                                    Admin
                                                </label>
                        </br>
                                                <label>
                                                    <div class="radio">
                                                        <span class="checked">
                                                            <input type="radio" name="membership" value="1" id="chk_carpark"></span>
                                                    </div>
                                                    Car Park
                                                </label>
                    </div>
                </div>






                <%-- /*into this div*/--%>




                                    </br>
                                    </br>

                                      <div class="portlet box blue">
                                          <div class="portlet-title">
                                              <div class="caption">
                                                  <i class="fa fa-gift"></i>Date and Time
                                              </div>
                                              <div class="tools">
                                                  <a href="" class="collapse" data-original-title="" title=""></a>

                                              </div>
                                          </div>
                                          <div class="portlet-body form">
                                              <form role="form">
                                                  <div class="form-body">
                                                      Date :
                                    </br>

									<div class="form-group">
                                        </br>
									
                                        <input id="arrivalDate" type="date" class="form-control form-control-inline input-medium date-picker"></input>

                                    </div>
                                                      </br>
                                    Time From :

                                    <div class="form-group">
                                        </br>
									
                                        <input id="firsttime" type="time" class="form-control form-control-inline input-medium date-picker"></input>



                                        <div class="form-group">
                                            </br>

                                            To :&nbsp;&nbsp;&nbsp;&nbsp;
        
                                        
                                        </br>
									
                                        <input id="secondtime" type="time" class="form-control form-control-inline input-medium date-picker"></input>



                                            <%-- /*into this div*/--%>
         
                     </br>
                                            </br>

                                            <div class="note note-success">
                                                <h4 class="block">Requester's comments</h4>
                                                <textarea class="form-control" rows="3" placeholder="Enter Comments" id="txtcomments"></textarea>
                                            </div>



                                            <button type="button" class="btn blue-madison">Submit</button>
                                        </div>
                                    </div>
                                                  </div>
                                          </div>
                                      </div>
            </div>
</asp:Content>
