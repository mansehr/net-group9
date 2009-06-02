<%@ Page Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeBehind="participant.aspx.cs" Title="Course Participant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GvCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        //  show the modal popup
        this.mdlPopup.Show();
        //  set it to true so it will render
        this.dvCourseDetail.Visible = true;
        //  force databinding
        this.dvCourseDetail.DataBind();
        //  update the contents in the detail panel
        this.updPnlCourseDetail.Update();
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
       e.Command.Parameters["@pnr"].Value = User.Identity.Name;
    }

    protected void ldsUserParts_Selecting(object sender, LinqDataSourceSelectEventArgs e)
    {
        e.WhereParameters.Remove("pnr");
        e.WhereParameters.Add("pnr", User.Identity.Name);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server"> 
    
    <% // Datasources  %>
    <asp:LinqDataSource ID="ldsCourseDetails" runat="server" 
             ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
    TableName="CourseRuns" Where="code == @code" >
        <WhereParameters>
            <asp:ControlParameter ControlID="gvCourseList" Name="code" 
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsUserParts" runat="server" 
             ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
    TableName="PartiParts" Where="code == @code &amp;&amp; pnr == @pnr" 
        onselecting="ldsUserParts_Selecting" >
        <WhereParameters>
            <asp:ControlParameter ControlID="gvCourseList" Name="code" 
                PropertyName="SelectedValue" Type="String" />
            <asp:Parameter DefaultValue="" Name="pnr" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ldsUserLatestChange" runat="server" 
             ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
    TableName="PartiParts" GroupBy="code" 
    Select="new (key as code, it as PartiParts)" >
    </asp:LinqDataSource>
    
    
    
    <h2>Welcome</h2>
    <h3>Courses</h3>
    <asp:ScriptManager ID="scriptManager" runat="server" />
        <asp:LinqDataSource ID="ldsCourses" runat="server" 
            ContextTypeName="Group9.Prototype1.DataAccess.DBDataContext" 
            TableName="CourseRuns" >
            </asp:LinqDataSource>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>    
                <asp:GridView ID="gvCourseList" runat="server" DataSourceID="SqlDataSource1" 
                    GridLines="None" AutoGenerateColumns="False" 
                    AllowPaging="True" AllowSorting="True" 
                    OnSelectedIndexChanged="GvCourses_SelectedIndexChanged"
                    DataKeyNames="code" >
                    <Columns>
                        <asp:BoundField DataField="code" HeaderText="Course code" 
                            SortExpression="code" />
                        <asp:BoundField DataField="name" HeaderText="Course name" 
                            SortExpression="name" />
                        <asp:BoundField DataField="date" 
                            HeaderText="Last amended" SortExpression="date" />
                        <asp:BoundField DataField="part" HeaderText="Last part change" 
                            SortExpression="part" />
                       <asp:TemplateField>
					        <ItemTemplate>
					            <asp:LinkButton ID="btnViewDetails" runat="server" Text="View details" CommandName="Select" />
					        </ItemTemplate>
				        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:NET-Prototype1ConnectionString %>" 
                    SelectCommand="SELECT * FROM [CoursePartView] WHERE ([pnr] = @pnr)" 
                    onselecting="SqlDataSource1_Selecting">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="" Name="pnr" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        
        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Width="600px" style="display: none;">
        <asp:UpdatePanel runat="server" ID="updPnlCourseDetail" UpdateMode="Conditional">
        <ContentTemplate>
            <h2>Course details</h2>
           <asp:Button id="btnShowPopup" runat="server" style="display:none" />
    		<cc1:ModalPopupExtender ID="mdlPopup" runat="server" 
    		    TargetControlID="btnShowPopup" PopupControlID="pnlPopup" 
    		    CancelControlID="btnClose" BackgroundCssClass="modalBackground" 
    		/>
    	  <asp:DetailsView ID="dvCourseDetail" runat="server" DataSourceID="ldsCourseDetails" 
                        GridLines="None" DefaultMode="Edit" AutoGenerateRows="False" 
                        Visible="False" Width="100%" DataKeyNames="runid,code">
            <Fields>
                <asp:BoundField DataField="code" HeaderText="Course name" ReadOnly="True" 
                    SortExpression="code" />
                <asp:BoundField DataField="runid" HeaderText="Course run" ReadOnly="True" 
                    SortExpression="runid" />
                <asp:BoundField DataField="startDate" HeaderText="Course start"  ReadOnly="True"
                    SortExpression="startDate" />
                <asp:BoundField DataField="description" HeaderText="Course description"  ReadOnly="True"
                    SortExpression="description" />
            </Fields>
        </asp:DetailsView>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="pnr,code,part" DataSourceID="ldsUserParts">
                <Columns>
                    <asp:BoundField DataField="part" HeaderText="Course part" ReadOnly="True" 
                        SortExpression="part" />
                    <asp:BoundField DataField="result" HeaderText="Result" ReadOnly="True" 
                        SortExpression="result" />
                    <asp:BoundField DataField="date" HeaderText="Registration date" ReadOnly="True" 
                        SortExpression="date" />
                    
                    <asp:BoundField DataField="Signature" HeaderText="Signature" ReadOnly="True" 
                        SortExpression="signature" />
                </Columns>
            </asp:GridView>
        <br />
            <div style="text-align: right;">
                <asp:LinkButton ID="btnClose" runat="server" 
                    Text="Close" CausesValidation="false" 
                />
            </div> 
        </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
  
</asp:Content>

