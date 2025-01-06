using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_64131348.Common
{
    public class HasCredentiaAttribute : AuthorizeAttribute
    {
        public string IDQuyen { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[CommonConstants.USER_SESSION];
            if (session != null)
            {
                List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.UserName);
                if (privilegeLevels.Contains(this.IDQuyen) || session.IDNhom == CommonConstants.ADMIN_GROUP)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }

        private List<string> GetCredentialByLoggedInUser(string userName)
        {
            var credentials = (List<string>)HttpContext.Current.Session[CommonConstants.SESSION_CREDENTIAL];
            return credentials;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            // Chuyển hướng người dùng về trang đăng nhập (Index trong Login_64131348Controller)
            filterContext.Result = new RedirectToRouteResult(
                new System.Web.Routing.RouteValueDictionary
                {
            { "Controller", "Login_64131348" },
            { "Action", "Index" }
                });
        }

    }
}