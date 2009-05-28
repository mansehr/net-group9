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
        Select="new (pnr, fName, eName)" TableName="Persons" Where="role == @role">
        <WhereParameters>
            <asp:Parameter DefaultValue="student" Name="role" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
    <h2>Participants</h2>
    
    <asp:GridView ID="participants" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="pnr,runid,code" DataSourceID="ldsParticipants">
        <Columns>
            <asp:BoundField HeaderText="SSN" DataField="pnr" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Person.FullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course grade">
                <ItemTemplate>
                    <%# ((Group9.Prototype1.DataAccess.Participant)Container.DataItem).GetGrade() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    
    <h3>Add participant</h3>
    
    <asp:GridView ID="gvAddParticipant" runat="server" AutoGenerateColumns="False" 
        AllowSorting="True" DataKeyNames="pnr"
        onrowcommand="gvAddParticipant_RowCommand" 
        onsorting="gvAddParticipant_Sorting">
        <Columns>
            <asp:BoundField DataField="pnr" HeaderText="SSN" ReadOnly="True" 
                SortExpression="pnr" />
            <asp:BoundField DataField="fName" HeaderText="First Name" ReadOnly="True" 
                SortExpression="fName" />
            
            <asp:BoundField DataField="eName" HeaderText="Last Name" ReadOnly="True" 
                SortExpression="eName" />
            <asp:ButtonField CommandName="AddParticipant" Text="Add as student" />
            
        </Columns>
    </asp:GridView>
    
 </asp:Content>
