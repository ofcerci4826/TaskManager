using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Http;

namespace TaskCore.NetCore.Utils
{
    /// <summary>
    /// Http context object for .NET Core
    /// </summary>
    public class ContextObject
    {
        private static IHttpContextAccessor httpContextAccessor;

        /// <summary>
        /// Configure it once in Startup.cs file
        /// </summary>
        /// <param name="httpContextAccessor"></param>
        public static void Configure(IHttpContextAccessor httpContextAccessor)
        {
            ContextObject.httpContextAccessor = httpContextAccessor;
        }

        /// <summary>
        /// Gets HttpContext.Current object
        /// </summary>
        public static HttpContext Current
        {
            get
            {
                return httpContextAccessor.HttpContext;
            }
        }

      
    }
}
