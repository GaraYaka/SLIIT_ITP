using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIIT.ITP.UI.PR
{
    public partial class po : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Add Purchase Order";
            SetPageSubTitle = string.Empty;
        }
    }
}