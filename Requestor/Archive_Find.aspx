<%@ Page Language="VB" MasterPageFile="~/Admin_MasterPage.master" AutoEventWireup="false" CodeFile="Archive_Find.aspx.vb" Inherits="Archive_Find" title="Search/Browse Archive" Theme="USofA"%>

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
                <asp:Label ID="lblSearch" runat="server" EnableTheming="False" 
                    Font-Names="Bauhaus 93" Font-Size="35pt" ForeColor="White" Text="Search:"></asp:Label>
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
                <asp:Label ID="lblSearchBy" runat="server" Text="Search by:"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="RequestID">Request ID</asp:ListItem>
                    <asp:ListItem Value="BuildingID">Building ID</asp:ListItem>
                    <asp:ListItem Value="DepartmentID">Department ID</asp:ListItem>
                    <asp:ListItem Value="RoomNum">Room #</asp:ListItem>
                    <asp:ListItem Value="InventoryNum">Inventory #</asp:ListItem>
                    <asp:ListItem Value="RequestDate">Date Requested</asp:ListItem>
                    <asp:ListItem Value="RequestType">Type of Request</asp:ListItem>
                    <asp:ListItem Value="RequestorName">Requestor&#39;s Name</asp:ListItem>
                    <asp:ListItem Value="RequestorPhone">Requestor&#39;s Phone #</asp:ListItem>
                    <asp:ListItem Value="RequestorEmail">Requestor&#39;s Email</asp:ListItem>
                    <asp:ListItem Value="PriorityLevel">Priority Level</asp:ListItem>
                    <asp:ListItem Value="Problem">Description of Problem</asp:ListItem>
                    <asp:ListItem Value="Technician'sID">Technician&#39;s ID</asp:ListItem>
                    <asp:ListItem Value="SolutionDate">Date Completed</asp:ListItem>
                    <asp:ListItem Value="Solution">Solution to Problem</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSearchBy" runat="server" 
                    ControlToValidate="ddlSearchType" 
                    ErrorMessage="A Search By option must be selected." 
                    ValidationGroup="Search">*</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSearchText" runat="server" 
                    ControlToValidate="txtSearch" 
                    ErrorMessage="Word or phrase to search for is required." 
                    ValidationGroup="Search">*</asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" Height="41px" 
                    ValidationGroup="Search" Width="113px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ValidationSummary ID="vsSearch" runat="server" ValidationGroup="Search" />
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
                <asp:DetailsView ID="dvSearch" runat="server" Height="50px" Width="546px" 
                    AllowPaging="True" AutoGenerateRows="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlArchiveSearch" Visible="False">
                    <RowStyle HorizontalAlign="Center" />
                    <FieldHeaderStyle HorizontalAlign="Right" />
                    <Fields>
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
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RequestorPhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
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
                    </Fields>
                </asp:DetailsView>
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
                <asp:Label ID="lblBrowse" runat="server" EnableTheming="False" 
                    Font-Names="Bauhaus 93" Font-Size="35pt" ForeColor="White" Text="Browse:"></asp:Label>
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
                <asp:GridView ID="gvBrowse" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlArchiveBrowse" Width="1707px">
                    <RowStyle HorizontalAlign="Center" />
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
                        <asp:BoundField DataField="RequestDate" HeaderText="Date Requested" 
                            SortExpression="RequestDate" DataFormatString="{0:MM/dd/yyyy}" />
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
                        <asp:BoundField DataField="RequestorPhone" HeaderText="RequestorPhone" 
                            SortExpression="RequestorPhone" />
                        <asp:BoundField DataField="PriorityLevel" HeaderText="Priority Level" 
                            SortExpression="PriorityLevel" />
                        <asp:BoundField DataField="Problem" HeaderText="Problem" 
                            SortExpression="Problem" />
                        <asp:BoundField DataField="TechnicianID" HeaderText="Technician ID" 
                            SortExpression="TechnicianID" />
                        <asp:BoundField DataField="SolutionDate" HeaderText="Date Solved" 
                            SortExpression="SolutionDate" DataFormatString="{0:MM/dd/yyyy}" />
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
            <td>
                <asp:SqlDataSource ID="sqlArchiveSearch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [Archive]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="sqlArchiveBrowse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [Archive]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>

