using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group9.Prototype1.UI.Pages
{
    public partial class CourseRunParticipants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void newParticipant_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            participants.DataBind();
        }

        protected void newParticipant_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values.Add("code", Request.QueryString["code"]);
            e.Values.Add("runid", Request.QueryString["runid"]);
        }
    }
}
