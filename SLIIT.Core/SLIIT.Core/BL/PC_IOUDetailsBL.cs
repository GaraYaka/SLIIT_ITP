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
    public class PC_IOUDetailsBL: AbstractBL<TB_PC_IOUDetail, long>
    {
        public void Insert(TB_PC_IOUHeader detail)
        {
            ITPManager.TB_PC_IOUHeaders.InsertOnSubmit(detail);
            ITPManager.SubmitChanges();
        }

        public List<PC_IOUDetails> GetIOUDetialByHeaderID(int headerID)
        {
            var details = (from d in ITPManager.TB_PC_IOUDetails
                           where d.IOUHeaderID == headerID
                           && d.IsDeleted == false
                           select new PC_IOUDetails
                           {
                               RnIOUDetailID = d.RnIOUDetailID,
                               Description = d.Description,
                               Amount = (decimal)d.Amount,
                               IOUHeaderID = (int)d.IOUHeaderID,
                           }).ToList();

            return details;
        }

        public void Edit(PC_IOUDetails iouDetail)
        {
            var detail = (from d in ITPManager.TB_PC_IOUDetails
                          where d.RnIOUDetailID == iouDetail.RnIOUDetailID
                          select d).SingleOrDefault();

            if (iouDetail.Amount != 0)
            {
                if (detail != null)
                {
                    detail.Amount = iouDetail.Amount;
                    detail.Description = iouDetail.Description;
                    detail.LastUpdatedBy = iouDetail.LastUpdatedBy;
                    detail.LastUpdatedDate = iouDetail.LastUpdatedDate;

                    ITPManager.SubmitChanges();
                }
            }
            else
            {
                throw new Exception("Item amount cannot be zero!");
            }

        }

        public void Delete(TB_PC_IOUDetail iouDetail)
        {
            var detail = (from d in ITPManager.TB_PC_IOUDetails
                          where d.RnIOUDetailID == iouDetail.RnIOUDetailID
                          select d).SingleOrDefault();

            if (detail != null)
            {
                detail.IsDeleted = true;
                detail.LastUpdatedBy = iouDetail.LastUpdatedBy;
                detail.LastUpdatedDate = iouDetail.LastUpdatedDate;
                ITPManager.SubmitChanges();
            }
        }
    }
}
