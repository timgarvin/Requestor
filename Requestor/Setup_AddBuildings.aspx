<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Setup_AddBuildings.aspx.vb" Inherits="Setup_AddBuildings" title="Initial Setup: Add Buildings" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style13
    {
        width: 100%;
    }
    .style14
    {
        width: 120px;
    }
    .style15
    {
        width: 701px;
        text-align: left;
    }
    .style16
    {
        width: 701px;
        text-align: center;
    }
        .style17
        {
            width: 701px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style17">
            <asp:Label ID="lblName" runat="server" Text="Building Name:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" MaxLength="200"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Building Name is required." 
                ValidationGroup="BuildingAdd">*</asp:RequiredFieldValidator>
            &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" Height="37px" 
                Width="81px" ValidationGroup="BuildingAdd" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style17">
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style15">
                <asp:ValidationSummary ID="vsBuildingAdd" runat="server" 
                    ValidationGroup="BuildingAdd" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style16">
                &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            </td>
        <td class="style16">
            <asp:Button ID="btnContinue" runat="server" Text="Continue" Height="42px" 
                Width="105px" CausesValidation="False" />
            </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style16">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
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
        <td class="style16">
            <asp:GridView ID="gvBuildings" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BuildingID" 
                DataSourceID="sqlBuildings" BorderColor="White" Width="706px">
                <RowStyle BorderColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" ValidationGroup="BuildingUpdate" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" ValidationGroup="BuildingUpdate" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" BackColor="Red" BorderColor="White" 
                                CausesValidation="False" CommandName="Edit" Font-Bold="True" 
                                Font-Names="Corbel" Font-Size="14pt" ForeColor="White" 
                                style="text-align: right" Text="Edit" ValidationGroup="BuildingUpdate" 
                                Width="62px" />
                        </ItemTemplate>
                        <FooterStyle BorderColor="White" ForeColor="White" />
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle BorderColor="White" HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="BuildingID" HeaderText="Building ID" ReadOnly="True" 
                        SortExpression="BuildingID" >
                        <FooterStyle BorderColor="White" />
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle BorderColor="White" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="Name is required." 
                                ValidationGroup="BuildingUpdate">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterStyle BorderColor="White" />
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle BorderColor="White" HorizontalAlign="Center" />
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
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>' 
                                Font-Names="Corbel" Font-Size="X-Large" ForeColor="White"></asp:Label>
                        </ItemTemplate>
                        <FooterStyle BorderColor="White" />
                        <HeaderStyle BorderColor="White" />
                        <ItemStyle BorderColor="White" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BorderColor="White" Font-Names="Bauhaus 93" Font-Size="Large" 
                    ForeColor="Red" HorizontalAlign="Center" />
                <HeaderStyle Font-Names="Comic Sans MS" Font-Size="14pt" ForeColor="Red" 
                    BackColor="White" />
                <EditRowStyle BorderColor="White" />
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style15">
            <asp:ValidationSummary ID="vsBuildingUpdate" runat="server" 
                ValidationGroup="BuildingUpdate" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
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
        <td class="style17">
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
                    <asp:Parameter DefaultValue="Active" Name="Status" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style17">
            <asp:SqlDataSource ID="sqlMaxID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT BuildingID FROM Buildings ORDER BY BuildingID"></asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
        <td class="style17">
            <asp:SqlDataSource ID="sqlBuildingsActive" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT * FROM [Buildings] WHERE ([Status] = @Status)">
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

