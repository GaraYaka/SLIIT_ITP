using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class IC_IssueItem
    {
        public int RnIssueID { get; set; }
        public string ItemCode { get; set; }

        public decimal IssuePrice { get; set; }

        public int? IssueQty { get; set; }

        public int? RnCatID { get; set; }

        public int? RnBinCardID { get; set; }

        public string Cemail { get; set; }

        public string InvoiceNum { get; set; }
    }
}
