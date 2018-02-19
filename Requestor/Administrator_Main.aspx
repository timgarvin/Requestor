<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Administrator_Main.aspx.vb" Inherits="Admin_Main" title="Administrator Main Page" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100%;
        }
    .style14
    {
        width: 335px;
    }
    .style15
    {
        width: 529px;
    }
    .style16
    {
        width: 335px;
        height: 96px;
    }
    .style17
    {
        width: 529px;
        height: 96px;
    }
    .style18
    {
        height: 96px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style14">
                &nbsp;</td>
            <td class="style15">
                <asp:Panel ID="plWelcome" runat="server" BorderColor="Red" BorderStyle="Double" 
                    BorderWidth="10px" ForeColor="White" Font-Names="Corbel" 
                    Font-Size="X-Large">
                    <div class="style19">
                        Welcome to the main hub of the Administrator portion of this site. There are 
                        plenty of available options for you to manage, view, and find information for 
                        this service request system. There&#39;s also various reports that you may 
                        view/print and plenty of help if you find yourself stuck in a rut. Feel free to 
                        use the menu provided to the left to navigate around for your convenience.</div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

