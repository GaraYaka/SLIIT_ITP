using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.IO;
using System.Web.Script.Serialization;
using System.Transactions; //if transaction manager is used only
using System.Net.Mail;
using SLIIT.Core;
using SLIIT.Core.BL;
using SLIIT.Core.Entity;
using SLIIT.Core.DTO;
using SLIIT.ITP.UI;

namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for UserServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class UserServices : System.Web.Services.WebService
    {
        #region WebMethods
        

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string HelloWorld()
        {
            
            return "Hello World";
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string GetUserBySession()
        {
            //return new SLIIT.Core.UserBL;
            return string.Empty;
        }


        /// <summary>
        /// Auth user, if correct set session and redirect to default page else throw exception
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void AuthUser(string username, string password)
        {
            
            User userToAuth = new User();

            userToAuth.UserName = username.ToLower();
            userToAuth.Password = password;

            var result = new UserBL().AutenticateLogin(userToAuth);

            if (result != null)
            {
                var session = new SLIIT.ITP.SLLITPage();

                session.CurrentUserID = result.RnUserID;

            }
            else
            {
                throw new Exception(SLIITCommonResource.ERROR_Incorrect_Credentials.ToString());
            }

        }

        #endregion

        #region PrivateMethods
        
        #endregion
    }
}
