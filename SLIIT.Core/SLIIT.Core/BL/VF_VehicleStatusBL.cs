using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;

namespace SLIIT.Core.BL
{
    public class VF_VehicleStatusBL:AbstractBL<TB_VF_VehicleStatus, long>
    {
        public void Save(TB_VF_VehicleStatus status)
        {
            ITPManager.TB_VF_VehicleStatus.InsertOnSubmit(status);
            ITPManager.SubmitChanges();
        }

        public List<VF_VehicleStatus> GetAllStatuses()
        {
            var list = (from d in ITPManager.TB_VF_VehicleStatus
                        where d.IsDeleted == false
                        select new VF_VehicleStatus
                        {
                            StatusID = d.StatusID,
                            StatusText = d.StatusText
                        }).ToList();

            return list;
        }

        public VF_VehicleStatus GetStatusByID(int statusID)
        {
            var list = (from d in ITPManager.TB_VF_VehicleStatus
                        where d.StatusID == statusID
                        && d.IsDeleted == false
                        select new VF_VehicleStatus
                        {
                            StatusID = d.StatusID,
                            StatusText = d.StatusText
                        }).SingleOrDefault();

            return list;
        }
        
    }
}
