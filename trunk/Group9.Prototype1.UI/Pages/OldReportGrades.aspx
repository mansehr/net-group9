<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="OldReportGrades.aspx.cs" Inherits="Group9.Prototype1.UI.Pages.ReportGrades" %>
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
            <asp:ControlParameter ControlID="wizard$gvCourses" Name="code" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource id="ldsParticipants" runat="server" 
        ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" Select="Person"
        TableName="Participants" Where="runid == @runid &amp;&amp; code == @code &amp;&amp; roll == @roll">
        <WhereParameters>
            <asp:ControlParameter ControlID="wizard$gvCourses" Name="code" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="wizard$gvCourseRuns" Name="runid" 
                PropertyName="SelectedValue" Type="String" />
            <asp:Parameter DefaultValue="student" Name="roll" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:ScriptManager ID="scriptManager" runat="server" />
    <h2>Report Grades</h2>
    <asp:Wizard ID="wizard" runat="server" StepPreviousButtonType="Link" StepNextButtonType="Link"
        StartNextButtonType="Link" StartNextButtonText="" StepNextButtonText="" FinishCompleteButtonType="Link"
        FinishPreviousButtonType="Link" DisplaySideBar="false">
        <WizardSteps>
            <asp:WizardStep Title="Select course">
                <h3>Select course</h3>
                <asp:GridView ID="gvCourses" runat="server" DataKeyNames="code" 
                    DataSourceID="ldsCourses" AutoGenerateColumns="false" 
                    onselectedindexchanged="gvCourses_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="Code" DataField="Code" />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSelect" runat="server" CommandName="Select" Text='<%# Eval("name") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Credits" DataField="Credits" DataFormatString="{0} hp" />
                    </Columns>
                </asp:GridView>
            </asp:WizardStep>
            <asp:WizardStep Title="Select course run" AllowReturn="true">
                <h3>Select course run</h3>
                <asp:GridView ID="gvCourseRuns" runat="server" DataKeyNames="runid" 
                    DataSourceID="ldsCourseRuns" AutoGenerateColumns="false" onselectedindexchanged="gvCourseRuns_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Course run">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnSelect" runat="server" CommandName="Select" Text='<%# Eval("runid") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Start" DataField="startDate" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Description" DataField="Description" />
                    </Columns>
                </asp:GridView>
            </asp:WizardStep>
            <asp:WizardStep Title="Enter grades" AllowReturn="true">
                <h3>Enter grades</h3>
                <h4>Students</h4>
                <fieldset>
                <ul>
                    <li><label>Students</label>
                        <div>
                            <asp:CheckBoxList ID="cblStudents" runat="server" DataSourceID="ldsParticipants" DataTextField="FullName" DataValueField="pnr" RepeatLayout="Flow" />
                        </div>
                    </li>
                    <li><label>Part</label>
                        <asp:DropDownList ID="ddlPart" runat="server" />
                    </li>
                </ul>
                </fieldset>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
