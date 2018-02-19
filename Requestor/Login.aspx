<%@ Page Language="VB" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" title="Administrator/Technician Login" Theme="USofA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 100%;
        }
        .style17
        {
        text-align: right;
        width: 526px;
    }
        .style18
        {
            width: 225px;
        }
        .style19
        {
            width: 452px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="plLogin" runat="server" Visible="False" style="text-align: left">
        <table class="style16">
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                </td>
                <td class="style19">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="Username is required.">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" Width="77px"></asp:Label>
                </td>
                <td class="style19">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required.">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:Label ID="lblIncorrect" runat="server" EnableTheming="False" 
                        Font-Names="Corbel" Font-Size="20pt" ForeColor="Red" 
                        Text="Username or Password was incorrect." Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:ValidationSummary ID="vsLogin" runat="server" style="text-align: left" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:Button ID="btnLogin" runat="server" Height="38px" Text="Login" 
                        Width="87px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:SqlDataSource ID="dsAdmin" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" 
                        SelectCommand="SELECT * FROM [Administrators] WHERE (([Username] = @Username) AND ([Password] = @Password) AND ([Status] = @Status))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUsername" Name="Username" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtPassword" Name="Password" 
                                PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:SqlDataSource ID="dsTechnician" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" 
                        SelectCommand="SELECT * FROM [Technicians] WHERE (([Username] = @Username) AND ([Password] = @Password) AND ([Status] = @Status))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUsername" Name="Username" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtPassword" Name="Password" 
                                PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:SqlDataSource ID="sqlAdminExists" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" SelectCommand="SELECT * FROM [Administrators]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style19">
                    <asp:SqlDataSource ID="sqlInitialAdmin" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" InsertCommand="INSERT INTO Administrators(AdministratorID, Username, Password, Name, Email, Status)
VALUES(@AdministratorID, @Username, @Password, @Name, @Email, @Status)" 
                        SelectCommand="SELECT * FROM Administrators">
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
    </asp:Panel>
</asp:Content>

