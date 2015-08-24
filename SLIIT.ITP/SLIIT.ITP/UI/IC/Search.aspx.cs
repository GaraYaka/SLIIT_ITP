using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIIT.ITP.UI.IC
{
    public partial class Search : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Search";
            SetPageSubTitle = string.Empty;
           
        }

        protected void DropDownSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}