<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Setup_ChangeAdmin.aspx.vb" Inherits="Setup_ChangeAdmin" title="Initial Setup: Change Default Administrator Account" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style13
    {
        width: 100%;
    }
    .style14
    {
        height: 24px;
    }
    .style15
    {
        width: 326px;
    }
    .style16
    {
        height: 24px;
        width: 326px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblUsername" runat="server" Text="New Username:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="New Username is required.">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblPassword" runat="server" Text="New Password:" Width="200px" 
                style="text-align: right"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="149px" 
                MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="New Password is required.">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblReEnter" runat="server" Text="Re-Enter New Password:" 
                Width="200px" style="text-align: right"></asp:Label>
            <asp:TextBox ID="txtReEnter" runat="server" TextMode="Password" Width="149px" 
                MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReEnter" runat="server" 
                ControlToValidate="txtReEnter" 
                ErrorMessage="Re-Enter New Password is required.">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblName" runat="server" Text="Your Name:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Your Name is required.">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" style="text-align: right" 
                Width="200px"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Email is required.">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:ValidationSummary ID="vsChangeAdmin" runat="server" 
                style="text-align: left" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
        </td>
        <td class="style14">
            &nbsp;</td>
        <td class="style14">
        </td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnChange" runat="server" Text="Change Login" Height="40px" 
                Width="140px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnContinue" runat="server" CausesValidation="False" 
                Height="43px" Text="Continue" Visible="False" Width="118px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style15">
            &nbsp;</td>
        <td>
            <asp:SqlDataSource ID="sqlChange" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" InsertCommand="INSERT INTO Administrators(AdministratorID, Username, Password, Name, Email, Status)
VALUES(@AdministratorID, @Username, @Password, @Name, @Email, @Status)" 
                SelectCommand="SELECT * FROM Administrators" 
                UpdateCommand="UPDATE Administrators SET Username = @Username, Password = @Password, Name = @Name WHERE AdministratorID = @AdministratorID">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtUsername" Name="Username" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtPassword" Name="Password" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" />
                    <asp:Parameter DefaultValue="1000" Name="AdministratorID" />
                    <asp:ControlParameter ControlID="txtEmail" Name="newparameter" 
                        PropertyName="Text" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="AdministratorID" />
                    <asp:Parameter Name="Username" />
                    <asp:Parameter Name="Password" />
                    <asp:Parameter Name="Name" />
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Status" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>

