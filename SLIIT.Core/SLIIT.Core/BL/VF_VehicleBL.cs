using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;

namespace SLIIT.Core.BL
{
    public class VF_VehicleBL : AbstractBL<TB_VF_Vehicle, long>
    {
        public void Save(TB_VF_Vehicle vehicle)
        {
            ITPManager.TB_VF_Vehicles.InsertOnSubmit(vehicle);
            ITPManager.SubmitChanges();
        }

        public List<VF_Vehicle> GetAllVehicle()
        {
            var list = (from d in ITPManager.TB_VF_Vehicles
                        select new VF_Vehicle
                        {
                            RnVehicleID = d.RnVehicleID,
                            RegNo = d.RegNo,
                            Model = d.Model,
                            YearOfManuf = d.YearOfManuf,
                            YearOfPurchase = d.YearOfPurchase,
                            DriverID = d.DriverID,
                            EngineNo = d.EngineNo,
                            ChassieNo = d.ChassieNo,
                            Status = d.Status,
                            IsDeleted = d.IsDeleted
                        }).ToList();

            return list;
        }

        public VF_Vehicle GetVehicleByID(int vehicleID)
        {
            var vehicle = (from d in ITPManager.TB_VF_Vehicles
                        where d.RnVehicleID == vehicleID
                        select new VF_Vehicle
                        {
                            RnVehicleID = d.RnVehicleID,
                            RegNo = d.RegNo,
                            Model = d.Model,
                            YearOfManuf = d.YearOfManuf,
                            YearOfPurchase = d.YearOfPurchase,
                            DriverID = d.DriverID,
                            EngineNo = d.EngineNo,
                            ChassieNo = d.ChassieNo,
                            Status = d.Status,
                            IsDeleted = d.IsDeleted
                        }).SingleOrDefault();

            return vehicle;
        }
    }
}
