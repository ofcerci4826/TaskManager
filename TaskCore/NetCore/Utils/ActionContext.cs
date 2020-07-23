using Microsoft.AspNetCore.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.Text;

namespace TaskCore.NetCore.Utils
{
    /// <summary>
    /// Action Context
    /// </summary>
    public class ActionContext
    {
        /// <summary>
        /// Configure it once in Startup.cs file
        /// </summary>
        /// <param name="actionContext"></param>
        public static void Configure(IActionContextAccessor actionContext)
        {
            Current = actionContext;
        }

        /// <summary>
        /// Gets Current object
        /// </summary>
        public static IActionContextAccessor Current { get; private set; }
    }
}
