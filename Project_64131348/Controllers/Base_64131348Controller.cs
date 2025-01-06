using Microsoft.Ajax.Utilities;
using Project_64131348.Models;
using Project_64131348.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Project_64131348.Controllers
{
    public class Base_64131348Controller : Controller
    {  
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserLogin)HttpContext.Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                RouteValueDictionary(new { controller = "Login_64131348", action = "Index" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}