using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class PC_IOUDetails
    {
        public int RnIOUDetailID { get; set; }
        public int IOUHeaderID { get; set; }
        public string Description { get; set; }
        public int CategoryID { get; set; }
        public decimal Amount { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime InsertedDate { get; set; }
        public int? LastUpdatedBy { get; set; }
        public DateTime LastUpdatedDate { get; set; }
    }
}
