using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Group9.Prototype1.DataAccess
{
    public partial class Person
    {
        public string FullName 
        { 
            get 
            { 
                return string.Format("{0} {1}", fName, eName);
            } 
        }
    }
}
