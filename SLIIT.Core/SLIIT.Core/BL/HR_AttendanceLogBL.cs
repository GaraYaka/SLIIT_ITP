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
    public class HR_AttendanceLogBL : AbstractBL<TB_HR_AttendanceLog, long>
    {
        public void Insert(TB_HR_AttendanceLog attend)
        {
            ITPManager.TB_HR_AttendanceLogs.InsertOnSubmit(attend);
            ITPManager.SubmitChanges();
        }

        public void Update(TB_HR_AttendanceLog log)
        {

            var obj = ITPManager.TB_HR_AttendanceLogs.SingleOrDefault(d => d.RnLogID == log.RnLogID);
            if (obj != null)
            {
                obj.UserID = log.UserID;
                obj.LogTime = log.LogTime;
                obj.Type = log.Type;

                SaveChanges();
            }
        }

        public void Delete(TB_HR_AttendanceLog log)
        {

            var obj = ITPManager.TB_HR_AttendanceLogs.SingleOrDefault(d => d.RnLogID == log.RnLogID);
            if (obj != null)
            {
                obj.IsDeleted = true;

                SaveChanges();
            }
        }

        public HR_AttendanceLog GetLastLogByAttendUser(int attendUserID)
        {
            var attendLog = (from d in ITPManager.TB_HR_AttendanceLogs
                             where d.UserID == attendUserID
                             && d.IsDeleted == false
                             orderby d.RnLogID descending
                             select new HR_AttendanceLog
                             {
                                 RnLogID = d.RnLogID,
                                 UserID = d.UserID,
                                 LogTime = d.LogTime,
                                 Type = d.Type
                             }).Take(1).SingleOrDefault();

            return attendLog;
        }

        public HR_AttendanceLog GetAttendenceDetailsByDate(DateTime date)
        {
            var attendLog = (from f in ITPManager.TB_HR_AttendanceLogs
                             where f.IsDeleted == false
                             orderby f.RnLogID descending
                             select new HR_AttendanceLog
                             {
                                 RnLogID = f.RnLogID,
                                 UserID = f.UserID,
                                 LogTime = f.LogTime,
                                 Type = f.Type
                             }).Take(1).SingleOrDefault();

            return attendLog;
        }


        public List<HR_AttendanceLog> GetAll()
        {
            var attendLog = (from f in ITPManager.TB_HR_AttendanceLogs
                             where f.IsDeleted == false
                             select new HR_AttendanceLog
                             {
                                 RnLogID = f.RnLogID,
                                 UserID = f.UserID,
                                 LogTime = f.LogTime,
                                 Type = f.Type,
                                 UserName = f.TB_HR_AttendUser.FirstName + " " + f.TB_HR_AttendUser.LastName
                             }).ToList();

            return attendLog;
        }
    }
}
