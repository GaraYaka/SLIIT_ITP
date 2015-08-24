using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class GP_Request
    {
        public int RnRequestID { get; set; }
        public string CompanyName { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string EmailAddress { get; set; }
        public string ReasonForRequest { get; set; }
        public int? ApprovedBy { get; set; }
        public string ItemsToBeDeclared { get; set; }
        public string VisitingArea { get; set; }
        public DateTime? DateOfVisit { get; set; }
        public DateTime? FromTime { get; set; }
        public DateTime? ToTime { get; set; }
        public string RequestComments { get; set; }
        public int? Status { get; set; }
        public string StatusText
        {
            get { return SLIITCommonResource.GetStatusText(Status); }
        }
    }
}
