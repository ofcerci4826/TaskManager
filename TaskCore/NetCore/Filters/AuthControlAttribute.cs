using System;
using System.Collections.Generic;
using System.Text;
using TaskCore.Core.IO;
using TaskCore.NetCore.Models;
using TaskCore.NetCore.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;

namespace TaskCore.NetCore.Filters
{
    /// <summary>
    /// Checks session or token 
    /// Checks authorization
    /// </summary>
    public class AuthControlAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// Http parameter key name which will be use to check authorization
        /// </summary>
        public string IdKey { get; set; } = null;

        /// <summary>
        /// Authorization check type
        /// </summary>
        public string Type { get; set; } = null;

        /// <summary>
        /// Session key for session control, default (Kullanici)
        /// **Session object has to include Token property
        /// </summary>
        public string SessionKey { get; set; } = "Kullanici";

        /// <summary>
        /// Token key for token control, default (token)
        /// </summary>
        public string TokenKey { get; set; } = "token";

        /// <summary>
        /// 
        /// </summary>
        /// <param name="filterContext"></param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                string token = string.Empty;

                if (string.IsNullOrEmpty(ContextObject.Current.Session.GetString(SessionKey)))
                {
                    if (ContextObject.Current.Request.Query.ContainsKey(TokenKey))
                        token = ContextObject.Current.Request.Query[TokenKey];
                }
                else token = JsonConvert.DeserializeObject<User>(ContextObject.Current.Session.GetString(SessionKey)).Token;

                if (string.IsNullOrEmpty(token))
                {
                    SecurityHelper.Redirect(filterContext, "Error", "Session", (int)Status.INVALID_SESSION);
                    return;
                }

                long refId = -1;

                try
                {
                    if (!string.IsNullOrEmpty(IdKey))
                    {
                        if (ContextObject.Current.Request.Query.ContainsKey(IdKey))
                            long.TryParse(ContextObject.Current.Request.Query[IdKey].ToString(), out refId);
                        else if (ContextObject.Current.Request.Form.ContainsKey(IdKey))
                            long.TryParse(ContextObject.Current.Request.Form[IdKey].ToString(), out refId);
                    }
                }
                catch (Exception)
                {

                }

                string result = SecurityHelper.TokenAndAuthControl(token, filterContext.RouteData.Values["Controller"].ToString(), filterContext.RouteData.Values["Action"].ToString(), Type, refId);

                if ("INVALID_TOKEN".Equals(result))
                {
                    SecurityHelper.Redirect(filterContext, "Error", "Session", (int)Status.INVALID_SESSION);
                    return;
                }

                if (!"SUCCEED".Equals(result))
                {
                    SecurityHelper.Redirect(filterContext, "Error", "Forbidden", (int)Status.NOT_AUTHORIZED);
                    return;
                }

                SecurityHelper.RequestLog();
            }
            catch (Exception ex)
            {
                Log.Error(ex, LogHelper.GetPrefix());

                SecurityHelper.Redirect(filterContext, "Error", "Server", (int)Status.ERROR_SERVER);
            }
        }
    }
}
