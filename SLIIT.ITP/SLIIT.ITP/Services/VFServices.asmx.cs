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

        //[WebMethod(EnableSession = true)]
        //[ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        //public List<VF_Vehicle> getVehicleID()
        //{
        //    return new VF_VehicleBL().GetAllVehicle();
        ////}        

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void AddStats(string VehicleID, string FromLocation, string ToLocation, string DistanceToday, string MaintenanceNotes)
        {

            if (VehicleID == string.Empty || VehicleID == "")
            {
                throw new Exception(SLIITCommonResource.ERROR_VF_ID_MUST_BE_INT.ToString());
            }

            if (DistanceToday == string.Empty || DistanceToday == "")
            {
                throw new Exception(SLIITCommonResource.ERROR_VF_PARSE_ERROR.ToString());
            }

            if ( (float.Parse(DistanceToday) < 0.0))
            {
                 throw new Exception(SLIITCommonResource.ERROR_VF_PARSE_ERROR.ToString());
            }

            TB_VF_DailyStat addStat = new TB_VF_DailyStat();

            addStat.VehicleID = int.Parse(VehicleID);
            addStat.FromLocation = FromLocation;
            addStat.ToLocation = ToLocation;
            addStat.DistanceToday = float.Parse(DistanceToday);
            addStat.MaintenanceNotes = MaintenanceNotes;
            addStat.InsertedDate = DateTime.Now;
            
            new VF_DailyStatsBL().Save(addStat);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void UpdateStats(string FromLocation, string ToLocation, string DistanceToday, string MaintenanceNotes, int rnId)
        {

            if ((float.Parse(DistanceToday) < 0.0))
            {
                throw new Exception(SLIITCommonResource.ERROR_VF_PARSE_ERROR.ToString());
            }

            TB_VF_DailyStat addStat = new TB_VF_DailyStat();

            
            addStat.FromLocation = FromLocation;
            addStat.ToLocation = ToLocation;
            addStat.DistanceToday = float.Parse(DistanceToday);
            addStat.MaintenanceNotes = MaintenanceNotes;
            addStat.InsertedDate = DateTime.Now;
            addStat.RnVehicleDaily = rnId;

            new VF_DailyStatsBL().Update(addStat);

        }

        

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public VF_DailyStats GetByID(int id)
        {

            return new VF_DailyStatsBL().GetByID(id);
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<VF_DailyStats> GetDailyVehicleStats()
        {
            return new VF_DailyStatsBL().GetAll();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<VF_DailyStats> SearchDailyVehicleStats(string searchString)
        {
            return new VF_DailyStatsBL().GetAllBySearchString(searchString);
        }

    }
}
