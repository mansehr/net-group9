/*using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
//using System.Web.UI.HtmlControls;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
using Group9.Prototype1.DataAccess;
//using System.Xml.Linq;*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI.Pages
{
    public partial class _Default : System.Web.UI.Page
    {
        protected Person currentPerson
        {
            get;
            set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            DBDataContext c = new DBDataContext();
            currentPerson = c.Persons.SingleOrDefault(x => x.pnr == Context.User.Identity.Name);

        }
    }
}
