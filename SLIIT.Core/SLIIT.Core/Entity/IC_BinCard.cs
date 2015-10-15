using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class IC_BinCard
    {
        public int RnBinCardID { get; set; }

        public string ItemCode { get; set; }

        public decimal? UnitPrice { get; set; }

        public string Unit { get; set; }

        public int? Quantity { get; set; }

        public int? RnCatID { get; set; }
    }
}
