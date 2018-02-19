<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Setup_AddTechnicians.aspx.vb" Inherits="Setup_AddTechnicians" title="Initial Setup: Register Technicians" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style13
    {
        width: 100%;
    }
    .style14
    {
        text-align: center;
    }
        .style15
        {
            text-align: left;
        }
        .style16
        {
            width: 266px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblBuilding" runat="server" Text="Technician's Building:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:DropDownList ID="ddlBuildings" runat="server" DataSourceID="sqlBuildings" 
                DataTextField="Name" DataValueField="BuildingID">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBuilding" runat="server" 
                ControlToValidate="ddlBuildings" 
                ErrorMessage="A building must be selected to continue." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblUsername" runat="server" Text="Username:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                ControlToValidate="txtUsername" ErrorMessage="Username is required." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblPassword" runat="server" Text="Password:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblReEnter" runat="server" Text="Re-Enter Password:" 
                style="text-align: right" Width="200px"></asp:Label>
            <asp:TextBox ID="txtReEnter" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvReEnter" runat="server" 
                ControlToValidate="txtReEnter" 
                ErrorMessage="Re-Enter Password is required." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPasswords" runat="server" 
                ControlToCompare="txtReEnter" ControlToValidate="txtPassword" 
                ErrorMessage="The passwords entered do not match." 
                ValidationGroup="TechAdd">*</asp:CompareValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblName" runat="server" Text="Name:" style="text-align: right" 
                Width="200px"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="txtName" 
                ErrorMessage="Name is required." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" style="text-align: right" 
                Width="200px"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="txtEmail" 
                ErrorMessage="Email is required." 
                ValidationGroup="TechAdd">*</asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:ValidationSummary ID="vsTechnicianAdd" runat="server" 
                style="text-align: left" ValidationGroup="TechAdd" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style14">
                &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnAdd" runat="server" Text="Add" Height="40px" Width="84px" 
                ValidationGroup="TechAdd" />
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
        <td class="style15">
            <asp:Button ID="btnContinue" runat="server" Text="Continue" Height="44px" 
                Width="111px" CausesValidation="False" />
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
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td class="style15">
            <asp:GridView ID="gvTechnicians" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TechnicianID" 
                DataSourceID="sqlTechnicians">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" ValidationGroup="TechUpdate" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" ValidationGroup="TechUpdate" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" ValidationGroup="TechUpdate" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TechnicianID" HeaderText="Technician ID" 
                        ReadOnly="True" SortExpression="TechnicianID" />
                    <asp:TemplateField HeaderText="Building" SortExpression="BuildingID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlBuildings" runat="server" DataSourceID="sqlBuildings" 
                                DataTextField="Name" DataValueField="BuildingID" SelectedValue='<%# Bind("BuildingID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("BuildingID") %>' 
                                Font-Names="Corbel" Font-Size="X-Large"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username" SortExpression="Username">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUsername" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ControlToValidate="txtUsername" ErrorMessage="Username is required." 
                                ValidationGroup="TechUpdate">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Password" SortExpression="Password">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="Password is required." 
                                ValidationGroup="TechUpdate">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>' 
                                Font-Names="Corbel" Font-Size="X-Large"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required." 
                                ValidationGroup="TechUpdate">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                                ValidationGroup="TechUpdate">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Status") %>' 
                                Font-Names="Corbel" Font-Size="X-Large"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:ValidationSummary ID="vsTechnicianUpdate" runat="server" 
                ValidationGroup="TechUpdate" />
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
        <td>
            <asp:SqlDataSource ID="sqlTechnicians" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                DeleteCommand="DELETE FROM [Technicians] WHERE [TechnicianID] = @original_TechnicianID AND [BuildingID] = @original_BuildingID AND [Username] = @original_Username AND [Password] = @original_Password AND [Name] = @original_Name AND [Email] = @original_Email AND [Status] = @original_Status" 
                InsertCommand="INSERT INTO [Technicians] ([TechnicianID], [BuildingID], [Username], [Password], [Name], [Email], [Status]) VALUES (@TechnicianID, @BuildingID, @Username, @Password, @Name, @Email, @Status)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [Technicians]" 
                UpdateCommand="UPDATE [Technicians] SET [BuildingID] = @BuildingID, [Username] = @Username, [Password] = @Password, [Name] = @Name, [Email] = @Email, [Status] = @Status WHERE [TechnicianID] = @original_TechnicianID AND [BuildingID] = @original_BuildingID AND [Username] = @original_Username AND [Password] = @original_Password AND [Name] = @original_Name AND [Email] = @original_Email AND [Status] = @original_Status">
                <DeleteParameters>
                    <asp:Parameter Name="original_TechnicianID" Type="String" />
                    <asp:Parameter Name="original_BuildingID" Type="String" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BuildingID" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="original_TechnicianID" Type="String" />
                    <asp:Parameter Name="original_BuildingID" Type="String" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Email" Type="String" />
                    <asp:Parameter Name="original_Status" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="TechnicianID" Type="String" />
                    <asp:ControlParameter ControlID="ddlBuildings" Name="BuildingID" 
                        PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="txtUsername" Name="Username" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPassword" Name="Password" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" 
                        Type="String" />
                    <asp:Parameter Name="Status" DefaultValue="Active" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:SqlDataSource ID="sqlBuildings" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:SqlDataSource ID="sqlMaxID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT TechnicianID FROM Technicians ORDER BY TechnicianID">
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style16">
            &nbsp;</td>
        <td>
            <asp:SqlDataSource ID="sqlTechniciansActive" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT * FROM [Technicians] WHERE ([Status] = @Status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>

