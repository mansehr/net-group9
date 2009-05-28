using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mobile;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Group9.Prototype1.DataAccess;

namespace Group9.Prototype1.UI.Mobile
{
    public partial class Report : System.Web.UI.MobileControls.MobilePage
    {
        protected DBDataContext db = new DBDataContext();

        protected string CurrentCourseCode
        {
            get { return (string)ViewState["currentCourseCode"]; }
            set { ViewState["currentCourseCode"] = value; }
        }

        protected string CurrentRunID
        {
            get { return (string)ViewState["currentRunId"]; }
            set { ViewState["currentRunId"] = value; }
        }

        protected string CurrentStudentName
        {
            get { return (string)ViewState["currentStudentName"]; }
            set { ViewState["currentStudentName"] = value; }
        }

        protected string CurrentStudentSSN
        {
            get { return (string)ViewState["currentStudentSSN"]; }
            set { ViewState["currentStudentSSN"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCourses();
            }
        }

        public void SelectCourse(object sender, ListCommandEventArgs e)
        {
            CurrentCourseCode = e.ListItem.Value;

            BindRun();
            Breadcrum2.Text = string.Format("{0}", CurrentCourseCode);

            ActiveForm = Form2;
        }

        public void SelectRun(object sender, ListCommandEventArgs e)
        {
            CurrentRunID = e.ListItem.Value;
            
            BindStudents();
            Breadcrum3.Text = string.Format("{0} > {1}", CurrentCourseCode, CurrentRunID);

            ActiveForm = Form3;
        }

        public void SelectStudent(object sender, ListCommandEventArgs e)
        {
            CurrentStudentName = e.ListItem.Text;
            CurrentStudentSSN = e.ListItem.Value;

            BindParts();
            Breadcrum4.Text = string.Format("{0} > {1} > {2}", CurrentCourseCode, CurrentRunID, CurrentStudentName);

            ActiveForm = Form4;
        }

        public void ReportGrade(object sender, EventArgs e)
        {
            var partipart = db.PartiParts.SingleOrDefault(x =>
                x.code == CurrentCourseCode &&
                x.pnr == CurrentStudentSSN &&
                x.runid == CurrentRunID &&
                x.part == partList.Selection.Value);

            if (partipart == null)
            {
                partipart = new PartiPart();
                partipart.code = CurrentCourseCode;
                partipart.pnr = CurrentStudentSSN;
                partipart.runid = CurrentRunID;
                partipart.part = partList.Selection.Value;

                db.PartiParts.InsertOnSubmit(partipart);
            }

            partipart.result = gradeList.Selection.Value[0];
            partipart.signature = User.Identity.Name;
            partipart.date = DateTime.Now;

            db.SubmitChanges();

            ActiveForm = Form5;       
        }

        public void Return(object sender, EventArgs e)
        {
            ActiveForm = Form1;
        }

        public void BindCourses()
        {
            courseList.DataSource = from c in db.Courses select c;
            courseList.DataBind();
        }

        public void BindRun()
        {
            runList.DataSource = from c in db.CourseRuns 
                                 where c.code == CurrentCourseCode 
                                 select c;
            runList.DataBind();
        }

        public void BindStudents()
        {
            studentList.DataSource = from p in db.Participants
                                     where p.code == CurrentCourseCode &&
                                           p.runid == CurrentRunID
                                     select p.Person;
            studentList.DataBind();
        }

        public void BindParts()
        {
            partList.DataSource = from p in db.CourseParts
                                     where p.code == CurrentCourseCode &&
                                           p.runid == CurrentRunID
                                     select p;
            partList.DataBind();
        }

        
    }
}