using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SLIIT.ITP.UI.VF
{
    public partial class AddVehicle : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Add Vehicle";
            SetPageSubTitle = string.Empty;  
        }
    }
}