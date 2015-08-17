﻿using System;
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
    }
}