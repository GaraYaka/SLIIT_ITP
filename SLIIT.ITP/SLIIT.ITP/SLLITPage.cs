using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLIIT.Core.BL;
using SLIIT.Core.Entity;
using SLIIT.ITP;

namespace SLIIT.ITP
{
    public class SLLITPage : System.Web.UI.Page
    {

        /// <summary>
        /// Get Current User ID
        /// </summary>
        public int CurrentUserID
        {
            get
            {
                if (Session[SLIITCommonResource.USER_ID] == null)
                {
                    throw new Exception("Invalid User ID");
                }

                return (int)Session[SLIITCommonResource.USER_ID];
            }

            set
            {
                Session[SLIITCommonResource.USER_ID] = value;
            }
        }



        public string SetPageTitle
        {
            set
            {
                var master = Master as SiteMaster;

                if (master != null)
                {
                    master.SetPageTitle = value;
                }
            }
        }

        public string SetPageSubTitle
        {
            set
            {
                var master = Master as SLIIT.ITP.SiteMaster;

                if (master != null)
                {
                    master.SetPageSubTitle = value;
                }
            }
        }

    }
}