using System;
using System.Data;
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
                DropDownList tbResult;
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
                    tbResult = (DropDownList)row.FindControl("tbResult");

                    if (tbResult.SelectedValue.Length < 1)
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

                    partiPart.result = tbResult.SelectedValue[0];
                    partiPart.date = DateTime.Now;
                    partiPart.signature = User.Identity.Name;
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
            filterWindow.Visible = true;

            updateList();
        }

        protected void gvStudentsAndGrades_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) 
                return;

            var tbResult = (DropDownList)e.Row.FindControl("tbResult");
            var liResult = (Literal)e.Row.FindControl("liResult");

            var data = ((Participant)e.Row.DataItem).GetResult(ddlCoursePart.SelectedValue);

            tbResult.Attributes.Add("onchange", string.Format("this.style.backgroundColor = (this.value == '{0}' ? 'white' : '#7EFF7C');", data.Result.HasValue ? data.Result.ToString() : ""));
            
            if (data.Result != null)
            {
                tbResult.SelectedValue = data.Result.ToString();

                liResult.Text = string.Format("Last result {0}, registered by: {1}, {2:g}", data.Result, data.Signature.FullName, data.Date);
            }
        }

        protected void postFilter_Click(object sender, EventArgs e)
        {
            updateList();
        }

        

        protected void resetFilter_Click(object sender, EventArgs e)
        {
            tbFilterPnr.Text = "";
            tbFilterFName.Text = "";
            tbFilterLName.Text = "";
            updateList();
        }
        
        protected void updateList()
        {
            String pnr = "", fName = "", lName = "";

            pnr = tbFilterPnr.Text;
            fName = tbFilterFName.Text;
            lName = tbFilterLName.Text;

            DBDataContext context = new DBDataContext();

            var participants = from p in context.Participants
                               where p.runid == ddlCourseRun.SelectedValue &&
                                     p.code == ddlCourse.SelectedValue
                               select p;


            if (pnr.Length > 0)
            {
                participants = from p in participants
                               where p.pnr.StartsWith(pnr)
                               select p;
            }
            if (fName.Length > 0)
            {
                participants = from p in participants
                               where p.Person.fName.StartsWith(fName)
                               select p;
            }
            if (lName.Length > 0)
            {
                participants = from p in participants
                               where p.Person.eName.StartsWith(lName)
                               select p;
            }

            gvStudentsAndGrades.DataSourceID = "";
            gvStudentsAndGrades.DataSource = participants;
            gvStudentsAndGrades.DataBind(); 
        }
    }
}
