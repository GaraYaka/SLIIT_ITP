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
    public class PR_PurchaseBL : AbstractBL<TB_PR_PO, long>
    {
        public int Save(TB_PR_PO PO)
        {
            ITPManager.TB_PR_POs.InsertOnSubmit(PO);
            ITPManager.SubmitChanges();

            return PO.RnPO;
        }
        public List<PR_PO> GetAll()
        {
            var all = (from d in ITPManager.TB_PR_POs
                       select new PR_PO
                       {
                           RnPO = d.RnPO,
                           RnBOQ = d.RnBOQ,
                           Amount = d.Amount,
                           Date = d.Date,
                           Status = d.Status,


                       }).ToList();

            return all;
        }

        public void Update(TB_PR_PO updetails)
        {
            var refid = ITPManager.TB_PR_POs.SingleOrDefault(d => d.RnPO == updetails.RnPO);

            if (refid != null)
            {
                refid.RnPO = updetails.RnPO;
                refid.RnBOQ = updetails.RnBOQ;
                refid.Amount = updetails.Amount;
                refid.Date = updetails.Date;
                refid.Status = updetails.Status;

                SaveChanges();
            }
        }

        //public void Delete(TB_PR_CP updetails)
        //{
        //    var refid = ITPManager.TB_PR_CPs.SingleOrDefault(d => d.RnRefv == updetails.RnRefv);

        //    if (refid != null)
        //    {
        //        refid.RnRefv = updetails.RnRefv;
        //        refid.Name = updetails.Name;
        //        refid.TPNO = updetails.TPNO;
        //        refid.AdrL1 = updetails.AdrL1;
        //        refid.AdrL2 = updetails.AdrL2;
        //        refid.Street = updetails.Street;
        //        refid.City = updetails.City;

        //        Delete();
        //    }
        //}

        public void Delete(TB_PR_PO log)
        {

            ITPManager.DeleteDatabase();

            //return ContactP.RnRefv;
            var remove = (from d in ITPManager.TB_PR_POs
                          where d.RnPO == log.RnPO
                          select d).FirstOrDefault();


            ITPManager.TB_PR_POs.DeleteOnSubmit(log);
            //ITPManager.DeleteDatabase();



        }
    }
}
