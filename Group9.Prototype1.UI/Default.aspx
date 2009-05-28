<%@ Page Language="C#" MasterPageFile="~/Layouts/Default.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Group9.Prototype1.UI.Pages._Default" Title="Welcome to RES" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h2>Welcome to Group 9's RES system</h2>


<script runat="server">
    private void Page_Load(Object Src, EventArgs e ) 
    {
        if (User.Identity.IsAuthenticated)
        {
            string[] roles = {"Admin", "Assistant", "Student"};
            string user_roles = "<br />Du har följande roller: <ul>";
           
            
            foreach (string role in roles)
            {
                if (Context.User.IsInRole(role.ToLower()))
                {
                    user_roles += "<li>" + role + "</li>";
                }
            }
            user_roles += "</ul>";

            Welcome.InnerHtml = "Välkommen, " + this.currentPerson.FullName +
                                    user_roles;
        }
        else
        {
            Signing.InnerHtml = "<p><a href=\"Pages/Login.aspx\">Click here to login</a></p>";
        }
    }
</script>

<span id="Welcome" runat="server" />
    <p>
    <span id="Signing" runat="server">
    
    </span>
    
    </p>       
</span>       
</asp:Content>

