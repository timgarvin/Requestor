<%@ Page Title="Cancel/Update Requests" Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="CancelUpdate_Requests.aspx.vb" Inherits="Update_Requests" Theme="USofA"%>

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
                <asp:GridView ID="gvServiceRequests" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlRequests" Width="1535px">
                    <RowStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" ReadOnly="True" 
                            SortExpression="RequestID" />
                        <asp:TemplateField HeaderText="Building" SortExpression="BuildingID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlBuilding" runat="server" DataSourceID="sqlBuildings" 
                                    DataTextField="Name" DataValueField="BuildingID" 
                                    SelectedValue='<%# Bind("BuildingID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("BuildingID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDepartment" runat="server" 
                                    DataSourceID="sqlDepartments" DataTextField="Name" 
                                    DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Room #" SortExpression="RoomNum">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRoomNum" runat="server" Text='<%# Bind("RoomNum") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvRoomNum" runat="server" 
                                    ControlToValidate="txtRoomNum" ErrorMessage="Room # is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("RoomNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Inventory #" SortExpression="InventoryNum">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtInventoryNum" runat="server" 
                                    Text='<%# Bind("InventoryNum") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("InventoryNum") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Requested" SortExpression="RequestDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDateRequested" runat="server" Text='<%# Bind("RequestDate") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDateRequested" runat="server" 
                                    ControlToValidate="txtDateRequested" ErrorMessage="Date Requested is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" 
                                    Text='<%# Bind("RequestDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type of Request" SortExpression="RequestType">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlReqType" runat="server" SelectedValue='<%# Bind("RequestType") %>'>
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="Hardware">Hardware</asp:ListItem>
                                    <asp:ListItem Value="Software">Software</asp:ListItem>
                                    <asp:ListItem Value="New Account(s)">New Account(s)</asp:ListItem>
                                    <asp:ListItem Value="Account Problems">Account Problems</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRequestType" runat="server" 
                                    ControlToValidate="ddlReqType" 
                                    ErrorMessage="Type of Request must be selected.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("RequestType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Requestor's Name" SortExpression="RequestorName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("RequestorName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Requestor's Name is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("RequestorName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone #" SortExpression="RequestorPhone">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("RequestorPhone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" ErrorMessage="Phone # is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:(###) ###-####}", Convert.ToInt64(DataBinder.Eval(Container.DataItem, "RequestorPhone"))) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="RequestorEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("RequestorEmail") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Email is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("RequestorEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Priority Level" SortExpression="PriorityLevel">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPriority" runat="server" SelectedValue='<%# Bind("PriorityLevel") %>'>
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="1">1-Emergency</asp:ListItem>
                                    <asp:ListItem Value="2">2-ASAP</asp:ListItem>
                                    <asp:ListItem Value="3">3-Date Sensitive</asp:ListItem>
                                    <asp:ListItem Value="4">4-One Week</asp:ListItem>
                                    <asp:ListItem Value="5">5-One Month</asp:ListItem>
                                    <asp:ListItem Value="6">6-Long Range</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvPriorityLevel" runat="server" 
                                    ControlToValidate="ddlPriority" 
                                    ErrorMessage="Priority Level must be selected.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("PriorityLevel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Problem" SortExpression="Problem">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProblem" runat="server" Text='<%# Bind("Problem") %>' 
                                    Height="202px" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProblem" runat="server" 
                                    ControlToValidate="txtProblem" ErrorMessage="Problem is required.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Problem") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Technician" SortExpression="TechnicianID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlTechnician" runat="server" 
                                    DataSourceID="sqlTechnicians" DataTextField="Name" 
                                    DataValueField="TechnicianID" SelectedValue='<%# Bind("TechnicianID") %>' 
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("TechnicianID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Solved" SortExpression="SolutionDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("SolutionDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" 
                                    Text='<%# Bind("SolutionDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Solution" SortExpression="Solution">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("Solution") %>' 
                                    Height="152px" TextMode="MultiLine" Width="470px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("Solution") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatus" runat="server" 
                                    SelectedValue='<%# Bind("Status") %>'>
                                    <asp:ListItem>Solved</asp:ListItem>
                                    <asp:ListItem>Unsolved</asp:ListItem>
                                    <asp:ListItem>Canceled</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
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
                <asp:ValidationSummary ID="vsUpdateRequests" runat="server" />
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
                <asp:SqlDataSource ID="sqlRequests" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [ServiceRequests]" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [ServiceRequests] WHERE [RequestID] = @original_RequestID AND [BuildingID] = @original_BuildingID AND [DepartmentID] = @original_DepartmentID AND [RoomNum] = @original_RoomNum AND (([InventoryNum] = @original_InventoryNum) OR ([InventoryNum] IS NULL AND @original_InventoryNum IS NULL)) AND [RequestDate] = @original_RequestDate AND [RequestType] = @original_RequestType AND [RequestorName] = @original_RequestorName AND [RequestorPhone] = @original_RequestorPhone AND [RequestorEmail] = @original_RequestorEmail AND [PriorityLevel] = @original_PriorityLevel AND [Problem] = @original_Problem AND (([TechnicianID] = @original_TechnicianID) OR ([TechnicianID] IS NULL AND @original_TechnicianID IS NULL)) AND (([SolutionDate] = @original_SolutionDate) OR ([SolutionDate] IS NULL AND @original_SolutionDate IS NULL)) AND (([Solution] = @original_Solution) OR ([Solution] IS NULL AND @original_Solution IS NULL)) AND [Status] = @original_Status" 
                    InsertCommand="INSERT INTO [ServiceRequests] ([RequestID], [BuildingID], [DepartmentID], [RoomNum], [InventoryNum], [RequestDate], [RequestType], [RequestorName], [RequestorPhone], [RequestorEmail], [PriorityLevel], [Problem], [TechnicianID], [SolutionDate], [Solution], [Status]) VALUES (@RequestID, @BuildingID, @DepartmentID, @RoomNum, @InventoryNum, @RequestDate, @RequestType, @RequestorName, @RequestorPhone, @RequestorEmail, @PriorityLevel, @Problem, @TechnicianID, @SolutionDate, @Solution, @Status)" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [ServiceRequests] SET [BuildingID] = @BuildingID, [DepartmentID] = @DepartmentID, [RoomNum] = @RoomNum, [InventoryNum] = @InventoryNum, [RequestDate] = @RequestDate, [RequestType] = @RequestType, [RequestorName] = @RequestorName, [RequestorPhone] = @RequestorPhone, [RequestorEmail] = @RequestorEmail, [PriorityLevel] = @PriorityLevel, [Problem] = @Problem, [TechnicianID] = @TechnicianID, [SolutionDate] = @SolutionDate, [Solution] = @Solution, [Status] = @Status WHERE [RequestID] = @original_RequestID AND [BuildingID] = @original_BuildingID AND [DepartmentID] = @original_DepartmentID AND [RoomNum] = @original_RoomNum AND (([InventoryNum] = @original_InventoryNum) OR ([InventoryNum] IS NULL AND @original_InventoryNum IS NULL)) AND [RequestDate] = @original_RequestDate AND [RequestType] = @original_RequestType AND [RequestorName] = @original_RequestorName AND [RequestorPhone] = @original_RequestorPhone AND [RequestorEmail] = @original_RequestorEmail AND [PriorityLevel] = @original_PriorityLevel AND [Problem] = @original_Problem AND (([TechnicianID] = @original_TechnicianID) OR ([TechnicianID] IS NULL AND @original_TechnicianID IS NULL)) AND (([SolutionDate] = @original_SolutionDate) OR ([SolutionDate] IS NULL AND @original_SolutionDate IS NULL)) AND (([Solution] = @original_Solution) OR ([Solution] IS NULL AND @original_Solution IS NULL)) AND [Status] = @original_Status">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RequestID" Type="String" />
                        <asp:Parameter Name="original_BuildingID" Type="String" />
                        <asp:Parameter Name="original_DepartmentID" Type="String" />
                        <asp:Parameter Name="original_RoomNum" Type="String" />
                        <asp:Parameter Name="original_InventoryNum" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_RequestDate" />
                        <asp:Parameter Name="original_RequestType" Type="String" />
                        <asp:Parameter Name="original_RequestorName" Type="String" />
                        <asp:Parameter Name="original_RequestorPhone" Type="String" />
                        <asp:Parameter Name="original_RequestorEmail" Type="String" />
                        <asp:Parameter Name="original_PriorityLevel" Type="String" />
                        <asp:Parameter Name="original_Problem" Type="String" />
                        <asp:Parameter Name="original_TechnicianID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_SolutionDate" />
                        <asp:Parameter Name="original_Solution" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BuildingID" Type="String" />
                        <asp:Parameter Name="DepartmentID" Type="String" />
                        <asp:Parameter Name="RoomNum" Type="String" />
                        <asp:Parameter Name="InventoryNum" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="RequestDate" />
                        <asp:Parameter Name="RequestType" Type="String" />
                        <asp:Parameter Name="RequestorName" Type="String" />
                        <asp:Parameter Name="RequestorPhone" Type="String" />
                        <asp:Parameter Name="RequestorEmail" Type="String" />
                        <asp:Parameter Name="PriorityLevel" Type="String" />
                        <asp:Parameter Name="Problem" Type="String" />
                        <asp:Parameter Name="TechnicianID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="SolutionDate" />
                        <asp:Parameter Name="Solution" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="original_RequestID" Type="String" />
                        <asp:Parameter Name="original_BuildingID" Type="String" />
                        <asp:Parameter Name="original_DepartmentID" Type="String" />
                        <asp:Parameter Name="original_RoomNum" Type="String" />
                        <asp:Parameter Name="original_InventoryNum" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_RequestDate" />
                        <asp:Parameter Name="original_RequestType" Type="String" />
                        <asp:Parameter Name="original_RequestorName" Type="String" />
                        <asp:Parameter Name="original_RequestorPhone" Type="String" />
                        <asp:Parameter Name="original_RequestorEmail" Type="String" />
                        <asp:Parameter Name="original_PriorityLevel" Type="String" />
                        <asp:Parameter Name="original_Problem" Type="String" />
                        <asp:Parameter Name="original_TechnicianID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_SolutionDate" />
                        <asp:Parameter Name="original_Solution" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RequestID" Type="String" />
                        <asp:Parameter Name="BuildingID" Type="String" />
                        <asp:Parameter Name="DepartmentID" Type="String" />
                        <asp:Parameter Name="RoomNum" Type="String" />
                        <asp:Parameter Name="InventoryNum" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="RequestDate" />
                        <asp:Parameter Name="RequestType" Type="String" />
                        <asp:Parameter Name="RequestorName" Type="String" />
                        <asp:Parameter Name="RequestorPhone" Type="String" />
                        <asp:Parameter Name="RequestorEmail" Type="String" />
                        <asp:Parameter Name="PriorityLevel" Type="String" />
                        <asp:Parameter Name="Problem" Type="String" />
                        <asp:Parameter Name="TechnicianID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="SolutionDate" />
                        <asp:Parameter Name="Solution" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
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
            <asp:SqlDataSource ID="sqlBuildings" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                SelectCommand="SELECT * FROM [Buildings]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqlTechnicians" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Technicians]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqlDepartments" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [Departments]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

