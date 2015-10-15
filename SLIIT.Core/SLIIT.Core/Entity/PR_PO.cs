using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
   public class PR_PO
    {
        public int RnPO { get; set; }

        public int? RnBOQ { get; set; }

        public double? Amount { get; set; }
        public DateTime? Date { get; set; }
        public string Status { get; set; }


    }
}
