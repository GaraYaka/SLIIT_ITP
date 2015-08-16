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
    public class HR_AttendUserBL : AbstractBL<TB_HR_AttendUser, long>
    {
        public HR_AttendUser GetAttendUserByCardNo(int cardNo)
        {
            var attendUserDetail = (from d in ITPManager.TB_HR_AttendUsers
                                    where d.CardNo == cardNo
                                    && d.IsDeleted == false
                                    select new HR_AttendUser
                                    {
                                        RnAttendUserID = d.RnAttendUserID,
                                        FirstName = d.FirstName,
                                        LastName = d.LastName,
                                        Dept = d.Dept,
                                        CardNo = d.CardNo,
                                    }).SingleOrDefault();

            return attendUserDetail;
        }
    }
}
