using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SLIIT.ITP;
using SLIIT.Core.BL;
using SLIIT.Core.Entity;

namespace SLIIT.ITP
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.setUserDetails();
            this.CreateSideMenu();
        }


        private void setUserDetails()
        {
            var session = new SLLITPage();

            var user = new UserBL().GetUserByID(session.CurrentUserID);

            lblUserName.Text = user.DisplayName;
        }



        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
        }

        #region Getters/Setters

        public string SetPageTitle
        {
            set
            {

                lblTitle.Text = value;
            }
        }

        public string SetPageSubTitle
        {
            set
            {
                lblSubTile.Text = value;
            }
        }

        #endregion

        #region PrivateRegion

        private void CreateSideMenu()
        {
            var session = new SLLITPage();

            var menu = new UserRoleBL().GetMenuByUserID(session.CurrentUserID);

            string html = "";
            liItems.InnerHtml = String.Empty;

            var tempHtml = string.Empty;
            var finalHtml = string.Empty;

            var currentRoleName = string.Empty;

            finalHtml += "<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below 'sidebar-toggler-wrapper' LI element -->";
            finalHtml += "<li class='sidebar-toggler-wrapper'>";
            finalHtml += "   <!-- BEGIN SIDEBAR TOGGLER BUTTON -->";
            finalHtml += "   <div class='sidebar-toggler'>";
            finalHtml += "   </div>";
            finalHtml += "   <!-- END SIDEBAR TOGGLER BUTTON -->";
            finalHtml += "</li>";
            finalHtml += "<li class='start active'>";
            finalHtml += "   <a href='" + ResolveUrl("~/Default.aspx") + "'>";
            finalHtml += "       <i class='icon-home'></i>";
            finalHtml += "       <span class='title'>Home</span>";
            finalHtml += "       <span class='selected'></span>";
            finalHtml += "   </a>";
            finalHtml += "</li>";

            foreach (var item in menu)
            {
                if (currentRoleName == string.Empty)//first case
                {
                    currentRoleName = item.RoleName;

                    finalHtml += "<li>";
                    finalHtml += "  <a href='javascript:;'>";
                    finalHtml += "      <i class='fa " + item.RoleIcon + "'></i>";
                    finalHtml += "      <span class='title'>" + item.RoleName + "</span>";
                    finalHtml += "      <span class='arrow '></span>";
                    finalHtml += "  </a>";
                    finalHtml += "<ul class='sub-menu'>";
                }

                if (currentRoleName != item.RoleName)//if role changes
                {
                    currentRoleName = item.RoleName;
                    finalHtml += tempHtml;
                    finalHtml += "      </ul>";
                    finalHtml += "  </li>";
                    finalHtml += "<li>";
                    finalHtml += "  <a href='javascript:;'>";
                    finalHtml += "      <i class='fa " + item.RoleIcon + "'></i>";
                    finalHtml += "      <span class='title'>" + item.RoleName + "</span>";
                    finalHtml += "      <span class='arrow '></span>";
                    finalHtml += "  </a>";
                    finalHtml += "<ul class='sub-menu'>";

                    tempHtml = string.Empty;
                }

                tempHtml += " <li><a href='" + ResolveUrl(item.MenuHomePage) + "'>" + item.MenuDisplayName + "</a></li>";
            }

            finalHtml += tempHtml;
            finalHtml += "  </ul>";
            finalHtml += "</li>";

            liItems.InnerHtml = finalHtml;

        }

        #endregion



    }

}