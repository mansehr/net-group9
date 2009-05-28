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
                var resultRegistration = participant.GetResult(part.part);

                if (resultRegistration.Result.HasValue)
                    evaluator.Variables.Add(part.part, resultRegistration.Result.Value.FromGrade());
                else
                    return '?';
            }

            return evaluator.Evaluate(this.gradeFormula).ToGrade();
        }
    }

    

    public static class GradeExtension
    {
        public static char ToGrade(this double value)
        {
            switch ((int)Math.Ceiling(value))
            {
                case 0:
                    return 'F';
                case 1:
                    return 'E';
                case 2:
                    return 'D';
                case 3:
                    return 'C';
                case 4:
                    return 'B';
                case 5:
                    return 'A';
                default:
                    throw new ArgumentException("Invalid value " + value);
            }
        }

        public static double FromGrade(this char value)
        {
            switch (value)
            {
                case 'F':
                    return 0d;
                case 'E':
                    return 1d;
                case 'D':
                    return 2d;
                case 'C':
                    return 3d;
                case 'B':
                    return 4d;
                case 'A':
                    return 5d;
                default:
                    throw new ArgumentException("Invalid value " + value);
            }
        }
    }
}
