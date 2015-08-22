using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;


namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for PCServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PCServices : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public PC_IOUHeader GetIOUHeaderByID(int iouheader)
        {
            var header = new PC_IOUHeaderBL().GetIOUByHeaderID(iouheader);

            return header;

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<PC_IOUHeader> GetAllIOUs()
        {
            var header = new PC_IOUHeaderBL().GetAllIOUs();

            return header;

        }

    }
}
