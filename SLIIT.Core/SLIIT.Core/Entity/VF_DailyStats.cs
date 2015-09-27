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

        public int VehicleID { get; set; }
        public string RegNo { get; set; }

        public string FromLocation { get; set; }

        public string ToLocation { get; set; }

        public double DistanceToday { get; set; }

        public string MaintenanceNotes { get; set; }

        public DateTime InsertedDate { get; set; }

        public string DisplayInsertedDate { get; set; }
        
    }
}
