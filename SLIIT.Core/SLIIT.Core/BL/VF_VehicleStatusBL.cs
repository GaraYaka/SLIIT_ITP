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
    }
}
