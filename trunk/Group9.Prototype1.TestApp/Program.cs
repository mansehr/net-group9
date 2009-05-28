using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LoreSoft.MathExpressions;

namespace Group9.Prototype1.TestApp
{
    class Program
    {
        static void Main(string[] args)
        {
            MathEvaluator ev = new MathEvaluator();
            ev.Variables.Add("TENA", 2);

            var result = ev.Evaluate("2 * TENA");

            Console.WriteLine(result);
            Console.ReadLine();
        }
    }
}
