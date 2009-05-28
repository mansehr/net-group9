using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group9.Prototype1.UI.Pages
{
    public partial class OldReportGrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            wizard.ActiveStepIndex++;
        }

        protected void gvCourseRuns_SelectedIndexChanged(object sender, EventArgs e)
        {
            wizard.ActiveStepIndex++;
        }
    }
}
