using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                DBDataContext context = new DBDataContext();
                var person = context.Persons.Single(x => x.pnr == User.Identity.Name);

                liWelcome.Text = string.Format("Welcome <strong>{0}</strong>, you have the role as <strong>{1}</strong>.", person.FullName, person.Role.description);
            }
            else
            {
                liSigning.Text = "<p><a href=\"Pages/Login.aspx\">Click here to login</a></p>";
            }

        }
    }
}
