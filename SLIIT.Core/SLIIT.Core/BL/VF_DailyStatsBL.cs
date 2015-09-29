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

        public void Update(TB_VF_DailyStat updateStats)
        {
            var VehicleID = (from d in ITPManager.TB_VF_DailyStats
                             where d.RnVehicleDaily == updateStats.RnVehicleDaily
                             select d).SingleOrDefault();

            if (VehicleID != null)
            {
                VehicleID.ToLocation = updateStats.ToLocation;
                VehicleID.FromLocation = updateStats.FromLocation;
                VehicleID.DistanceToday = updateStats.DistanceToday;
                VehicleID.MaintenanceNotes = updateStats.MaintenanceNotes;

            }


            ITPManager.SubmitChanges();
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
                           RegNo = d.TB_VF_Vehicle.RegNo,
                           InsertedDate = d.InsertedDate,
                           DisplayInsertedDate = string.Format("{0:dd/MM/yyyy}", d.InsertedDate),
                           RnVehicleDaily = d.RnVehicleDaily

                       }).ToList();

            return all;
        }


        public VF_DailyStats GetByID(int rnID)
        {
            var all = (from d in ITPManager.TB_VF_DailyStats
                       where d.RnVehicleDaily == rnID
                       select new VF_DailyStats
                       {
                           VehicleID = d.VehicleID,
                           FromLocation = d.FromLocation,
                           ToLocation = d.ToLocation,
                           DistanceToday = d.DistanceToday,
                           MaintenanceNotes = d.MaintenanceNotes,
                           RegNo = d.TB_VF_Vehicle.RegNo,
                           InsertedDate = d.InsertedDate,
                           DisplayInsertedDate = string.Format("{0:dd/MM/yyyy}", d.InsertedDate),
                           RnVehicleDaily = d.RnVehicleDaily

                       }).SingleOrDefault();

            return all;
        }


        public List<VF_DailyStats> GetAllBySearchString(string searchString)
        {
            var all = (from d in ITPManager.TB_VF_DailyStats
                       where d.ToLocation.Contains(searchString) || d.FromLocation.Contains(searchString) || d.TB_VF_Vehicle.RegNo.Contains(searchString)
                       select new VF_DailyStats
                       {
                           VehicleID = d.VehicleID,
                           FromLocation = d.FromLocation,
                           ToLocation = d.ToLocation,
                           DistanceToday = d.DistanceToday,
                           MaintenanceNotes = d.MaintenanceNotes,
                           RegNo = d.TB_VF_Vehicle.RegNo,
                           InsertedDate = d.InsertedDate,
                           DisplayInsertedDate = string.Format("{0:dd/MM/yyyy}", d.InsertedDate)
                       }).ToList();

            return all;
        }





    }

}
