<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Move_To_Archive.aspx.vb" Inherits="Move_To_Archive" title="Move Solved/Canceled Requests To Archive" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 100%;
        }
        .style14
        {
            text-align: left;
        }
        .style15
        {
            height: 2px;
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style13">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center">
                Are you sure you want to move the following completed/canceled Service Requests to the 
                Archive?:</td>
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
            <td class="style15">
                </td>
            <td class="style15">
                <asp:Button ID="btnYes" runat="server" Height="35px" Text="Yes" Width="79px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnNo" runat="server" Height="35px" Text="No" Width="79px" />
                </td>
            <td class="style15">
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style14">
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
            <td style="text-align: center">
                <asp:GridView ID="gvRequests" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlCompleted" Width="1500px">
                    <Columns>
                        <asp:BoundField DataField="RequestID" HeaderText="Request ID" ReadOnly="True" 
                            SortExpression="RequestID" />
                        <asp:BoundField DataField="BuildingID" HeaderText="Building ID" 
                            SortExpression="BuildingID" />
                        <asp:BoundField DataField="DepartmentID" HeaderText="Department ID" 
                            SortExpression="DepartmentID" />
                        <asp:BoundField DataField="RoomNum" HeaderText="Room #" 
                            SortExpression="RoomNum" />
                        <asp:BoundField DataField="InventoryNum" HeaderText="Inventory #" 
                            SortExpression="InventoryNum" />
                        <asp:BoundField DataField="RequestDate" DataFormatString="{0:MM/dd/yyyy}" 
                            HeaderText="Date Requested" SortExpression="RequestDate" />
                        <asp:BoundField DataField="RequestType" HeaderText="Type of Request" 
                            SortExpression="RequestType" />
                        <asp:BoundField DataField="RequestorName" HeaderText="Requestor's Name" 
                            SortExpression="RequestorName" />
                        <asp:TemplateField HeaderText="Phone #" SortExpression="RequestorPhone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RequestorPhone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:(###) ###-####}", Convert.ToInt64(DataBinder.Eval(Container.DataItem, "RequestorPhone"))) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestorEmail" HeaderText="Email" 
                            SortExpression="RequestorEmail" />
                        <asp:BoundField DataField="PriorityLevel" HeaderText="Priority Level" 
                            SortExpression="PriorityLevel" />
                        <asp:BoundField DataField="Problem" HeaderText="Problem" 
                            SortExpression="Problem" />
                        <asp:BoundField DataField="TechnicianID" HeaderText="Technician ID" 
                            SortExpression="TechnicianID" />
                        <asp:BoundField DataField="SolutionDate" DataFormatString="{0:MM/dd/yyyy}" 
                            HeaderText="Date Solved" SortExpression="SolutionDate" />
                        <asp:BoundField DataField="Solution" HeaderText="Solution" 
                            SortExpression="Solution" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style14">
                <asp:SqlDataSource ID="sqlCompletedReader" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DataSourceMode="DataReader" 
                    
                    SelectCommand="SELECT * FROM ServiceRequests WHERE Status = 'Solved' OR Status = 'Canceled'">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqlCompleted" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM ServiceRequests WHERE (Status = 'Solved' OR Status = 'Canceled')" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM ServiceRequests WHERE ([Status] = 'Solved') OR ([Status] = 'Canceled')" 
                    InsertCommand="INSERT INTO [Archive] ([RequestID], [BuildingID], [DepartmentID], [RoomNum], [InventoryNum], [RequestDate], [RequestType], [RequestorName], [RequestorPhone], [RequestorEmail], [PriorityLevel], [Problem], [TechnicianID], [SolutionDate], [Solution], [Status]) VALUES (@RequestID, @BuildingID, @DepartmentID, @RoomNum, @InventoryNum, @RequestDate, @RequestType, @RequestorName, @RequestorPhone, @RequestorEmail, @PriorityLevel, @Problem, @TechnicianID, @SolutionDate, @Solution, @Status)" 
                    OldValuesParameterFormatString="original_{0}"
                    
                    UpdateCommand="UPDATE [ServiceRequests] SET [BuildingID] = @BuildingID, [DepartmentID] = @DepartmentID, [RoomNum] = @RoomNum, [InventoryNum] = @InventoryNum, [RequestDate] = @RequestDate, [RequestType] = @RequestType, [RequestorName] = @RequestorName, [RequestorPhone] = @RequestorPhone, [RequestorEmail] = @RequestorEmail, [PriorityLevel] = @PriorityLevel, [Problem] = @Problem, [TechnicianID] = @TechnicianID, [SolutionDate] = @SolutionDate, [Solution] = @Solution, [Status] = @Status WHERE [RequestID] = @original_RequestID AND [BuildingID] = @original_BuildingID AND [DepartmentID] = @original_DepartmentID AND [RoomNum] = @original_RoomNum AND (([InventoryNum] = @original_InventoryNum) OR ([InventoryNum] IS NULL AND @original_InventoryNum IS NULL)) AND [RequestDate] = @original_RequestDate AND [RequestType] = @original_RequestType AND [RequestorName] = @original_RequestorName AND [RequestorPhone] = @original_RequestorPhone AND [RequestorEmail] = @original_RequestorEmail AND [PriorityLevel] = @original_PriorityLevel AND [Problem] = @original_Problem AND (([TechnicianID] = @original_TechnicianID) OR ([TechnicianID] IS NULL AND @original_TechnicianID IS NULL)) AND (([SolutionDate] = @original_SolutionDate) OR ([SolutionDate] IS NULL AND @original_SolutionDate IS NULL)) AND (([Solution] = @original_Solution) OR ([Solution] IS NULL AND @original_Solution IS NULL)) AND [Status] = @original_Status">
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
                <asp:SqlDataSource ID="sqlCompletedRemove" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DeleteCommand="DELETE FROM ServiceRequests WHERE Status = 'Solved' OR Status = 'Canceled'" 
                    SelectCommand="SELECT * FROM ServiceRequests"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

