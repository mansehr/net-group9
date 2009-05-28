<%@ Page Language="C#" AutoEventWireup="true" Inherits="Group9.Prototype1.UI.Mobile.Report" Codebehind="Report.aspx.cs" EnableViewState="true" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
    <mobile:Form id="Form1" runat="server">
        <p>Select course:</p>
        <mobile:List ID="courseList" Runat="server" DataTextField="name" DataValueField="code" OnItemCommand="SelectCourse"></mobile:List>
    </mobile:Form>
    
    <mobile:Form id="Form2" runat="server">
        <mobile:Label ID="Breadcrum2" Runat="server"></mobile:Label>
        <p>Select course run:</p>
        <mobile:List ID="runList" Runat="server" DataTextField="runid" DataValueField="runid" OnItemCommand="SelectRun"></mobile:List>
    </mobile:Form>
    
    <mobile:Form id="Form3" runat="server">
        <mobile:Label ID="Breadcrum3" Runat="server"></mobile:Label>
        <p>Select student:</p>
        <mobile:List ID="studentList" Runat="server" DataTextField="FullName" DataValueField="pnr" OnItemCommand="SelectStudent"></mobile:List>
    </mobile:Form>
    
    <mobile:Form id="Form4" runat="server">
        <mobile:Label ID="Breadcrum4" Runat="server"></mobile:Label>
        <p>Report grade:</p>
        <mobile:SelectionList ID="partList" Runat="server" DataTextField="description" DataValueField="part"></mobile:SelectionList>
        <mobile:SelectionList ID="gradeList" Runat="server">
            <Item Text="- Grade -" Value="" />
            <Item Text="F" />
            <Item Text="E" />
            <Item Text="D" />
            <Item Text="C" />
            <Item Text="B" />
            <Item Text="A" />
        </mobile:SelectionList>
        <mobile:Command ID="saveButton" Runat="server" OnClick="ReportGrade">Save</mobile:Command>
    </mobile:Form>

    <mobile:Form id="Form5" runat="server">
        <p>Grade has been saved!</p>
        <mobile:Command Runat="server" OnClick="Return">Report another</mobile:Command>
    </mobile:Form>
</body>
</html>
