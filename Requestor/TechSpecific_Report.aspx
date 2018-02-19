<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TechSpecific_Report.aspx.vb" Inherits="Unsolved_Requests_Report" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unsolved Pending Service Requests (Technician Specific)</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 643px;
        }
        .style3
        {
            width: 291px;
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
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style2">
                        <CR:CrystalReportSource ID="crsUnsolved" runat="server">
                            <Report FileName="TechSpecific_Report.rpt">
                                <Parameters>
                                    <CR:ControlParameter ControlID="" ConvertEmptyStringToNull="False" 
                                        DefaultValue="" Name="Building ID" PropertyName="" ReportName="" />
                                </Parameters>
                            </Report>
                        </CR:CrystalReportSource>
                    </td>
                    <td>
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
            <CR:CrystalReportViewer ID="crvUnsolved" runat="server" 
                AutoDataBind="true" DisplayGroupTree="False" 
                ReportSourceID="crsUnsolved" EnableDatabaseLogonPrompt="False" 
                EnableParameterPrompt="False" HasCrystalLogo="False" 
                HasToggleGroupTreeButton="False" Height="1036px" PrintMode="ActiveX" 
                Width="773px" />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
