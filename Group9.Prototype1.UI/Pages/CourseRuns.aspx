<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="CourseRuns.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.CourseRuns" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager id="scriptManager" runat="server" />
    <asp:LinqDataSource ID="ldsCourseRuns" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="CourseRuns" Where="code == @code" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="code" QueryStringField="code" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    <h2>Course runs</h2>

    <asp:GridView ID="courseRunsView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="runid,code" DataSourceID="ldsCourseRuns">
        <Columns>
            <asp:BoundField DataField="runid" HeaderText="Period" ReadOnly="True" 
                SortExpression="runid" />
            <asp:TemplateField HeaderText="Start date" SortExpression="startDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("startDate", "{0:d}") %>'></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="TextBox1" runat="server" FirstDayOfWeek="Monday" Format="yyyy-MM-dd" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("startDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="gradeFormula" HeaderText="Grade Formula" />
            <asp:HyperLinkField DataNavigateUrlFields="code,runid" DataNavigateUrlFormatString="~/Pages/CourseParts.aspx?code={0}&runid={1}" Text="Parts" />
            <asp:HyperLinkField DataNavigateUrlFields="code,runid" DataNavigateUrlFormatString="~/Pages/CourseRunParticipants.aspx?code={0}&runid={1}" Text="Participants" />
            <asp:CommandField CausesValidation="false" ShowDeleteButton="True" ShowEditButton="True" DeleteImageUrl="~/Resources/Images/delete.png" EditImageUrl="~/Resources/Images/edit.png" ButtonType="Image"  />
        </Columns>
    </asp:GridView>

    <h3>New course run</h3>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="runid,code" DataSourceID="ldsCourseRuns" 
        DefaultMode="Insert" oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting" >
        <Fields>
            <asp:TemplateField HeaderText="Period" SortExpression="runid">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("runid") %>'></asp:Label>                    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("runid") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="New" ControlToValidate="TextBox1" ErrorMessage="Required" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="New" ControlToValidate="TextBox1" ValidationExpression="^(\d{2})(V|H)(1|2)$" ErrorMessage="Invalid format (yytp, yy = year, t = termin, p = period)" Display="Dynamic" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("runid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start date" SortExpression="startDate">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("startDate") %>'></asp:TextBox>
                    <ajax:CalendarExtender runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="New" ControlToValidate="TextBox4" ErrorMessage="Required" Display="Dynamic" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Grade Formula">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("gradeFormula") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="New" ControlToValidate="TextBox5" ErrorMessage="Required" Display="Dynamic" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" CausesValidation="true" ValidationGroup="New" />
        </Fields>
    </asp:DetailsView>
    
</asp:Content>
