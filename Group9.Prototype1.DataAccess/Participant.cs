using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Group9.Prototype1.DataAccess
{
    public partial class Participant
    {
        public GradeRegistration GetResult(string part)
        {
            var pp = (from p in PartiParts where p.part == part orderby p.date select p).LastOrDefault();
            return pp == null
                       ? default(GradeRegistration)
                       : new GradeRegistration()
                        {
                            Date = pp.date,
                            Result = pp.result,
                            Signature = pp.signature
                        };
        }
    }
}
