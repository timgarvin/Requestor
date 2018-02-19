<%@ Page Language="VB" MasterPageFile="~/Technician_MasterPage.master" AutoEventWireup="false" CodeFile="Add_Solution.aspx.vb" Inherits="Add_Solution" title="Add Solution" Theme="USofA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
        width: 286px;
    }
    .style10
    {
        text-align: center;
        width: 835px;
    }
    .style11
    {
        width: 835px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Label ID="lblRequestID" runat="server" Text="Request ID:"></asp:Label>
                <asp:TextBox ID="txtRequestID" runat="server" AutoPostBack="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDetailsRequestID" runat="server" 
                    ErrorMessage="Request ID is required to display Details." 
                    ControlToValidate="txtRequestID" ValidationGroup="Details">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvRequestID" runat="server" 
                    ErrorMessage="Request ID is required." ControlToValidate="txtRequestID">*</asp:RequiredFieldValidator>
                &nbsp;<asp:Button ID="btnShow" runat="server" Text="Show Details" 
                    ValidationGroup="Details" Height="34px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style11">
                <asp:ValidationSummary ID="vsDetails" runat="server" 
                    ValidationGroup="Details" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:DetailsView ID="dvSolution" runat="server" Height="50px" Width="573px" 
                    AutoGenerateRows="False" DataKeyNames="RequestID" 
                    DataSourceID="sqlSolution" BorderColor="White" BorderStyle="Solid" 
                    BorderWidth="2px" CellSpacing="5" Visible="False">
                    <RowStyle BorderColor="White" BorderStyle="Solid" Font-Names="Corbel" 
                        Font-Size="X-Large" ForeColor="White" HorizontalAlign="Center" 
                        VerticalAlign="Middle" />
                    <FieldHeaderStyle BackColor="White" BorderColor="White" 
                        Font-Names="Comic Sans MS" Font-Size="14pt" ForeColor="Red" 
                        HorizontalAlign="Right" />
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
                            SortExpression="InventoryNum" NullDisplayText="-" />
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
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RequestorPhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" 
                                    Text='<%# String.Format("{0:(###) ###-####}", Convert.ToInt64(DataBinder.Eval(Container.DataItem, "RequestorPhone"))) %>' 
                                    EnableTheming="False"></asp:Label>
                                <%--# Bind("RequestorPhone") --%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestorEmail" HeaderText="Email" 
                            SortExpression="RequestorEmail" />
                        <asp:BoundField DataField="PriorityLevel" HeaderText="Priority Level" 
                            SortExpression="PriorityLevel" />
                        <asp:BoundField DataField="Problem" HeaderText="Problem" 
                            SortExpression="Problem" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                    </Fields>
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Label ID="lblDateCompleted" runat="server" 
                    Text="Select the Date Completed:"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvDateCompleted" runat="server" 
                    ControlToValidate="txtDateCompleted" 
                    ErrorMessage="You must select a date from the calendar.">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10" style="text-align: right">
            <center>
                <asp:Calendar ID="calDateCompleted" runat="server"></asp:Calendar>
            </center>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Label ID="lblTimeCompleted" runat="server" Text="Time Completed:"></asp:Label>
                <br />
                <asp:Label ID="lblHour" runat="server" Text="Hour:"></asp:Label>
                <asp:TextBox ID="txtHour" runat="server" Width="40px" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvHour" runat="server" 
                    ControlToValidate="txtHour" ErrorMessage="Hour is required.">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvHour" runat="server" ControlToValidate="txtHour" 
                    ErrorMessage="Hour must be between 01 and 12." MaximumValue="12" 
                    MinimumValue="01" Type="Integer">*</asp:RangeValidator>
                <asp:CompareValidator ID="cvHour" runat="server" ControlToValidate="txtHour" 
                    ErrorMessage="Hour must be a number." Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                &nbsp;<asp:Label ID="lblMinute" runat="server" Text="Minute:"></asp:Label>
                <asp:TextBox ID="txtMinute" runat="server" Width="41px" MaxLength="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMinute" runat="server" 
                    ControlToValidate="txtMinute" ErrorMessage="Minute is required.">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvMinute" runat="server" ControlToValidate="txtMinute" 
                    ErrorMessage="Minute must be between 01 and 59." MaximumValue="59" 
                    MinimumValue="01" Type="Integer">*</asp:RangeValidator>
                <asp:CompareValidator ID="cvMinute" runat="server" 
                    ControlToValidate="txtMinute" ErrorMessage="Minute must be a number." 
                    Operator="DataTypeCheck" Type="Integer">*</asp:CompareValidator>
                &nbsp;<asp:Label ID="lblAMPM" runat="server" Text="AM/PM:"></asp:Label>
                <asp:DropDownList ID="ddlAMPM" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAMPM" runat="server" 
                    ControlToValidate="ddlAMPM" ErrorMessage="AM/PM is required.">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:TextBox ID="txtDateCompleted" runat="server" Visible="False"></asp:TextBox>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Label ID="lblSolution" runat="server" Height="150px" 
                    Text="Solution to Completed Request:"></asp:Label>
                <asp:TextBox ID="txtSolution" runat="server" Height="148px" 
                    TextMode="MultiLine" Width="336px" MaxLength="1500"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSolution" runat="server" 
                    ControlToValidate="txtSolution" 
                    ErrorMessage="Solution to Completed Request is required.">*</asp:RequiredFieldValidator>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:Label ID="lblResult" runat="server" EnableTheming="False" Font-Bold="True" 
                    Font-Names="Corbel" Font-Size="X-Large" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                <asp:ValidationSummary ID="vsSolution" runat="server" 
                    style="text-align: left" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td style="text-align: center" class="style11">
                <asp:Button ID="btnSubmit" runat="server" Height="42px" Text="Submit" 
                    Width="93px" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style11">
                <asp:SqlDataSource ID="sqlRequestStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    DataSourceMode="DataReader" 
                    SelectCommand="SELECT * FROM [ServiceRequests] WHERE (([RequestID] = @RequestID) AND ([Status] = @Status))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtRequestID" Name="RequestID" 
                            PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="Unsolved" Name="Status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style11">
                <asp:SqlDataSource ID="sqlSolution" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ServiceRequestConnectionString %>" 
                    SelectCommand="SELECT * FROM [ServiceRequests] WHERE ([RequestID] = @RequestID)" 
                    UpdateCommand="UPDATE ServiceRequests SET TechnicianID = @TechnicianID, SolutionDate = @SolutionDate, Solution = @Solution, Status = @Status WHERE RequestID = @RequestID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtRequestID" Name="RequestID" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TechnicianID" />
                        <asp:Parameter DefaultValue="" Name="SolutionDate" />
                        <asp:ControlParameter ControlID="txtSolution" Name="Solution" 
                            PropertyName="Text" />
                        <asp:Parameter DefaultValue="Solved" Name="Status" />
                        <asp:ControlParameter ControlID="txtRequestID" Name="RequestID" 
                            PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

