using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.DTO;
using SLIIT.Core.BL;
using SLIIT.Core.Entity;

namespace SLIIT.Core.BL
{
    public class PR_RequestForQuotationBL : AbstractBL<TB_PR_RFQ, long>
    {

        public int Save(TB_PR_RFQ RFQ)
        {
            ITPManager.TB_PR_RFQs.InsertOnSubmit(RFQ);
            ITPManager.SubmitChanges();

            return RFQ.RnRFQ;
        }
        public List<PR_rfq> GetAll()
        {
            var all = (from d in ITPManager.TB_PR_RFQs
                       select new PR_rfq
                       {
                           RnRFQ = d.RnRFQ,
                           Company = d.Company,
                           Date = d.Date,
                           RnBOQ = d.RnBOQ,
                           RnRefv = d.RnRefv,
                           Remarks = d.Remarks,

                       }).ToList();

            return all;
        }

        public void Update(TB_PR_RFQ updetails)
        {
            var refid = ITPManager.TB_PR_RFQs.SingleOrDefault(d => d.RnRFQ == updetails.RnRFQ);

            if (refid != null)
            {
                refid.RnRFQ = updetails.RnRFQ;
                refid.Company = updetails.Company;
                refid.Date = updetails.Date;
                refid.RnBOQ = updetails.RnBOQ;
                refid.RnRefv = updetails.RnRefv;
                refid.Remarks = updetails.Remarks;

                SaveChanges();
            }
        }



        //public void Delete(TB_PR_RFQ ContactP)
        //{

        //    ITPManager.DeleteDatabase();

        //    //return RFQ.RnRFQ;
        //    var remove = (from d in ITPManager.TB_PR_RFQs
        //                  where d.RnRFQ == RFQ.RnRFQ
        //                  select d).FirstOrDefault();


        //    ITPManager.TB_PR_RFQs.DeleteOnSubmit(RFQ);
        //    //ITPManager.DeleteDatabase();



    }
}
