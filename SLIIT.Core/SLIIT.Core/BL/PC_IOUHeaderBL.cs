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
    public class PC_IOUHeaderBL: AbstractBL<TB_PC_IOUHeader, long>
    {
        public int Insert(TB_PC_IOUHeader header)
        {
            ITPManager.TB_PC_IOUHeaders.InsertOnSubmit(header);
            ITPManager.SubmitChanges();

            return header.RnIOUID;
        }

        public PC_IOUHeader GetIOUByHeaderID(int headerID)
        {
            var header = (from d in ITPManager.TB_PC_IOUHeaders
                          where d.RnIOUID == headerID
                          select new PC_IOUHeader
                          {
                              RnIOUID = d.RnIOUID,
                              IOUDate = d.IOUDate,//date in string format
                              ApprovedBy = d.ApprovedBy,
                              DisplayNameApprovedBy = GetDisplayName(d.ApprovedBy),
                              ApprovedDate = d.ApprovedDate,
                              RejectedBy = d.RejectedBy,
                              DisplayRejectedBy = GetDisplayName(d.RejectedBy),
                              RejectedDate = d.RejectedDate,
                              RejectReason = d.RejectReason,
                              PaidDate = d.PaidDate,
                              Status = d.Status,
                              IsDeleted = d.IsDeleted,
                              InsertedBy = d.InsertedBy,
                              DisplayInsertedBy = GetDisplayName(d.InsertedBy),
                              InsertedDate = d.InsertedDate,
                              PCOfficer = d.PCOfficer,
                              DisplayPCOfficer = GetDisplayName(d.PCOfficer),
                              LastUpdatedBy = d.LastUpdatedBy,
                              LastUpdatedDate = d.LastUpdatedDate                              
                          }).SingleOrDefault();

            return header;
        }

        public List<PC_IOUHeader> GetAllIOUs()
        {
            var header = (from d in ITPManager.TB_PC_IOUHeaders
                          select new PC_IOUHeader
                          {
                              RnIOUID = d.RnIOUID,
                              IOUDate = d.IOUDate,//date in string format
                              ApprovedBy = d.ApprovedBy,
                              DisplayNameApprovedBy = GetDisplayName(d.ApprovedBy),
                              ApprovedDate = d.ApprovedDate,
                              RejectedBy = d.RejectedBy,
                              DisplayRejectedBy = GetDisplayName(d.RejectedBy),
                              RejectedDate = d.RejectedDate,
                              RejectReason = d.RejectReason,
                              PaidDate = d.PaidDate,
                              Status = d.Status,
                              IsDeleted = d.IsDeleted,
                              InsertedBy = d.InsertedBy,
                              DisplayInsertedBy = GetDisplayName(d.InsertedBy),
                              InsertedDate = d.InsertedDate,
                              PCOfficer = d.PCOfficer,
                              DisplayPCOfficer = GetDisplayName(d.PCOfficer),
                              LastUpdatedBy = d.LastUpdatedBy,
                              LastUpdatedDate = d.LastUpdatedDate
                          }).ToList();

            return header;
        }


        public void Edit(PC_IOUHeader iouHeader)
        {
            var obj = ITPManager.TB_PC_IOUHeaders.SingleOrDefault(d => d.RnIOUID == iouHeader.RnIOUID);
            if (obj != null)
            {
                obj.IOUDate = iouHeader.InsertedDate;
                obj.Status = iouHeader.Status;
                obj.LastUpdatedBy = iouHeader.LastUpdatedBy;
                obj.LastUpdatedDate = iouHeader.LastUpdatedDate;
                obj.ApprovedBy = iouHeader.ApprovedBy;
                obj.PCOfficer = iouHeader.PCOfficer;

                SaveChanges();
            }

        }

        private string GetDisplayName(int? userID)
        {
            if (userID != null)
            {
                return new UserBL().GetUserNameByID((int)userID);
            }

            return string.Empty;

        }


        
    }
}
