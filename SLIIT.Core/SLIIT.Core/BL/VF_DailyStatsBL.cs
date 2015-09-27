using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;

namespace SLIIT.Core.BL
{
    public class VF_DailyStatsBL : AbstractBL<TB_VF_DailyStat, long>
    {
        public int Save(TB_VF_DailyStat vehicle)
        {
            ITPManager.TB_VF_DailyStats.InsertOnSubmit(vehicle);
            ITPManager.SubmitChanges();

            return vehicle.RnVehicleDaily;
        }

        public List<VF_DailyStats> GetAll()
        {
            var all = (from d in ITPManager.TB_VF_DailyStats
                       select new VF_DailyStats
                       {
                           VehicleID = d.VehicleID,
                           FromLocation = d.FromLocation,
                           ToLocation = d.ToLocation,
                           DistanceToday = d.DistanceToday,
                           MaintenanceNotes = d.MaintenanceNotes,
                           RegNo = d.TB_VF_Vehicle.RegNo


                       }).ToList();

            return all;
        }
    }

}
