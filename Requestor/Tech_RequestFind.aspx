﻿<%@ Page Language="VB" MasterPageFile="~/Technician_MasterPage.master" AutoEventWireup="false" CodeFile="Tech_RequestFind.aspx.vb" Inherits="Tech_RequestFind" title="Search/Browse Requests" Theme="USofA"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: left">
                <asp:Label ID="lblSearch" runat="server" EnableTheming="False" 
                    Font-Names="Bauhaus 93" Font-Size="35pt" ForeColor="White" Text="Search:"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: left">
                &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="text-align: left">
                <asp:Label ID="lblSearchBy" runat="server" Text="Search by:"></asp:Label>
                <asp:DropDownList ID="ddlSearchType" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="RequestID">Request ID</asp:ListItem>
                    <asp:ListItem Value="BuildingID">Building ID</asp:ListItem>
                    <asp:ListItem Value="DepartmentID">Department ID</asp:ListItem>
                    <asp:ListItem Value="RoomNum">Room Number</asp:ListItem>
                    <asp:ListItem Value="InventoryNum">Inventory Number</asp:ListItem>
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
                &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" Height="38px" 
                    Width="101px" ValidationGroup="Search" />
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
        <td style="text-align: left">
                <asp:DetailsView ID="dvSearch" runat="server" Height="50px" Width="473px" 
                    AllowPaging="True" AutoGenerateRows="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlRequestSearch" Visible="False">
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
        <td style="text-align: left">
            <asp:Label ID="lblBrowse" runat="server" EnableTheming="False" 
                Font-Names="Bauhaus 93" Font-Size="35pt" ForeColor="White" Text="Browse:"></asp:Label>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            </td>
        <td>
            </td>
        <td>
            </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
                <asp:GridView ID="gvBrowse" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlRequestBrowse">
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
                        <asp:BoundField DataField="RequestorEmail" HeaderText="Email" 
                            SortExpression="RequestorEmail" />
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
                <asp:SqlDataSource ID="sqlRequestSearch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [ServiceRequests]"></asp:SqlDataSource>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
                <asp:SqlDataSource ID="sqlRequestBrowse" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [ServiceRequests]"></asp:SqlDataSource>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>

