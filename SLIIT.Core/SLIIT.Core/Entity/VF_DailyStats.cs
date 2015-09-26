using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class VF_DailyStats
    {
        public int RnVehicleDaily { get; set; }

        public int RnVehicleID { get; set; }

        public string FromLocation { get; set; }

        public string ToLocation { get; set; }

        public float DistanceToday { get; set; }

        public string MaintenanceNotes { get; set; }

        
        
    }
}
