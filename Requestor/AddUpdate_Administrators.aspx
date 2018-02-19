<%@ Page Title="Register/Update Administrators" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="AddUpdate_Administrators.aspx.vb" Inherits="AddUpdate_Administrator" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100%;
        }
        .style17
    {
        width: 806px;
    }
    .style18
    {
        height: 11px;
        width: 806px;
    }
    .style19
    {
        width: 814px;
    }
    .style20
    {
        height: 11px;
        width: 814px;
    }
    .style21
    {
        width: 814px;
        height: 8px;
    }
    .style22
    {
        width: 806px;
        height: 8px;
    }
    .style23
    {
        height: 8px;
    }
    .style24
    {
        width: 806px;
        text-align: center;
    }
    .style25
    {
        width: 814px;
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
            <asp:Label ID="lblUsername" runat="server" Text="New Username:" 
                    style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="New Username is required." 
                    ValidationGroup="AdminAdd">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
            <asp:Label ID="lblPassword" runat="server" Text="New Password:" Width="200px" 
                    style="text-align: right"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="154px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="New Password is required." 
                    ValidationGroup="AdminAdd">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style20">
                </td>
            <td class="style18">
            <asp:Label ID="lblReEnter" runat="server" Text="Re-Enter New Password:" 
                    style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtReEnter" runat="server" TextMode="Password" Width="154px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReEnter" runat="server" 
                ControlToValidate="txtReEnter" 
                ErrorMessage="Re-Enter New Password is required." ValidationGroup="AdminAdd">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPasswords" runat="server" 
                    ControlToCompare="txtReEnter" ControlToValidate="txtPassword" 
                    ErrorMessage="The passwords entered do not match." 
                    ValidationGroup="AdminAdd">*</asp:CompareValidator>
            </td>
            <td class="style8">
                </td>
        </tr>
        <tr>
            <td class="style21">
                </td>
            <td class="style22">
            <asp:Label ID="lblName" runat="server" Text="Your Name:" style="text-align: right" 
                    Width="200px"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Your Name is required." 
                    ValidationGroup="AdminAdd">*</asp:RequiredFieldValidator>
            </td>
            <td class="style23">
                </td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" style="text-align: right" 
                    Width="200px"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                    ValidationGroup="AdminAdd">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
            <asp:ValidationSummary ID="vsAdminAdd" runat="server" 
                style="text-align: left" ValidationGroup="AdminAdd" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style24">
            <asp:Button ID="btnAdd" runat="server" Text="Add Administrator" Height="46px" 
                    Width="195px" ValidationGroup="AdminAdd" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style25">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                <asp:GridView ID="gvAdministrators" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="AdministratorID" 
                    DataSourceID="sqlAdministrators" HorizontalAlign="Left" Width="632px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" ValidationGroup="AdminUpdate" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" ValidationGroup="AdminUpdate" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" ValidationGroup="AdminUpdate" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AdministratorID" HeaderText="Administrator ID" 
                            ReadOnly="True" SortExpression="AdministratorID">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Username" SortExpression="Username">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                    ControlToValidate="txtUsername" ErrorMessage="Username is required." 
                                    ValidationGroup="AdminUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUsername" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password" SortExpression="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                                    ValidationGroup="AdminUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Name is required." 
                                    ValidationGroup="AdminUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                                    ValidationGroup="AdminUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" 
                                    SelectedValue='<%# Bind("Status") %>'>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td style="text-align: center" class="style17">
            <asp:ValidationSummary ID="vsAdminUpdate" runat="server" 
                style="text-align: left" ValidationGroup="AdminUpdate" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                <asp:SqlDataSource ID="sqlAdministrators" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DeleteCommand="DELETE FROM [Administrators] WHERE [AdministratorID] = @original_AdministratorID AND [Username] = @original_Username AND [Password] = @original_Password AND [Name] = @original_Name AND [Email] = @original_Email AND [Status] = @original_Status" 
                    InsertCommand="INSERT INTO [Administrators] ([AdministratorID], [Username], [Password], [Name], [Email], [Status]) VALUES (@AdministratorID, @Username, @Password, @Name, @Email, @Status)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Administrators]" 
                    UpdateCommand="UPDATE [Administrators] SET [Username] = @Username, [Password] = @Password, [Name] = @Name, [Email] = @Email, [Status] = @Status WHERE [AdministratorID] = @original_AdministratorID AND [Username] = @original_Username AND [Password] = @original_Password AND [Name] = @original_Name AND [Email] = @original_Email AND [Status] = @original_Status">
                    <DeleteParameters>
                        <asp:Parameter Name="original_AdministratorID" Type="String" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="original_AdministratorID" Type="String" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AdministratorID" Type="String" />
                        <asp:ControlParameter ControlID="txtUsername" Name="Username" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="Password" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" 
                            Type="String" />
                        <asp:Parameter Name="Status" DefaultValue="Active" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style19">
                &nbsp;</td>
            <td class="style17">
                    <asp:SqlDataSource ID="sqlMaxID" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT AdministratorID FROM Administrators ORDER BY AdministratorID" 
                    DataSourceMode="DataReader"></asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

