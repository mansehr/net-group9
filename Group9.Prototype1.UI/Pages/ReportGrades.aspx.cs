using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI.Pages
{
    public partial class ReportGrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddBlankItem(object sender, EventArgs e)
        {
            ((DropDownList)sender).Items.Insert(0, new ListItem(string.Empty));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (var scope = new TransactionScope())
            using (var db = new DBDataContext())
            {
                TextBox tbResult;
                PartiPart partiPart;
                string pnr;

                var partiParts = from p in db.PartiParts
                                 where
                                     p.code == ddlCourse.SelectedValue &&
                                     p.runid == ddlCourseRun.SelectedValue &&
                                     p.part == ddlCoursePart.SelectedValue
                                 select p;

                foreach (GridViewRow row in gvStudentsAndGrades.Rows)
                {
                    tbResult = (TextBox)row.FindControl("tbResult");

                    if (tbResult.Text.Length < 1)
                    {
                        continue;
                    }

                    pnr = gvStudentsAndGrades.DataKeys[row.DataItemIndex][0] as string;
                    partiPart = partiParts.SingleOrDefault(x => x.pnr == pnr);

                    if (partiPart == null)
                    {
                        partiPart = new PartiPart()
                        {
                            code = ddlCourse.SelectedValue,
                            runid = ddlCourseRun.SelectedValue,
                            part = ddlCoursePart.SelectedValue,
                            pnr = pnr
                        };

                        db.PartiParts.InsertOnSubmit(partiPart);
                    }

                    partiPart.result = tbResult.Text[0];
                    partiPart.date = DateTime.Now;
                    partiPart.signature = "KR";
                }

                db.SubmitChanges();

                scope.Complete();
            }

            lbMessage.Text = "The reported grades has been updated";
            lbMessage.Visible = true;
        }

        protected void ddlCoursePart_SelectedIndexChanged(object sender, EventArgs e)
        {
            panelGrades.Visible = true;
            gvStudentsAndGrades.DataBind();
        }

        protected void gvStudentsAndGrades_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) 
                return;

            var tbResult = (TextBox)e.Row.FindControl("tbResult");
            var liResult = (Literal)e.Row.FindControl("liResult");

            var data = ((Participant)e.Row.DataItem).GetResult(ddlCoursePart.SelectedValue);

            tbResult.Attributes.Add("onchange", string.Format("this.style.backgroundColor = (this.value == '{0}' ? 'white' : '#7EFF7C');", data.Result.HasValue ? data.Result.ToString() : ""));
            
            

            if (data.Result != null)
            {
                tbResult.Text = data.Result.ToString();
                liResult.Text = string.Format("Last result {0}, registered by: {1}, {2:g}", data.Result, data.Signature, data.Date);
            }
        }
    }
}
