<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help_CancelRequest.aspx.vb" Inherits="Help_CancelRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canceling a Request Help</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
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
        <asp:Panel ID="plCancelRequest" runat="server" Enabled="False" Visible="False">
            <table class="style1">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Label ID="lblSubmissionHelp" runat="server" Font-Names="Corbel" 
                        Font-Size="55pt" Text="Canceling a Request"></asp:Label>
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
                        <asp:Panel ID="plCancelRequestHelp" runat="server" Font-Names="Corbel" 
                Font-Size="20pt">
                            The page this help page is for:
                            <asp:HyperLink ID="hlCancelRequest" runat="server" 
                                NavigateUrl="~/CancelUpdate_Requests.aspx" 
                                style="color: #0000FF; text-decoration: underline">Canceling a Request</asp:HyperLink>
                            <br />
                            <br />
                            This is actually very simple, but easily missed at the same time (thus this Help 
                            page). This is for canceling a request in the case that the person who made the 
                            request suddenly found a solution to the problem themselves or from any other 
                            reason that could apply.<br />
                            <br />
                            To start off simply click the Edit button for the request you would like 
                            canceled in the provided table listing all requests.<br />
                            <br />
                            At the very end of the table is the column Status which gives you 3 options to 
                            choose from: Solved, Unsolved, and of course Canceled. To cancel the request 
                            simply select the Canceled option and click the Update button back at the 
                            beginning of the table. If all goes well, that should have updated the data to 
                            show the request as now canceled.</asp:Panel>
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
