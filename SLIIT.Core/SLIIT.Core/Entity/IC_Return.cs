using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class IC_Return
    {
        public int RnReturnID { get; set; }

        public string ItemCode { get; set; }

        public string ItemCategory { get; set; }

        public string ItemName { get; set; }

        public decimal UnitPrice { get; set; }

        public int? StockQty { get; set; }

        public int? IssueQty { get; set; }

        public decimal IssuePrice { get; set; }

        public int? ReturnQty { get; set; }

        public string IssueCode { get; set; }
    }
}
