<%@ Page Title="Add/Update Buildings" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="AddUpdate_Buildings.aspx.vb" Inherits="AddUpdate_Building" Theme="USofA"%>

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
            <asp:Label ID="lblName" runat="server" Text="Building Name:"></asp:Label>
            &nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Building Name is required." 
                    ValidationGroup="BuildingAdd">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" Height="38px" 
                    Width="87px" ValidationGroup="BuildingAdd" />
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
                <asp:ValidationSummary ID="vsBuildingAdd" runat="server" 
                    ValidationGroup="BuildingAdd" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: left">
                <asp:GridView ID="gvBuildings" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="BuildingID" DataSourceID="sqlBuildings" AllowPaging="True" 
                    AllowSorting="True" Width="466px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" ValidationGroup="BuildingUpdate" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" ValidationGroup="BuildingUpdate" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" ValidationGroup="BuildingUpdate" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BuildingID" HeaderText="Building ID" ReadOnly="True" 
                            SortExpression="BuildingID" >
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Name is required." 
                                    ValidationGroup="BuildingUpdate">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" EnableTheming="False" 
                                    Text='<%# Bind("Name") %>'></asp:Label>
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>' 
                                    EnableTheming="False"></asp:Label>
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
                <asp:ValidationSummary ID="vsBuildingUpdate" runat="server" 
                    ValidationGroup="BuildingUpdate" />
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
                <asp:SqlDataSource ID="sqlBuildings" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DeleteCommand="DELETE FROM [Buildings] WHERE [BuildingID] = @original_BuildingID AND [Name] = @original_Name AND [Status] = @original_Status" 
                    InsertCommand="INSERT INTO [Buildings] ([BuildingID], [Name], [Status]) VALUES (@BuildingID, @Name, @Status)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Buildings]" 
                    
                    UpdateCommand="UPDATE [Buildings] SET [Name] = @Name, [Status] = @Status WHERE [BuildingID] = @original_BuildingID AND [Name] = @original_Name AND [Status] = @original_Status">
                    <DeleteParameters>
                        <asp:Parameter Name="original_BuildingID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="original_BuildingID" Type="String" />
                        <asp:Parameter Name="original_Name" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BuildingID" Type="String" />
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
                    SelectCommand="SELECT BuildingID FROM Buildings ORDER BY BuildingID" 
                    DataSourceMode="DataReader"></asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

