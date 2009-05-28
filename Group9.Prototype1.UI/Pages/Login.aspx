<%@ Page Language="C#" MasterPageFile="../Layouts/Default.Master" AutoEventWireup="true" Inherits="Group9.Prototype1.UI.Pages.Login" CodeBehind="Login.aspx.cs" Title="Login page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2>Login</h2>
    <div style="width: 300px; margin: 0 auto;">
        <asp:Label ID="error_label" runat="server" Font-Bold="True" ForeColor="Red" 
            Visible="False"></asp:Label>
        <p>
        Nu inloggad som:
        <asp:Label ID="Label1" runat="server" Text="Ej inloggad"></asp:Label>
        </p>
        <p>
        Beh�righet:
        <asp:DropDownList ID="role_select" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
            <asp:ListItem Value="student">Student</asp:ListItem>
            <asp:ListItem Value="admin">Kursadministrat�r</asp:ListItem>
            <asp:ListItem Value="assistant">Kursassistent</asp:ListItem>
        </asp:DropDownList>
        </p>
        <p>
        Anv�ndare:
        <asp:DropDownList ID="user_select" runat="server" DataSourceID="users" 
            DataTextField="FullName" DataValueField="pnr">
        </asp:DropDownList>
        <asp:LinqDataSource ID="users" runat="server" 
                ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
                Select="new (FullName, pnr)" TableName="Persons" Where="role == @role">
            <WhereParameters>
                <asp:ControlParameter ControlID="role_select" Name="role" 
                    PropertyName="SelectedValue" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        </p>
        <p>
        <asp:Button ID="Button1" runat="server" Height="33px" Text="Login" 
            Width="130px" onclick="Button1_Click" />      
        </p>
    </div>
</asp:Content>