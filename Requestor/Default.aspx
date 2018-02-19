<%@ Page Language="VB" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" title="Requestor Main Page" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
        {
            width: 100%;
        }
        .style11
        {
            width: 415px;
            text-align: center;
        }
        .style12
        {
            text-align: justify;
        }
        .style13
        {
            width: 415px;
            text-align: justify;
        }
    .style14
    {
        width: 135px;
    }
    .style16
    {
        width: 724px;
        height: 192px;
    }
    .style17
    {
        width: 76px;
        text-align: justify;
        height: 192px;
    }
    .style18
    {
        width: 829px;
        text-align: center;
        height: 5px;
    }
    .style19
    {
        width: 829px;
        text-align: justify;
        height: 192px;
    }
    .style20
    {
        width: 724px;
        height: 11px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style10">
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                </td>
            <td class="style19">
                <asp:Panel ID="plWelcome" runat="server" BorderColor="Red" BorderStyle="Double" 
                    BorderWidth="10px" ForeColor="White" Font-Names="Corbel" 
                    Font-Size="X-Large">
                    Welcome to Requestor! This system is intended to provide all users the ability 
                    to submit a request so technicians may be able to fix any issues you may be 
                    having with a specific computer, software, or account. Please click the Continue 
                    button to begin submitting your request.
                </asp:Panel>
            </td>
            <td class="style17">
                </td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style18">
                <asp:Button ID="btnContinue" runat="server" Text="Continue" Height="44px" 
                    Width="101px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

