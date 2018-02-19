<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help_AddSolution.aspx.vb" Inherits="Help_AddSolution" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Solution Help</title>
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
        .style4
        {
            font-size: 25pt;
            font-weight: bold;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Panel ID="plRestricted" runat="server">
        <table class="style1">
            <tr>
                <td>
                    <asp:Label ID="lblRestricted" runat="server" Font-Size="55pt" ForeColor="Red" 
                        style="text-align: left" 
                        Text="Forbidden. You have attempted to enter a restricted area."></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <asp:Panel ID="plAddSolution" runat="server" Enabled="False" Visible="False">
            <table class="style1">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Label ID="lblSubmissionHelp" runat="server" Font-Names="Corbel" 
                        Font-Size="55pt" Text="Adding a Solution"></asp:Label>
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
                        EnableTheming="False" Height="48px" Text="Back to Main Page" 
                Width="200px" />
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
                    <td style="text-align: left">
                        <asp:Panel ID="plAddSolutionHelp" runat="server" Font-Names="Corbel" 
                Font-Size="20pt">
                            The page this help page is for:
                            <asp:HyperLink ID="hlAddSolution" runat="server" 
                                NavigateUrl="~/Add_Solution.aspx" 
                                style="color: #0000FF; text-decoration: underline">Adding a Solution</asp:HyperLink>
                            <br />
                            <br />
                            Easily the most important page for any Technician...the page used to indicate a 
                            service request has been completed and what the solution was. This page will 
                            allow you to submit this important information.<br />
                            <br />
                            <span class="style2">Request ID</span> - Enter the Request ID for the service 
                            request here.<br />
                            <br />
                            <span class="style3"><b>Show Details button</b></span> - This button is 
                            optional. When clicked this button will display the details of the service 
                            request in question.<br />
                            <br />
                            <span class="style3"><b>Select the Date Completed</b></span> - Select the day on 
                            the calendar for when this request was solved.<br />
                            <br />
                            <span class="style4">Time Completed</span>:<br />
                            This section is for entering when you found the solution to the issue.<br />
                            <br />
                            <span class="style3"><b>Hour</b></span> - Enter the hour (01-12) for when the 
                            request was solved.<br />
                            <br />
                            <span class="style3"><b>Minute</b></span> - Enter the minute (00-59) for when 
                            the request was solved.<br />
                            <br />
                            <span class="style3"><b>AM/PM</b></span> - Select whether the request was solved 
                            in the AM or PM time of day.<br />
                            <br />
                            <span class="style3"><b>Solution to Completed Request</b></span> - Enter the 
                            solution for the completed request here (description of how the issue was 
                            remedied). A 1,500 letter/number/special character limit is used for this box so 
                            feel free to be as detailed as possible.<br />
                            <br />
                            Once you feel satisfied with the entered data feel free to go ahead and click 
                            the Submit button to add the solution to the request.</asp:Panel>
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
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
