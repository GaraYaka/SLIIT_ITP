<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddVehicle.aspx.cs" Inherits="SLIIT.ITP.UI.VF.AddVehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

        <table class="spacedTable">
        <tbody>
            <tr>
                <th>Add Vehicle</th>
            </tr>
            <tr>
                <td>Vehicle Number:</td>
                <td><input type="text" /></td>
            </tr>
            <tr>
                <td>Vehicle Year:</td>
                <td><input type="date" /></td>
            </tr>
            <tr>
                <td>Vehicle Name/ Model:&emsp;</td>
                <td><select id="optVehicleMake"><option value="1">Honda</option><option value="2">Toyota</option><option value="3">Isuzu</option><option value="4">Mitsubishi</option> </select></td>
            </tr>
            <tr>
                <td>Registration Number:</td>
                <td><input type="text" /></td>
            </tr>
            <tr>
                <td>Province:</td>
                <td><input type="text" /></td>
            </tr>
            <tr>
                <td>Mileage:</td>
                <td><input type="text" /></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><select id="optStatus"><option value="1">Available</option><option value="2">Unavailable</option><option value="3">Maintenance</option> </select></td>
            </tr>
            <tr>
                <td>Additional info:</td>

                <td>
                    <input type="text" />
                </td>
            </tr>
        </tbody>
    </table>


</asp:Content>
