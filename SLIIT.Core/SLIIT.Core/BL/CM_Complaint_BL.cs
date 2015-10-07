using SLIIT.Core.DTO;
using SLIIT.Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLIIT.Core.BL
{
    public class CM_Complaint_BL : AbstractBL<TB_Complaint, long>
    {
        public void InsertComplaint(TB_Complaint submit)
        {
            ITPManager.TB_Complaints.InsertOnSubmit(submit);
            ITPManager.SubmitChanges();
        }

        public List<CM_Complaint> GetComplaintById(int CmId)
        {
            var cmLog = (from f in ITPManager.TB_Complaints
                         where f.CM_ID == CmId
                         select new CM_Complaint
                         {
                             CM_ID = f.CM_ID,
                             CM_CUSTOMER_NAME = f.CM_CUSTOMER_NAME,
                             CM_EMAIL = f.CM_EMAIL,
                             CM_HOME_ADDRESS = f.CM_HOME_ADDRESS,
                             CM_DESCRIPTION = f.CM_DESCRIPTION,
                             CM_PRIORITY = Convert.ToInt32(f.CM_PRIORITY),
                             CM_TYPE = f.CM_TYPE
                         }).ToList();

            return cmLog;
        }


        public List<CM_Complaint> GetAllComplaints(int uid)
        {

            if (uid == 1)
            {
                var allCMList = (from f in ITPManager.TB_Complaints
                                 where f.CM_ISDELETE == 0 
                                 select new CM_Complaint
                                 {
                                     CM_ID = f.CM_ID,
                                     CM_CUSTOMER_NAME = f.CM_CUSTOMER_NAME,
                                     CM_EMAIL = f.CM_EMAIL,
                                     CM_HOME_ADDRESS = f.CM_HOME_ADDRESS,
                                     CM_DESCRIPTION = f.CM_DESCRIPTION,
                                     CM_TYPE = f.CM_TYPE
                                 }).ToList();
                return allCMList;
            }
            else {
                var allCMList = (from f in ITPManager.TB_Complaints
                                 where f.CM_ISDELETE == 0 && f.CM_UID == uid
                                 select new CM_Complaint
                                 {
                                     CM_ID = f.CM_ID,
                                     CM_CUSTOMER_NAME = f.CM_CUSTOMER_NAME,
                                     CM_EMAIL = f.CM_EMAIL,
                                     CM_HOME_ADDRESS = f.CM_HOME_ADDRESS,
                                     CM_DESCRIPTION = f.CM_DESCRIPTION,
                                     CM_TYPE = f.CM_TYPE
                                 }).ToList();
                return allCMList;
            }
            

            
        }

        public void Update(TB_Complaint log)
        {
            var obj = ITPManager.TB_Complaints.SingleOrDefault(d => d.CM_ID == log.CM_ID);
            if (obj != null)
            {
                obj.CM_EMAIL = log.CM_EMAIL;
                obj.CM_CUSTOMER_NAME = log.CM_CUSTOMER_NAME;
                obj.CM_DESCRIPTION = log.CM_DESCRIPTION;
                obj.CM_TYPE = log.CM_TYPE;

                SaveChanges();
            }
        }

        public void Delete(TB_Complaint log)
        {

            var obj = ITPManager.TB_Complaints.SingleOrDefault(d => d.CM_ID == log.CM_ID);
            if (obj != null)
            {
                obj.CM_ISDELETE = 1;

                SaveChanges();
            }
        }
    }
}
