using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LoreSoft.MathExpressions;

namespace Group9.Prototype1.DataAccess
{
    public partial class CourseRun
    {
        public char CalculateGrade(Person person)
        {
            if (string.IsNullOrEmpty(this.gradeFormula))
                throw new InvalidOperationException("Grade formula must be set");

            var participant = Participants.SingleOrDefault(x => x.pnr == person.pnr);
            if (participant == null)
                throw new ArgumentException("Person not in this course run.");

            var evaluator = new MathEvaluator();
            foreach (var part in CourseParts)
            {
                var resultRegistration = participant.GetResult(part.code);
                var result = resultRegistration.Result.HasValue ? resultRegistration.Result.Value : 0;

                evaluator.Variables.Add(part.part, result);
            }

            return evaluator.Evaluate(this.gradeFormula).ToGrade();
        }
    }

    public static class GradeExtension
    {
        public static char ToGrade(this double value)
        {
            return Convert.ToChar(65 + (int)value);
        }

        public static double FromGrade(this char value)
        {
            return Convert.ToDouble((int)value - 65);
            
        }
    }
}
