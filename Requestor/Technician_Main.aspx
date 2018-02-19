<%@ Page Language="VB" MasterPageFile="~/Technician_MasterPage.master" AutoEventWireup="false" CodeFile="Technician_Main.aspx.vb" Inherits="Technician_Main" title="Technician Main Page" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 154px;
        }
        .style7
        {
            width: 562px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style7">
                <asp:Panel ID="plWelcome" runat="server" BorderColor="Red" BorderStyle="Double" 
                    BorderWidth="10px" ForeColor="White" style="text-align: justify" 
                    Font-Names="Corbel" Font-Size="X-Large">
                    <div>
                        Welcome to the main hub of the Technician portion of this site. There are plenty 
                        of available options for you to manage, view, and find information for this 
                        service request system. There&#39;s also various reports that you may view/print and 
                        plenty of help if you find yourself stuck in a rut. Feel free to use the menu 
                        provided to the left to navigate around for your convenience.</div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

