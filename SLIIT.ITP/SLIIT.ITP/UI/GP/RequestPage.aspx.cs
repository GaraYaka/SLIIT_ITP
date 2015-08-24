using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIIT.ITP.UI.GP
{
    public partial class RequestPage : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SetPageTitle = "Request Gate Pass";
            SetPageSubTitle = string.Empty; 
        }
    }
}