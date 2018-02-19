<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Results.aspx.vb" Inherits="Results" Theme="USofA"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submission Results</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                </td>
                <td class="style2" style="text-align: center">
                    <asp:Label ID="lblResult" runat="server" EnableTheming="False" 
                        Font-Names="Corbel" Font-Size="35pt" ForeColor="Red"></asp:Label>
                </td>
                <td class="style2">
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
                    <asp:Button ID="btnMain" runat="server" Height="42px" Text="Back to Main Page" 
                        Visible="False" Width="190px" />
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
                <td style="text-align: center">
                    <asp:Button ID="btnPrevious" runat="server" Height="42px" 
                        PostBackUrl="Default.aspx" Text="Previous Page" Visible="False" 
                        Width="128px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
