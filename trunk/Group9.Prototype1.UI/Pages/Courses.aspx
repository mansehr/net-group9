<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager id="scriptManager" runat="server" />
    <asp:LinqDataSource ID="ldsCourses" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Courses">
    </asp:LinqDataSource>
    
    <h2>Course Administration</h2>
    
    <asp:GridView ID="courseView" runat="server" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="code" 
        DataSourceID="ldsCourses">
        <Columns>
            <asp:BoundField DataField="code" HeaderText="Code" ReadOnly="True" 
                SortExpression="code" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="credits" DataFormatString="{0} hp" 
                HeaderText="Credits" SortExpression="credits" />
            <asp:HyperLinkField DataNavigateUrlFields="code" DataNavigateUrlFormatString="~/Pages/CourseRuns.aspx?code={0}" Text="Runs" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteImageUrl="~/Resources/Images/delete.png" EditImageUrl="~/Resources/Images/edit.png" ButtonType="Image" />
        </Columns>
    </asp:GridView>
    <h3>New course</h3>
    <asp:DetailsView ID="courseDetail" runat="server" DefaultMode="Insert" DataSourceID="ldsCourses"
        AutoGenerateInsertButton="True" AutoGenerateRows="False" 
        oniteminserted="courseDetail_ItemInserted">
        <Fields>
            <asp:TemplateField HeaderText="Code">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" />
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
