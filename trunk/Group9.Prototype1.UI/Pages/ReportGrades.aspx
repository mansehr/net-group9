<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="ReportGrades.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.ReportGrades" %>
<%@ Import Namespace="System.Linq"%>
<%@ Import Namespace="Group9.Prototype1.DataAccess"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:LinqDataSource ID="ldsCourses" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="Courses">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsCourseRuns" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="CourseRuns" Where="code == @code">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCourse" Name="code" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsCourseParts" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
        TableName="CourseParts" Where="code == @code && runid == @runid">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCourse" Name="code" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlCourserun" Name="runid" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource id="ldsParticipants" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext"
        TableName="Participants" Where="runid == @runid &amp;&amp; code == @code">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlCourse" Name="code" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlCourseRun" Name="runid" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:ScriptManager ID="scriptManager" runat="server" />

    <h2>Report grades</h2>

    <asp:UpdatePanel ID="updatePanel" runat="server">
    <ContentTemplate>
    
    
    
    <div id="filterWindow" style=" float: right; border: 1px solid black; width:300px; padding: 0px 5px 5px 5px;" runat="server">
        <h3>Filter</h3>
        <fieldset>
               <ul>
                <li><label>Firstname</label>
                <asp:TextBox ID="tbFilterFName" runat="server" Width="120"></asp:TextBox> 
                </li>
                <li><label>Lastname</label>
                     <asp:TextBox ID="tbFilterLName" runat="server"  Width="120"></asp:TextBox>
                </li>
               <li> <label>SSN </label>
                    <asp:TextBox ID="tbFilterPnr" runat="server"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="tbFilterPnr_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" TargetControlID="tbFilterPnr"  
                        FilterType="Numbers">
                    </cc1:FilteredTextBoxExtender><br />
                </li>
               </ul>
               <span style="float:left; margin-top: 10px">
                <asp:LinkButton ID="resetFilter" runat="server" BorderColor="Black" 
                    BorderStyle="Dotted" BorderWidth="1px" onclick="resetFilter_Click">Reset</asp:LinkButton>
              </span>
              <span style="float:right; margin-top: 10px">
                   <asp:LinkButton ID="postFilter" runat="server" BorderColor="Black" 
                       BorderStyle="Dotted" BorderWidth="1px" onclick="postFilter_Click">Filtrer</asp:LinkButton>
              </span>
         </fieldset>
        </div>
      <asp:Label ID="lbMessage" runat="server" Visible="false" EnableViewState="false" Font-Size="12pt" ></asp:Label>  
    <h3>Select course and course run</h3>
    <fieldset>
        <ul>
            <li><label>Course</label>
                <asp:DropDownList ID="ddlCourse" runat="server" DataTextField="name" 
                    DataValueField="code" DataSourceID="ldsCourses" AutoPostBack="True" 
                    ondatabound="AddBlankItem" />
            </li>
            <li><label>Course run</label>
                <asp:DropDownList ID="ddlCourseRun" runat="server" DataTextField="startDate" DataTextFormatString="{0:d}" 
                    DataValueField="runid" DataSourceID="ldsCourseRuns" ondatabound="AddBlankItem" AutoPostBack="true" />
            </li>
            <li><label>Part</label>
                <asp:DropDownList ID="ddlCoursePart" runat="server" DataTextField="description" 
                    DataValueField="part" DataSourceID="ldsCourseParts" AutoPostBack="True" 
                    ondatabound="AddBlankItem" 
                    onselectedindexchanged="ddlCoursePart_SelectedIndexChanged"/>
            </li>
        </ul>
    </fieldset>
    <p>&nbsp;</p>
        
    <asp:Panel ID="panelGrades" runat="server" Visible="false">
        
        
        <h3>Students and enter grade</h3>
        
        <asp:GridView ID="gvStudentsAndGrades" runat="server" 
            DataSourceID="ldsParticipants" DataKeyNames="pnr" AutoGenerateColumns="False" 
            onrowdatabound="gvStudentsAndGrades_RowDataBound" AllowSorting="True" 
            AllowPaging="True" >
            <Columns>
                <asp:TemplateField HeaderText="Student" SortExpression="Person.FullName">
                    <ItemTemplate>
                        <%# Eval("Person.FullName") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SSN" SortExpression="pnr">
                    <ItemTemplate>
                        <%# Eval("Person.pnr") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Grade">
                    <ItemTemplate>
                        <asp:DropDownList ID="tbResult" runat="server">
                            <asp:ListItem Text="" />
                            <asp:ListItem Text="F" />
                            <asp:ListItem Text="E" />
                            <asp:ListItem Text="D" />
                            <asp:ListItem Text="C" />
                            <asp:ListItem Text="B" />
                            <asp:ListItem Text="A" />
                        </asp:DropDownList>
                        <small><asp:Literal ID="liResult" runat="server" /></small>
                    </ItemTemplate>                 
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate >
                Found no users. 
            </EmptyDataTemplate>
        </asp:GridView>

        <p>
            <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
        </p>

        <cc1:ConfirmButtonExtender ID="btnSave_ConfirmButtonExtender" runat="server" 
            ConfirmText="Are you sure?" Enabled="True" TargetControlID="btnSave">
        </cc1:ConfirmButtonExtender>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
