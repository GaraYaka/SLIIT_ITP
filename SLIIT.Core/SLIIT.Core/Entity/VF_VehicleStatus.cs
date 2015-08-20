using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class VF_VehicleStatus
    {
        public int StatusID { get; set; }
        public string StatusText { get; set; }
        public bool IsDeleted { get; set; }
    }
}
