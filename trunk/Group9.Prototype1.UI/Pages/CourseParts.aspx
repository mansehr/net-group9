<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="CourseParts.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.CourseParts" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager id="scriptManager" runat="server" />
    <asp:LinqDataSource ID="ldsCourseParts" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="CourseParts" Where="code == @code && runid == @runid" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="code" QueryStringField="code" Type="String" />
            <asp:QueryStringParameter Name="runid" QueryStringField="runid" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    <h2>Course run parts</h2>

    <asp:GridView ID="coursePartsView" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="code,part" DataSourceID="ldsCourseParts">
        <Columns>
            <asp:BoundField DataField="part" HeaderText="Part Identifier" ReadOnly="True" 
                SortExpression="part" />
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" />
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
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Display="Dynamic" />
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="TextBox1" ValidationExpression="^([A-Z]{3,5})$" ErrorMessage="Invalid format (3-5 chars)" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Display="Dynamic" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    
</asp:Content>
