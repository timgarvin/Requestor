<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Archive_Report.aspx.vb" Inherits="Archive_Report"%>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Archive Report</title>
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 291px;
        }
        .style2
        {
            width: 643px;
        }
        .fc96fb7bdc-cb06-43b0-ac46-5560772d4ace-0 {font-size:9pt;color:#000000;font-family:Times New Roman;font-weight:bold;text-decoration:underline;}
	.fc96fb7bdc-cb06-43b0-ac46-5560772d4ace-1 {font-size:13pt;color:#000000;font-family:Times New Roman;font-weight:normal;text-decoration:underline;}
	.fc96fb7bdc-cb06-43b0-ac46-5560772d4ace-2 {font-size:11pt;color:#000000;font-family:Times New Roman;font-weight:bold;}
	.fc96fb7bdc-cb06-43b0-ac46-5560772d4ace-3 {font-size:9pt;color:#000000;font-family:Times New Roman;font-weight:bold;}
	.fc96fb7bdc-cb06-43b0-ac46-5560772d4ace-4 {font-size:9pt;color:#000000;font-family:Times New Roman;font-weight:normal;}
	.add8c0622a-872d-462d-a927-07efb0644127-0 {border-color:#000000;border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:0;}
	.fcd3f035f3-2201-4645-8dfa-ce5842445a61-0 {font-size:13pt;color:#000000;font-family:Times New Roman;font-weight:normal;text-decoration:underline;}
	.fcd3f035f3-2201-4645-8dfa-ce5842445a61-1 {font-size:11pt;color:#000000;font-family:Times New Roman;font-weight:normal;}
	.fcd3f035f3-2201-4645-8dfa-ce5842445a61-2 {font-size:11pt;color:#000000;font-family:Times New Roman;font-weight:bold;text-decoration:underline;}
	.fcd3f035f3-2201-4645-8dfa-ce5842445a61-3 {font-size:11pt;color:#000000;font-family:Times New Roman;font-weight:bold;}
	    .style5
        {
            width: 291px;
            height: 22px;
        }
        .style6
        {
            width: 643px;
            height: 22px;
        }
        .style7
        {
            height: 22px;
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
        <asp:Panel ID="plReport" runat="server" HorizontalAlign="Center" 
            Enabled="False" Visible="False">
            <table class="style1">
                <tr>
                    <td class="style5">
                        </td>
                    <td class="style6">
                        <CR:CrystalReportSource ID="crsArchive" runat="server"><Report FileName="Archive_Report.rpt"></Report></CR:CrystalReportSource>
                    </td>
                    <td class="style7">
                        <asp:HyperLink ID="hlLogOut" runat="server" Font-Bold="True" 
                            Font-Names="Comic Sans MS" Font-Size="Large" Font-Underline="True" 
                            ForeColor="Red" NavigateUrl="~/Logged_Out.aspx">Log Out</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:Button ID="btnMain" runat="server" Text="Back to Main Page" 
                            Height="47px" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <CR:CrystalReportViewer ID="crvArchive" runat="server" AutoDataBind="true" 
                DisplayGroupTree="False" EnableDatabaseLogonPrompt="False" 
                EnableParameterPrompt="False" HasCrystalLogo="False" 
                HasToggleGroupTreeButton="False" PrintMode="ActiveX" 
                ReportSourceID="crsArchive" />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
