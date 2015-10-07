<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewPass.aspx.cs" Inherits="SLIIT.ITP.UI.GP.NewPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">












    <div style="height: 264px; width: 797px">
       
        <div class="alert alert-success" style="width: 670px">
								<strong>Common Details</strong> 
							</div>
      
        <table class="table table-bordered table-hover" style="width:75%;">




            <tr>
                <td class="k-formatBlock" style="width: 166px">Company Name</td>
                <td style="width: 270px">
                    <asp:TextBox ID="txt_com" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_com" ErrorMessage="Enter Company Name" ForeColor="Red" ValidationGroup="p"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px">Address</td>
                <td style="width: 270px">
                    <asp:TextBox ID="txt_addr" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_addr" ErrorMessage="Enter Address" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px; height: 27px;">Official Telephone</td>
                <td style="height: 27px; width: 270px">
                    <asp:TextBox ID="txt_tp" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td style="height: 27px">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_tp" ErrorMessage="Invalid Phone No" ForeColor="Red" ValidationExpression="^\(?0\d{2}\)?[\s\-]?\d{7}$" ValidationGroup="p"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px">Email</td>
                <td style="width: 270px">
                    <asp:TextBox ID="txtmail" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="p"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px">Reason </td>
                <td style="width: 270px">
                    <asp:TextBox ID="txt_reason" runat="server" Width="250px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_reason" ErrorMessage="Enter Reason" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px">Approving Authority</td>
                <td style="width: 270px">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="k-formatBlock" style="width: 166px">Visiting Area</td>
                <td style="width: 270px">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="250px">
                        <asp:ListItem Value="1">WAREHOUSE 1</asp:ListItem>
                        <asp:ListItem Value="2">WAREHOUSE2</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
    </br>
   
      <div class="alert alert-warning" style="width: 670px">
								<strong>Date & Time</strong> 
							</div>

        <table style="width: 72%; height: 100px; margin-top: 0px;" >
            <tr>
                <td class="k-fontName" style="width: 62px">Date :</td>
                <td class="k-fontSize" style="width: 89px">
                    <asp:TextBox ID="txt_date" Type="date" runat="server" Width="225px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="k-fontName" style="width: 62px">&nbsp;</td>
                <td class="k-fontSize" style="width: 89px">&nbsp;</td>
            </tr>
            <tr>
                <td class="k-fontName" style="width: 62px">From :</td>
                <td class="k-fontSize" style="width: 89px">
                    <asp:TextBox ID="txt_from" type="time" runat="server" Width="189px"></asp:TextBox>
                </td>
                <td class="k-fontSize" style="width: 38px">TO :</td>
                <td>
                    <asp:TextBox ID="txt_timeto" type="time" runat="server" Width="183px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="k-fontName" style="width: 62px">&nbsp;</td>
                <td class="k-fontSize" style="width: 89px">&nbsp;</td>
            </tr>
        </table>
    </br>
    
        
             <div class="alert alert-info" style="width: 670px">
								<strong>Visitor Details</strong>
							</div>


    <div style="height: 106px; margin-top: 22px">


        <table style="width: 62%;">
            <tr>
                <td style="width: 244px">Name:</td>
                <td>NIC:</td>
            </tr>
            <tr>
                <td style="width: 244px">
                    <asp:TextBox ID="txt_name" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txt_nic" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 244px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_name" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_nic" ErrorMessage="Invalid NIC" ForeColor="Red" ValidationExpression="^\d{9}(X|V)$" ValidationGroup="p"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>


    </div>



 <div class="alert alert-warning" style="width: 670px; height: 78px;">
								<strong>&nbsp;<br />
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Proceed" Width="193px" />
                                <br />
                                <asp:DropDownList ID="DropDown_status" runat="server" Height="21px" Width="183px" Enabled="False" style="margin-bottom: 10px" Visible="False">
                                    <asp:ListItem>Pending</asp:ListItem>
                                    <asp:ListItem>Approved</asp:ListItem>
                                    <asp:ListItem>Rejected</asp:ListItem>
                                </asp:DropDownList>




								<br />
                                <br />
                                <br />
                                <br />
                                <br />




								</strong>
							</div>



    </asp:Content>
