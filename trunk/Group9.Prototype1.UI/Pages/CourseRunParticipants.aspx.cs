using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI.Pages
{
    public partial class CourseRunParticipants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindPeople("pnr");
            }
        }

        public void BindPeople(string sort)
        {
            DBDataContext context = new DBDataContext();
            var people = from p in context.Persons
                         where p.role == "student"
                         select p;

            var participants = from p in context.Participants
                               where p.runid == Request.QueryString["runid"] &&
                                     p.code == Request.QueryString["code"]
                               select p.Person;

            var list = people.Except(participants);

            switch (sort)
            {
                case "pnr":
                    list = list.OrderBy(x => x.pnr);
                    break;
                case "fName":
                    list = list.OrderBy(x => x.fName);
                    break;
                case "eName":
                    list = list.OrderBy(x => x.eName);
                    break;
            }

            gvAddParticipant.DataSource = list;
            gvAddParticipant.DataBind();
        }

        protected void gvAddParticipant_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "AddParticipant")
                return;

            var pnr = Convert.ToString(gvAddParticipant.DataKeys[Convert.ToInt32(e.CommandArgument)].Value);

            using (DBDataContext context = new DBDataContext())
            {
                context.Participants.InsertOnSubmit(new Participant()
                {
                    code = Request.QueryString["code"],
                    runid = Request.QueryString["runid"],
                    pnr = pnr
                });

                context.SubmitChanges();
            }

            BindPeople(gvAddParticipant.SortExpression);
            participants.DataBind();
        }

        protected void gvAddParticipant_Sorting(object sender, GridViewSortEventArgs e)
        {
            BindPeople(e.SortExpression);
        }
    }
}
