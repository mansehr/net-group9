<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Group9.Prototype1.UI.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <h2>Welcome to Group 9's RES system</h2>
    <p>
        <asp:Literal ID="liWelcome" runat="server" />
    </p>
    <p>
        <asp:Literal ID="liSigning" runat="server" />
    </p>
</asp:Content>
