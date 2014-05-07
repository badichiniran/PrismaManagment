<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .ListBox {
            height: 200px;
            width: 150px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ScriptManager1" runat="server"></asp:ToolkitScriptManager>
         <div style="float:left">
        <table>
            <tr>
                <td>Site name</td>
                <td>Application</td>
                <td>Department</td>
                <td>Main Problem</td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="ListBox_SiteName"  class="ListBox" runat="server" DataSourceID="SqlDataSource_SiteName" DataTextField="SITE" DataValueField="SITE" ></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource_SiteName" runat="server" ConnectionString="<%$ ConnectionStrings:PrismaManagementConnectionString %>" SelectCommand="PR_ListSite" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:ListBox ID="ListBox_App" runat="server" class="ListBox"  DataSourceID="SqlDataSource_App" DataTextField="application" DataValueField="application"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource_App" runat="server" ConnectionString="<%$ ConnectionStrings:PrismaManagementConnectionString %>" SelectCommand="PR_ListApplication" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:ListBox ID="ListBox_Dept" runat="server" class="ListBox"  DataSourceID="SqlDataSource_Dept" DataTextField="Department" DataValueField="Department"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource_Dept" runat="server" ConnectionString="<%$ ConnectionStrings:PrismaManagementConnectionString %>" SelectCommand="PR_ListDepartment" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:ListBox ID="ListBox_MainProb" runat="server" class="ListBox"  DataSourceID="SqlDataSource_MainProb" DataTextField="Main_Problem" DataValueField="Main_Problem"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource_MainProb" runat="server" ConnectionString="<%$ ConnectionStrings:PrismaManagementConnectionString %>" SelectCommand="PR_ListMainProblem" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>

            </tr>
        </table>
            </div>
        <div style="float:left">
                
        </div>
        <div style="float: left"><br />
            <table>
                <tr>
                    <td>Free search: </td>
                    <td><asp:TextBox runat="server" ID="TBFreeSearch" /></td>
                </tr>
                <tr>
                    <td>From date: </td>
                    <td>
                        <asp:TextBox runat="server" ID="FromDate"  />
                        <asp:ImageButton runat="Server" ID="CalendarImage" ImageUrl="images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" /><br />
                        <asp:CalendarExtender ID="calendarButtonExtender_FromDate" runat="server" TargetControlID="FromDate"
                            PopupButtonID="CalendarImage"   Format="dd/MM/yyyy" />
                    </td>
                    <td>To date: </td>
                    <td>
                        <asp:TextBox runat="server" ID="ToDate" />
                        <asp:ImageButton runat="Server" ID="CalendarImage1" ImageUrl="images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" /><br />
                        <asp:CalendarExtender ID="calendarButtonExtender_ToDate" runat="server" TargetControlID="ToDate"
                            PopupButtonID="CalendarImage1"   Format="dd/MM/yyyy" />
                    </td>
                                    <td>
                   &nbsp&nbsp&nbsp&nbsp&nbsp <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/images/buttonsearch2.jpg" Width="70px" Height="60px" OnClick="ImageButton1_Click"/>
                </td>
                </tr>

            </table>

        </div>
        
      
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Report_date,Site_no,Dept_no,Call_code"   Width="100%" 
            DataSourceID="SqlDataSource_incidents"  AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Small">
            <AlternatingRowStyle BackColor="White"/>
            <Columns>
                <asp:BoundField DataField="Site_name" HeaderText="Site" SortExpression="Site_name" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Application" HeaderText="Application" SortExpression="Application" />
                <asp:BoundField DataField="Work_cen" HeaderText="Workcenter" SortExpression="Work_cen" />
                <asp:BoundField DataField="Report_date" HeaderText="Report_date" ReadOnly="True" SortExpression="Report_date"  DataFormatString="{0:d}" />
                <asp:BoundField DataField="Main_problem" HeaderText="Main_problem" SortExpression="Main_problem" />
                <asp:BoundField DataField="Sub_problem" HeaderText="Sub problem" SortExpression="Sub_problem" />
                <asp:BoundField DataField="Service_desc" HeaderText="Service desc" SortExpression="Service_desc" />
                <asp:BoundField DataField="Treatment_desc" HeaderText="Treatment desc" SortExpression="Treatment_desc" />
                <asp:BoundField DataField="Treated_by" HeaderText="Treated_by" SortExpression="Treated_by" />
                <asp:BoundField DataField="Caller" HeaderText="Caller" SortExpression="Caller" />
              
                <asp:BoundField DataField="Contact_type" HeaderText="Contact type" SortExpression="Contact_type" />
              
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_incidents" runat="server" ConnectionString="<%$ ConnectionStrings:PrismaManagementConnectionString %>"
             SelectCommand="PR_PrismaIncidents" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox_App" Name="AppType" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
                <asp:ControlParameter ControlID="ListBox_SiteName" Name="SiteName" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
                <asp:ControlParameter ControlID="ListBox_Dept" Name="DepartmentName" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
                <asp:ControlParameter ControlID="ListBox_MainProb" Name="MainProblem" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false" />
                <asp:ControlParameter ControlID="FromDate" DefaultValue="1/1/2010" Name="FromDate" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="true" />
                <asp:ControlParameter ControlID="ToDate" DefaultValue="1/1/2030" Name="ToDate" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="true" />
                <asp:ControlParameter ControlID="TBFreeSearch" Name="FreeSearch" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
