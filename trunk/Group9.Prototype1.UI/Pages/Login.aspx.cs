using System;
using System.Security.Principal;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = user_select.SelectedItem.Text;

            // Initialize FormsAuthentication, for what it's worth
            FormsAuthentication.Initialize();
            System.Configuration.Configuration webConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/");
            System.Configuration.ConnectionStringSettings connString;
            connString = webConfig.ConnectionStrings.ConnectionStrings["NET-Prototype1ConnectionString"];

            SqlConnection conn = new SqlConnection(connString.ConnectionString);
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "SELECT role FROM Person WHERE pnr = @pnr";
            cmd.Parameters.Add("@pnr", SqlDbType.VarChar).Value = user_select.SelectedValue;

            conn.Open();
	        SqlDataReader reader = cmd.ExecuteReader();
	        if (reader.Read())
	        {
                // Create a new ticket used for authentication
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                   1, // Ticket version
                   user_select.SelectedValue, // Username(Pnr) associated with ticket
                   DateTime.Now, // Date/time issued
                   DateTime.Now.AddMinutes(30), // Date/time to expire
                   true, // "true" for a persistent user cookie
                   reader.GetString(0),  // User-data, in this case the roles
                   FormsAuthentication.FormsCookiePath);// Path cookie valid for

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(
                   FormsAuthentication.FormsCookieName, // Name of auth cookie
                   hash); // Hashed ticket

                // Set the cookie's expiration time to the tickets expiration time
                if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);

                // Redirect to requested URL
                Response.Redirect("/");
            }
            else
            {
                // Never tell the user if just the username is password is incorrect.
                // That just gives them a place to start, once they've found one or
                // the other is correct!
                error_label.Text = "Not found.  Please try again.";
                error_label.Visible = true;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*user_select.Items.Clear();
            user_select.Items.Add(new ListItem(role_select.SelectedValue));*/
            user_select.DataBind();
            if(user_select.Items.Count > 0)
                user_select.Enabled = true;
        }
    }
}
