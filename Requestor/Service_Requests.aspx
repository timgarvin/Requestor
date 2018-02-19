<%@ Page Language="VB" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="false" CodeFile="Service_Requests.aspx.vb" Inherits="Service_Requests" title="Service Request Submission" Theme="USofA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style16
        {
            width: 100%;
            text-align: left;
        }
        .style18
        {
        text-align: right;
        width: 503px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style16">
        <tr>
            <td class="style18">
                    <asp:Label ID="lblSRNum" runat="server" Text="Service Request #:"></asp:Label>
                </td>
            <td>
                    <asp:TextBox ID="txtRequestNum" runat="server" BackColor="#CCCCCC" 
                    ReadOnly="True"></asp:TextBox>
                    <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                        Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblBuilding" runat="server" Text="Building:"></asp:Label>
                </td>
            <td>
                    <asp:ListBox ID="lbBuilding" runat="server" DataSourceID="sqlBuildings" 
                    DataTextField="Name" DataValueField="BuildingID"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="rfvBuilding" runat="server" 
                    ControlToValidate="lbBuilding" ErrorMessage="Building must be selected.">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label>
                </td>
            <td>
                    <asp:DropDownList ID="ddlDepartment" runat="server" 
                    DataSourceID="sqlDepartments" DataTextField="Name" 
                    DataValueField="DepartmentID" AppendDataBoundItems="True">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" 
                    ControlToValidate="ddlDepartment" 
                    ErrorMessage="Department must be selected.">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="lblRoom" runat="server" Text="Room #:" Height="23px"></asp:Label>
                    <asp:TextBox ID="txtRoom" runat="server" Width="52px" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRoom" runat="server" 
                    ErrorMessage="Room # is required." 
                    ControlToValidate="txtRoom">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblRequestType" runat="server" Text="Issue Type:"></asp:Label>
                </td>
            <td>
                    <asp:DropDownList ID="ddlReqType" runat="server" AutoPostBack="True">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Hardware</asp:ListItem>
                        <asp:ListItem>Software</asp:ListItem>
                        <asp:ListItem>New Account(s)</asp:ListItem>
                        <asp:ListItem>Account Problems</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvIssue" runat="server" 
                    ControlToValidate="ddlReqType" 
                    ErrorMessage="Issue Type must be selected.">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="lblComputerNum" runat="server" Text="Inventory/Computer's #:" Height="23px" 
                    Visible="False"></asp:Label>
                    <asp:TextBox ID="txtComputerNum" runat="server" Visible="False" MaxLength="10"></asp:TextBox>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblName" runat="server" Text="Your Name:"></asp:Label>
                </td>
            <td>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ErrorMessage="Your Name is required." 
                    ControlToValidate="txtName">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblPhoneNum" runat="server" Text="Phone # or Extension:"></asp:Label>
                    <br />
                <asp:Label ID="Label1" runat="server" Height="35px" 
                    Text="(No hyphens (-) or parentheses)"></asp:Label>
            </td>
            <td>
                    <asp:TextBox ID="txtPhoneNum" runat="server" Width="85px" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhoneNum" runat="server" 
                    ErrorMessage="Phone # or Extension is required." 
                    ControlToValidate="txtPhoneNum">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvPhoneNum" runat="server" 
                    ErrorMessage="Phone # or Extension is out of range." MaximumValue="9999999999" 
                    MinimumValue="1000000000" Type="Double" ControlToValidate="txtPhoneNum">*</asp:RangeValidator>
                    <asp:CompareValidator ID="cvPhoneNum" runat="server" 
                    ErrorMessage="Phone # or Extension must be a number." Operator="DataTypeCheck" 
                    Type="Double" ControlToValidate="txtPhoneNum">*</asp:CompareValidator>
                    &nbsp;<asp:Label ID="lblEmail" runat="server" Text="Email Address:"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ErrorMessage="Email Address is required." 
                    ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                    <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblPriority" runat="server" Text="Priority Level:"></asp:Label>
                </td>
            <td>
                    <asp:DropDownList ID="ddlPriority" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">1-Emergency</asp:ListItem>
                        <asp:ListItem Value="2">2-ASAP</asp:ListItem>
                        <asp:ListItem Value="3">3-Date Sensitive</asp:ListItem>
                        <asp:ListItem Value="4">4-One Week</asp:ListItem>
                        <asp:ListItem Value="5">5-One Month</asp:ListItem>
                        <asp:ListItem Value="6">6-Long Range</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPriority" runat="server" 
                    ControlToValidate="ddlPriority" 
                    ErrorMessage="Priority Level must be selected.">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                    <asp:Label ID="lblDescription" runat="server" Text="Description of Problem:"></asp:Label>
                </td>
            <td>
                    <asp:TextBox ID="txtDescription" runat="server" Height="167px" 
                    TextMode="MultiLine" Width="490px" MaxLength="1500"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                    ErrorMessage="Description of Problem is required." 
                    Height="100px" ControlToValidate="txtDescription">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                <asp:ValidationSummary 
                    ID="vsServiceRequest" runat="server" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:Button ID="btnClear" runat="server" Height="49px" Text="Clear" 
                        Width="96px" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:Button ID="btnSubmit" runat="server" Height="53px" Text="Submit" 
                        Width="131px" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:SqlDataSource ID="sqlBuildings" runat="server" 
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
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:SqlDataSource ID="sqlDepartments" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" 
                        SelectCommand="SELECT * FROM [Departments] WHERE ([Status] = @Status)">
                        <SelectParameters>
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
            <td>
                    <asp:SqlDataSource ID="sqlTechniciansActive" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        SelectCommand="SELECT * FROM [Technicians] WHERE ([Status] = @Status)" 
                        DataSourceMode="DataReader">
                        <SelectParameters>
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
            <td>
                    <asp:SqlDataSource ID="sqlServiceRequests" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [ServiceRequests]" 
                        ConflictDetection="CompareAllValues" 
                        DeleteCommand="DELETE FROM [ServiceRequests] WHERE [RequestID] = @original_RequestID AND [BuildingID] = @original_BuildingID AND [DepartmentID] = @original_DepartmentID AND [RoomNum] = @original_RoomNum AND (([InventoryNum] = @original_InventoryNum) OR ([InventoryNum] IS NULL AND @original_InventoryNum IS NULL)) AND [RequestDate] = @original_RequestDate AND [RequestType] = @original_RequestType AND [RequestorName] = @original_RequestorName AND [RequestorPhone] = @original_RequestorPhone AND [RequestorEmail] = @original_RequestorEmail AND [PriorityLevel] = @original_PriorityLevel AND [Problem] = @original_Problem AND (([TechnicianID] = @original_TechnicianID) OR ([TechnicianID] IS NULL AND @original_TechnicianID IS NULL)) AND (([SolutionDate] = @original_SolutionDate) OR ([SolutionDate] IS NULL AND @original_SolutionDate IS NULL)) AND (([Solution] = @original_Solution) OR ([Solution] IS NULL AND @original_Solution IS NULL)) AND [Status] = @original_Status" 
                        InsertCommand="INSERT INTO [ServiceRequests] ([RequestID], [BuildingID], [DepartmentID], [RoomNum], [InventoryNum], [RequestDate], [RequestType], [RequestorName], [RequestorPhone], [RequestorEmail], [PriorityLevel], [Problem], [Status]) VALUES (@RequestID, @BuildingID, @DepartmentID, @RoomNum, @InventoryNum, @RequestDate, @RequestType, @RequestorName, @RequestorPhone, @RequestorEmail, @PriorityLevel, @Problem, @Status)" 
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
                            <asp:Parameter DbType="Date" Name="original_SolutionDate" />
                            <asp:Parameter Name="original_Solution" Type="String" />
                            <asp:Parameter Name="original_Status" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txtRequestNum" Name="RequestID" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="lbBuilding" Name="BuildingID" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlDepartment" Name="DepartmentID" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtRoom" Name="RoomNum" PropertyName="Text" 
                                Type="String" />
                            <asp:Parameter DefaultValue="DbNull.Value.ToString" Name="InventoryNum" />
                            <asp:Parameter DbType="DateTime" DefaultValue="" Name="RequestDate" />
                            <asp:ControlParameter ControlID="ddlReqType" Name="RequestType" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtName" Name="RequestorName" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtPhoneNum" Name="RequestorPhone" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="RequestorEmail" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ddlPriority" Name="PriorityLevel" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtDescription" Name="Problem" 
                                PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="Unsolved" Name="Status" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:SqlDataSource ID="sqlSRMaxID" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" 
                        SelectCommand="SELECT RequestID FROM ServiceRequests ORDER BY RequestID">
                    </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style18">
                &nbsp;</td>
            <td>
                    <asp:SqlDataSource ID="sqlArchiveMaxID" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                        DataSourceMode="DataReader" 
                        SelectCommand="SELECT RequestID FROM Archive ORDER BY RequestID">
                    </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

