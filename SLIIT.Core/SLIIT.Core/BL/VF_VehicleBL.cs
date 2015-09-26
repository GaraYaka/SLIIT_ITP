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
        public int Save(TB_VF_Vehicle vehicle)
        {
            ITPManager.TB_VF_Vehicles.InsertOnSubmit(vehicle);
            ITPManager.SubmitChanges();

            return vehicle.RnVehicleID;
        }

        public void Update(TB_VF_Vehicle vehicle)
        {
            var obj = ITPManager.TB_VF_Vehicles.SingleOrDefault(d => d.RnVehicleID == vehicle.RnVehicleID);
            if (obj != null)
            {
                obj.RegNo = vehicle.RegNo;
                obj.Model = vehicle.Model;
                obj.YearOfManuf = vehicle.YearOfManuf;
                obj.YearOfPurchase = vehicle.YearOfPurchase;
                obj.DriverID = vehicle.DriverID;
                obj.EngineNo = vehicle.EngineNo;
                obj.ChassisNo = vehicle.ChassisNo;

                SaveChanges();
            }

        }

        public void Delete(int vehicleID)
        {
            var obj = ITPManager.TB_VF_Vehicles.SingleOrDefault(d => d.RnVehicleID == vehicleID);
            if (obj != null)
            {
                obj.IsDeleted = true;

                SaveChanges();
            }

        }


        public List<VF_Vehicle> GetAllVehicle()
        {
            var list = (from d in ITPManager.TB_VF_Vehicles
                        where d.IsDeleted == false
                        select new VF_Vehicle
                        {
                            RnVehicleID = d.RnVehicleID,
                            RegNo = d.RegNo,
                            Model = d.Model,
                            YearOfManuf = d.YearOfManuf,
                            YearOfPurchase = d.YearOfPurchase,
                            Driver = new HR_AttendUserBL().GetAttendUserByID(d.DriverID),
                            EngineNo = d.EngineNo,
                            ChassisNo = d.ChassisNo,
                            Status = new VF_VehicleStatusBL().GetStatusByID(d.Status),
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
                            Driver = new HR_AttendUserBL().GetAttendUserByID(d.DriverID),
                            EngineNo = d.EngineNo,
                            ChassisNo = d.ChassisNo,
                            Status = new VF_VehicleStatusBL().GetStatusByID(d.Status),
                            IsDeleted = d.IsDeleted
                        }).SingleOrDefault();

            return vehicle;
        }
        
        public List<VF_Vehicle> getVehicleID()
        {
            var vehicleID = (from d in ITPManager.TB_VF_Vehicles
                             select new VF_Vehicle
                             {
                                 RnVehicleID = d.RnVehicleID,

                             }).ToList();
            return vehicleID;
        }

        
    }
}
