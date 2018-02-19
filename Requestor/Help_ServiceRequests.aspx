<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help_ServiceRequests.aspx.vb" Inherits="Help_ServiceRequests" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Requests Submission Help</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-decoration: underline;
            font-weight: bold;
        }
        .style3
        {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Label ID="lblSubmissionHelp" runat="server" Font-Names="Corbel" 
                        Font-Size="55pt" Text="Service Requests Submission"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="btnMain" runat="server" BackColor="#E5E5E5" 
                        EnableTheming="False" Height="48px" Text="Back to Main Page" Width="200px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Panel ID="plSRHelp" runat="server" Font-Names="Corbel" Font-Size="20pt">
                        The page this help page is for:
                        <asp:HyperLink ID="hlServiceRequests" runat="server" 
                            NavigateUrl="~/Service_Requests.aspx">Service Requests Submission</asp:HyperLink>
                        <br />
                        <br />
                        This page is definitely the most important of all the pages located on 
                        Requestor. This is the main hub for where all users can go to submit what their 
                        computer-related issue is directly to the Technicians and Administrators who 
                        will help get these problems solved for you.<br />
                        <br />
                        &quot;<span class="style2">Temporarily Under Construction</span>&quot;? - This simply 
                        means that there is some needed information missing in order to allow for 
                        submitting and receiving Service Requests. More than likely the moment you would 
                        see this message is the moment it is being set up by an Administrator and should 
                        soon allow anyone to gain access after the Administrator has submitted all the 
                        needed information.<br />
                        <br />
                        <span class="style3"><b>Service Request #</b></span> - This needs no user entry. 
                        This simply loads the Service Request # for the new submission you are about to 
                        make. It is a good idea to write this number down for future reference.<br />
                        <br />
                        <span class="style3"><b>Building</b></span> - Select the building for where the 
                        issue you are having is located.<br />
                        <br />
                        <span class="style3"><b>Department</b></span> - Select the department for where 
                        the issue is located, and if not identifiable by department simply select the 
                        department you yourself are part of.<br />
                        <br />
                        <span class="style3"><b>Room #</b></span> - Enter the room number for where the 
                        issue is located.<br />
                        <br />
                        <span class="style3"><b>Issue Type</b></span> - Select whether it is a hardware, 
                        software, new account(s), or account problems issue.<br />
                        <br />
                        <span class="style3"><b>Inventory/Computer #</b></span> - This may not always be 
                        applicable so it is optional. Enter the inventory or computer number of the 
                        problem hardware here (the computer number is often on a label attached to the 
                        computer somewhere).<br />
                        <br />
                        <span class="style3"><b>Your name</b></span> - Enter your name here. This and 
                        the following entries save for the Description of the Problem and Priority Level 
                        are used for possible need to contact in case the Technician needs to ask 
                        questions.<br />
                        <br />
                        <span class="style3"><b>Phone # or Extension</b></span> - Enter the phone number 
                        or extension that you may be contacted by here.<br />
                        <br />
                        <span class="style3"><b>Email Address</b></span> - Enter the email address that 
                        you may be contacted by here.<br />
                        <br />
                        <span class="style3"><b>Priority Level</b></span> - Select the priority level 
                        that is a measure of the urgency of the problem so the Technicians may get to 
                        the people who need immediate action first.<br />
                        <br />
                        <span class="style3"><b>Description of Problem</b></span> - Describe what the 
                        issue is. Plenty of room has been made available for this entry (1,500 
                        letters/numbers/special characters) so please be as detailed as possible.<br />
                        <br />
                        Once you feel satisfied with the entered data feel free to go ahead and click 
                        the Submit button to send the request.
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
