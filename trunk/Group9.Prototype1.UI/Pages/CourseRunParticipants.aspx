<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="CourseRunParticipants.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.CourseRunParticipants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:LinqDataSource ID="ldsParticipants" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="Participants" Where="code == @code &amp;&amp; runid == @runid" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="code" QueryStringField="code" Type="String" />
            <asp:QueryStringParameter Name="runid" QueryStringField="runid" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    <asp:LinqDataSource ID="ldsPeople" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        Select="new (FullName, pnr)" TableName="Persons">
    </asp:LinqDataSource>
    
    <asp:LinqDataSource ID="ldsRoles" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        Select="new (Name)" TableName="Roles">
    </asp:LinqDataSource>
    
    <h2>Participants</h2>
    
    <asp:GridView ID="participants" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="pnr,runid,code" DataSourceID="ldsParticipants">
        <Columns>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Role.Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Person">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Person.FullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course grade">
                <ItemTemplate>
                    <%#  %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    
    <h3>Add participant</h3>
    <asp:DetailsView ID="newParticipant" runat="server" 
        DataSourceID="ldsParticipants" DefaultMode="Insert" AutoGenerateRows="false" 
        oniteminserted="newParticipant_ItemInserted" 
        oniteminserting="newParticipant_ItemInserting" >
        <Fields>
            <asp:TemplateField HeaderText="Role">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="ldsRoles" DataValueField="Name" DataTextField="Name" SelectedValue='<%# Bind("roll") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Person">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPerson" runat="server" DataSourceID="ldsPeople" DataValueField="pnr" DataTextField="FullName" SelectedValue='<%# Bind("pnr") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
