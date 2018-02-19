<%@ Page Language="VB" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="false" CodeFile="Logged_Out.aspx.vb" Inherits="Logged_Out" title="Logged Out" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style10
        {
            width: 100%;
        }
        .style16
        {
            width: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style10">
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Label ID="lblLoggedOut1" runat="server" 
                    Text="You have been logged out!" EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="45pt" ForeColor="Red"></asp:Label>
                <br />
                <asp:Label ID="lblLoggedOut2" runat="server" 
                    Text="Have a good day." EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="45pt" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style16">
                &nbsp;</td>
            <td style="text-align: center">
                    <asp:Button ID="btnMain" runat="server" Height="45px" 
                    Text="Back to Main Page" Width="190px" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

