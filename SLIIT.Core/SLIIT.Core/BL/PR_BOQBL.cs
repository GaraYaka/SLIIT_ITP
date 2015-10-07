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
    public class PR_BOQBL : AbstractBL<TB_PR_BOQ, long>
    {
        public int Save(TB_PR_BOQ BOQ)
        {
            ITPManager.TB_PR_BOQs.InsertOnSubmit(BOQ);
            ITPManager.SubmitChanges();

            return BOQ.RnBOQ;
        }
        public List<PR_boq> GetAll()
        {
            var all = (from d in ITPManager.TB_PR_BOQs
                       select new PR_boq
                       {
                           RnBOQ = d.RnBOQ,
                           Company = d.Company,
                           Contact = d.Contact,
                           AdrL1 = d.AdrL1,
                           AdrL2 = d.AdrL2,
                           Street = d.Street,
                           City = d.City,
                           TPNO = d.TPNO,
                           Type = d.Type,
                           Date = d.Date,
                           Status = d.Status,
                           Remarks = d.Remarks,

                       }).ToList();

            return all;
        }

        public void Update(TB_PR_BOQ updetails)
        {
            var refid = ITPManager.TB_PR_BOQs.SingleOrDefault(d => d.RnBOQ == updetails.RnBOQ);

            if (refid != null)
            {
                refid.RnBOQ = updetails.RnBOQ;
                refid.Company = updetails.Company;
                refid.Contact = updetails.Contact;
                refid.AdrL1 = updetails.AdrL1;
                refid.AdrL2 = updetails.AdrL2;
                refid.Street = updetails.Street;
                refid.City = updetails.City;
                refid.TPNO = updetails.TPNO;
                refid.Type = updetails.Type;
                refid.Date = updetails.Date;
                refid.Status = updetails.Status;
                refid.Remarks = updetails.Remarks;

                SaveChanges();
            }
        }



        //public void Delete(TB_PR_BOQ BOQ)
        //{

        //    ITPManager.DeleteDatabase();

        //    //return ContactP.RnBOQ;
        //    var remove = (from d in ITPManager.TB_PR_BOQs
        //                  where d.RnBOQ == ContactP.RnBOQ
        //                  select d).FirstOrDefault();


        //    ITPManager.TB_PR_BOQs.DeleteOnSubmit(BOQ);
        //    //ITPManager.DeleteDatabase();



        }
    }

