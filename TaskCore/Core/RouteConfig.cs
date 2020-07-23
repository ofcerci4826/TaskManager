using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Routing;

namespace TaskCore.Core
{
    public class RouteConfig
    {
        public static IRouteBuilder Use(IRouteBuilder routes)
        {

            routes.MapRoute(
                name: "default",
                template: "{controller=Anasayfa}/{action=Index}/{id?}");


            return routes;
        }
    }
}
