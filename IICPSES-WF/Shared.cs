using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace IICPSES_WF
{
    public class Shared
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["IICPSES"].ConnectionString;
        }
    }
}