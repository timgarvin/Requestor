<%@ Page Title="Add/Update Departments" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="AddUpdate_Departments.aspx.vb" Inherits="AddUpdate_Department" Theme="USofA"%>

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
                <asp:Label ID="lblName" runat="server" Text="Department Name/Abbreviation:"></asp:Label>
                &nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ControlToValidate="txtName" 
                    ErrorMessage="Department Name/Abbreviation is required." 
                    ValidationGroup="DeptAdd">*</asp:RequiredFieldValidator>
                &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" Height="42px" 
                    Width="79px" ValidationGroup="DeptAdd" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ValidationSummary ID="vsDepartmentAdd" runat="server" 
                    ValidationGroup="DeptAdd" />
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="gvDepartments" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DepartmentID" 
                    DataSourceID="sqlDepartments" Width="472px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" ValidationGroup="DeptUpdate" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" ValidationGroup="DeptUpdate" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" ValidationGroup="DeptUpdate" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="DepartmentID" HeaderText="Department ID" 
                            ReadOnly="True" SortExpression="DepartmentID">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Name is required." 
                                    ValidationGroup="DeptUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
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
            <td>
                &nbsp;</td>
            <td>
                <asp:ValidationSummary ID="vsDepartmentUpdate" runat="server" 
                    ValidationGroup="DeptUpdate" />
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
                <asp:SqlDataSource ID="sqlDepartments" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DeleteCommand="DELETE FROM [Departments] WHERE [DepartmentID] = @original_DepartmentID AND [Name] = @original_Name AND [Status] = @original_Status" 
                    InsertCommand="INSERT INTO [Departments] ([DepartmentID], [Name], [Status]) VALUES (@DepartmentID, @Name, @Status)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Departments]" 
                    UpdateCommand="UPDATE [Departments] SET [Name] = @Name, [Status] = @Status WHERE [DepartmentID] = @original_DepartmentID AND [Name] = @original_Name AND [Status] = @original_Status">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DepartmentID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="original_DepartmentID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DepartmentID" Type="String" />
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" 
                            Type="String" />
                        <asp:Parameter Name="Status" Type="String" DefaultValue="Active" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                    <asp:SqlDataSource ID="sqlMaxID" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT DepartmentID FROM Departments ORDER BY DepartmentID" 
                    DataSourceMode="DataReader"></asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

