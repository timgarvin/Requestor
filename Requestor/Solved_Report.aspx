<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Solved_Report.aspx.vb" Inherits="Unsolved_Requests_Report" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solved Service Requests Report</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 341px;
        }
        .style4
        {
            width: 778px;
        }
        .style5
        {
            width: 400px;
        }
        .style6
        {
            width: 25px;
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
                    <td class="style6">
                        </td>
                    <td class="style2">
                        </td>
                    <td class="style4">
                        <CR:CrystalReportSource ID="crsSolved" runat="server">
                            <Report FileName="Solved_Report.rpt">
                                <Parameters>
                                    <CR:ControlParameter ControlID="txtStartDate" ConvertEmptyStringToNull="False" 
                                        DefaultValue="" Name="StartDate" PropertyName="Text" ReportName="" />
                                    <CR:ControlParameter ControlID="txtEndDate" ConvertEmptyStringToNull="False" 
                                        DefaultValue="" Name="EndDate" PropertyName="Text" ReportName="" />
                                </Parameters>
                            </Report>
                        </CR:CrystalReportSource>
                    </td>
                    <td class="style5">
                        <asp:HyperLink ID="hlLogOut" runat="server" Font-Bold="True" 
                            Font-Names="Comic Sans MS" Font-Size="Large" Font-Underline="True" 
                            ForeColor="Red" NavigateUrl="~/Logged_Out.aspx">Log Out</asp:HyperLink>
                    </td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Button ID="btnMain" runat="server" Text="Back to Main Page" 
                            Height="51px" />
                    </td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        Start Date:<asp:RequiredFieldValidator ID="rfvStartDate" runat="server" 
                            ControlToValidate="txtStartDate" 
                            ErrorMessage="You must select a Start Date on the Calendar." 
                            Font-Size="X-Large">*</asp:RequiredFieldValidator>
                            <asp:Calendar ID="calStartDate" runat="server" ShowGridLines="True" 
                                BorderColor="#0082C8" BorderStyle="Solid" BorderWidth="2px" Font-Names="Corbel" 
                                ForeColor="White">
                                <SelectedDayStyle BackColor="Red" ForeColor="White" />
                                <DayStyle BorderColor="#0082C8" Font-Names="Corbel" Font-Size="14pt" 
                                    ForeColor="#0082C8" />
                                <NextPrevStyle BackColor="Red" />
                                <DayHeaderStyle BorderColor="#0082C8" Font-Names="Corbel" Font-Size="16pt" 
                                    ForeColor="Red" />
                                <TitleStyle BackColor="Red" Font-Size="X-Large" />
                        </asp:Calendar>
                    </td>
                    <td class="style4">
                        <asp:Label ID="Label1" runat="server" 
                            Text="&lt;- Please select the range of dates to display in the report below. -&gt;"></asp:Label>
                    </td>
                    <td class="style5">
                        End Date:<asp:RequiredFieldValidator ID="rfvEndDate" runat="server" 
                            ControlToValidate="txtEndDate" 
                            ErrorMessage="You must select a End Date on the Calendar." 
                            Font-Size="X-Large">*</asp:RequiredFieldValidator>
                        <asp:Calendar ID="calEndDate" runat="server" ShowGridLines="True" 
                            BorderColor="#0082C8" BorderStyle="Solid" BorderWidth="2px" Font-Names="Corbel" 
                            ForeColor="White">
                            <SelectedDayStyle BackColor="Red" ForeColor="White" />
                            <DayStyle BorderColor="#0082C8" Font-Names="Corbel" Font-Size="14pt" 
                                ForeColor="#0082C8" />
                            <NextPrevStyle BackColor="Red" />
                            <DayHeaderStyle BorderColor="#0082C8" Font-Names="Corbel" Font-Size="16pt" 
                                ForeColor="Red" />
                            <TitleStyle BackColor="Red" Font-Size="X-Large" />
                        </asp:Calendar>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        <asp:TextBox ID="txtStartDate" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        <asp:TextBox ID="txtEndDate" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:ValidationSummary ID="vsSolved" runat="server" />
                    </td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Button ID="btnDisplay" runat="server" Height="46px" Text="Display Report" 
                            Width="148px" />
                    </td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style4">
                        &nbsp;</td>
                    <td class="style5">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <CR:CrystalReportViewer ID="crvSolved" runat="server" 
                AutoDataBind="true" DisplayGroupTree="False" 
                ReportSourceID="crsSolved" EnableDatabaseLogonPrompt="False" HasCrystalLogo="False" 
                HasToggleGroupTreeButton="False" Height="1036px" PrintMode="ActiveX" 
                Width="773px" Visible="False" />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
