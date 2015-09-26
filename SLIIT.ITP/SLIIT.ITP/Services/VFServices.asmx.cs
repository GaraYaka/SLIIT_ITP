using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;


namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for VFServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class VFServices : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<VF_Vehicle> GetAllVehicles()
        {
            return new VF_VehicleBL().GetAllVehicle();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Update(VF_Vehicle vehicle)
        {

            TB_VF_Vehicle updatedVehicle = new TB_VF_Vehicle();

            updatedVehicle.RnVehicleID = vehicle.RnVehicleID;
            updatedVehicle.ChassisNo = vehicle.ChassisNo;
            updatedVehicle.DriverID = vehicle.Driver.RnAttendUserID;
            updatedVehicle.EngineNo = vehicle.EngineNo;
            updatedVehicle.Model = vehicle.Model;
            updatedVehicle.RegNo = vehicle.RegNo;
            updatedVehicle.YearOfManuf = vehicle.YearOfManuf;
            updatedVehicle.YearOfPurchase = vehicle.YearOfPurchase;

            new VF_VehicleBL().Update(updatedVehicle);
        }


                [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public bool VF_ValidateDuplicate(int vehicle)
        {
            bool status = true;


            return status;
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public int Insert(VF_Vehicle vehicle)
        {

            TB_VF_Vehicle updatedVehicle = new TB_VF_Vehicle();

            updatedVehicle.ChassisNo = vehicle.ChassisNo;
            updatedVehicle.DriverID = vehicle.Driver.RnAttendUserID;
            updatedVehicle.EngineNo = vehicle.EngineNo;
            updatedVehicle.Model = vehicle.Model;
            updatedVehicle.RegNo = vehicle.RegNo;
            updatedVehicle.YearOfManuf = vehicle.YearOfManuf;
            updatedVehicle.YearOfPurchase = vehicle.YearOfPurchase;
            updatedVehicle.Status = vehicle.Status.StatusID;

            return new VF_VehicleBL().Save(updatedVehicle);

            
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Delete(VF_Vehicle vehicle)
        {
            new VF_VehicleBL().Delete(vehicle.RnVehicleID);
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<VF_VehicleStatus> GetAllStatuses()
        {
            return new VF_VehicleStatusBL().GetAllStatuses();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        
        public List<VF_Vehicle> getVehicleID()
        {
            return new VF_VehicleBL().getVehicleID();
        }        

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]

        public void AddStats(int VehicleID, string FromLocation, string ToLocation, float DistanceToday, string MaintenanceNotes)
        {
            TB_VF_DailyStat addStat = new TB_VF_DailyStat();

            addStat.RnVehicleID = VehicleID;
            addStat.FromLocation = FromLocation;
            addStat.ToLocation = ToLocation;
            addStat.DistanceToday = DistanceToday;
            addStat.MaintenanceNotes = MaintenanceNotes;

            new VF_DailyStatsBL().Save(addStat);

        }

    }
}
