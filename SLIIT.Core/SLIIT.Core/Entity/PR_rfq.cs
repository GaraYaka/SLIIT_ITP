using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class PR_rfq
    {
        public int RnRFQ { get; set; }

        public string Company { get; set; }
        public DateTime? Date { get; set; }
        public int? RnBOQ { get; set; }
        public int? RnRefv { get; set; }

        public string Remarks { get; set; }

    }
}
