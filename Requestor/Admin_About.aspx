<%@ Page Title="About" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Admin_About.aspx.vb" Inherits="Admin_About" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblCreatedBy" runat="server" Text="Created by:" 
                    EnableTheming="False" Font-Names="Corbel" Font-Size="X-Large" 
                    Font-Underline="True" ForeColor="White"></asp:Label>
                <asp:Label ID="lblName" runat="server" EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="White" Text="Tim Garvin"></asp:Label>
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
            <td>
                <asp:Label ID="lblVersion" runat="server" Text="Version:" EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="X-Large" Font-Underline="True" ForeColor="White"></asp:Label>
                <asp:Label ID="lblVersionNum" runat="server" EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="White" Text="0.5"></asp:Label>
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
            <td>
                <asp:Label ID="lblDateCompleted" runat="server" Text="Date of Completion:" 
                    EnableTheming="False" Font-Names="Corbel" Font-Size="X-Large" 
                    Font-Underline="True" ForeColor="White"></asp:Label>
                <asp:Label ID="lblDate" runat="server" EnableTheming="False" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="White">April 26, 2010</asp:Label>
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
            <td>
                <asp:Label ID="lblDescription" runat="server" 
                    Text="Description:" EnableTheming="False" Font-Names="Corbel" 
                    Font-Size="X-Large" Font-Underline="True" ForeColor="White"></asp:Label>
                <asp:Label ID="lblParagraph" runat="server" Font-Names="Corbel" 
                    Font-Size="X-Large" Font-Underline="False" ForeColor="White" 
                    
                    Text="Welcome to Requestor! The service request system that provides you with all the needed abilities and convenience to submit requests and manage that information. All requests submitted on this site are seen directly by the Technicians and acted upon as soon as possible. The website is meant to provide a service to the institution who implements it and of course the users who need it to easily streamline the process of providing information to the Technicians that solve their computer woes. Having computer-related problems at the institution currently using this website and want to talk straight to the Technicians who can fix it? This is the place to be!" 
                    EnableTheming="False" style="text-align: justify"></asp:Label>
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
            <td>
                <asp:Label ID="lblCopyright" runat="server" Text="© Copyright 2010" 
                    EnableTheming="False" Font-Names="Corbel" Font-Size="X-Large" ForeColor="White"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

