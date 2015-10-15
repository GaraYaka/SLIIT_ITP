using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class IC_MasterData
    {
        public int RnItemID { get; set; }

        public string ItemCode { get; set; }

        public int? ItemCategory { get; set; }

        public string ItemName { get; set; }

        public int? ReOrderQty { get; set; }

        public int? Quantity { get; set; }
    }
}
