<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="CourseParts.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.CourseParts" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager id="scriptManager" runat="server" />
    <asp:LinqDataSource ID="ldsCourseParts" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="CourseParts" Where="code == @code" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="code" QueryStringField="code" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    <h2>Course runs</h2>

    <asp:GridView ID="coursePartsView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="code,part" DataSourceID="ldsCourseParts">
        <Columns>
            <asp:BoundField DataField="part" HeaderText="Part Identifier" ReadOnly="True" 
                SortExpression="part" />
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" />
            <asp:BoundField DataField="maxScore" HeaderText="Max Score" 
                SortExpression="maxScore" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" DeleteImageUrl="~/Resources/Images/delete.png" EditImageUrl="~/Resources/Images/edit.png" ButtonType="Image"  />
        </Columns>
    </asp:GridView>

    <h3>New course part</h3>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="code,part" DataSourceID="ldsCourseParts" 
        DefaultMode="Insert" oniteminserted="DetailsView1_ItemInserted" 
        oniteminserting="DetailsView1_ItemInserting" >
        <Fields>
            <asp:TemplateField HeaderText="Part Identifier" SortExpression="part">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("part") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="TextBox1" ValidationExpression="^([A-Z]{3})\d+$" ErrorMessage="Invalid format (3 chars and a number)" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Max Score" SortExpression="maxScore">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("maxScore") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    
</asp:Content>
