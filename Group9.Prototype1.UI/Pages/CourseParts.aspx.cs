using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Group9.Prototype1.UI.Pages
{
    public partial class CourseParts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values.Add("code", Request.QueryString["code"]);
            e.Values.Add("runid", Request.QueryString["runid"]);
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            coursePartsView.DataBind();
        }
    }
}
