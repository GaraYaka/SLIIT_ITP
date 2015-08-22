using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class PC_IOUHeader
    {
        public int RnIOUID { get; set; }
        public string FormattedIOUID
        {
            get { return SLIITCommonResource.FormatIOUHeaderID(RnIOUID); }
        }
        public DateTime? IOUDate { get; set; }
        public int? ApprovedBy { get; set; }
        public string DisplayNameApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public int? RejectedBy { get; set; }
        public string DisplayRejectedBy { get; set; }
        public DateTime? RejectedDate { get; set; }
        public string RejectReason { get; set; }
        public DateTime? PaidDate { get; set; }
        public int? Status { get; set; }
        public string StatusText
        {
            get { return SLIITCommonResource.GetStatusText(Status); }
        }
        public bool? IsDeleted { get; set; }
        public int? InsertedBy { get; set; }
        public string DisplayInsertedBy { get; set; }
        public DateTime? InsertedDate { get; set; }
        public int? PCOfficer { get; set; }
        public string DisplayPCOfficer { get; set; }
        public int? LastUpdatedBy { get; set; }
        public DateTime? LastUpdatedDate { get; set; }
    }
}
