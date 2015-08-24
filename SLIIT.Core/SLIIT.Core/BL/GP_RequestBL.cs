using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;


namespace SLIIT.Core.BL
{
    public class GP_RequestBL : AbstractBL<TB_GP_Request, long>
    {
        public void Insert(TB_GP_Request attend)
        {
            ITPManager.TB_GP_Requests.InsertOnSubmit(attend);
            ITPManager.SubmitChanges();
        }

        public List<GP_Request> GetAllGPRequest()
        {
            var list = (from d in ITPManager.TB_GP_Requests
                        select new GP_Request

                            {
                                RnRequestID = d.RnRequestID,
                                CompanyName = d.CompanyName,
                                Address = d.Address,
                                Tel = d.Tel,
                                EmailAddress = d.EmailAddress,
                                ReasonForRequest = d.ReasonForRequest,
                                ApprovedBy = d.ApprovedBy,
                                ItemsToBeDeclared = d.ItemsToBeDeclared,
                                VisitingArea = d.VisitingArea,
                                DateOfVisit = d.DateOfVisit,
                                FromTime = d.FromTime,
                                ToTime = d.ToTime,
                                Status = d.Status
                            }

                ).ToList();

            return list;
        }

        public GP_Request GetAllGPRequest()
        {
            var list = (from d in ITPManager.TB_GP_Requests
                        select new GP_Request

                        {
                            RnRequestID = d.RnRequestID,
                            CompanyName = d.CompanyName,
                            Address = d.Address,
                            Tel = d.Tel,
                            EmailAddress = d.EmailAddress,
                            ReasonForRequest = d.ReasonForRequest,
                            ApprovedBy = d.ApprovedBy,
                            ItemsToBeDeclared = d.ItemsToBeDeclared,
                            VisitingArea = d.VisitingArea,
                            DateOfVisit = d.DateOfVisit,
                            FromTime = d.FromTime,
                            ToTime = d.ToTime,
                            Status = d.Status
                        }

                ).SingleOrDefault();

            return list;
        }

    }
}



//public List<VF_Vehicle> GetAllVehicle()
//      {
//          var list = (from d in ITPManager.TB_VF_Vehicles
//                      select new VF_Vehicle
//                      {
//                          RnVehicleID = d.RnVehicleID,
//                          RegNo = d.RegNo,
//                          Model = d.Model,
//                          YearOfManuf = d.YearOfManuf,
//                          YearOfPurchase = d.YearOfPurchase,
//                          DriverID = d.DriverID,
//                          EngineNo = d.EngineNo,
//                          ChassieNo = d.ChassieNo,
//                          Status = d.Status,
//                          IsDeleted = d.IsDeleted
//                      }).ToList();

//          return list;
//      }





//{
//    public class HR_AttendanceLogBL : AbstractBL<TB_HR_AttendanceLog, long>
//    {
//        public void Insert(TB_HR_AttendanceLog attend)
//        {
//            ITPManager.TB_HR_AttendanceLogs.InsertOnSubmit(attend);
//            ITPManager.SubmitChanges();
//        }

//        public HR_AttendanceLog GetLastLogByAttendUser(int attendUserID)
//        {
//            var attendLog = (from d in ITPManager.TB_HR_AttendanceLogs
//                             where d.UserID == attendUserID
//                             && d.IsDeleted == false
//                             orderby d.RnLogID descending
//                             select new HR_AttendanceLog
//                             {
//                                 RnLogID = d.RnLogID,
//                                 UserID = d.UserID,
//                                 LogTime = d.LogTime,
//                                 Type = d.Type
//                             }).Take(1).SingleOrDefault();

//            return attendLog;
//        }
//    }
//}


