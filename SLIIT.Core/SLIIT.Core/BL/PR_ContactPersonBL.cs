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
    public class PR_ContactPersonBL : AbstractBL<TB_PR_CP, long>
    {
        public int Save(TB_PR_CP ContactP)
        {
            ITPManager.TB_PR_CPs.InsertOnSubmit(ContactP);
            ITPManager.SubmitChanges();

            return ContactP.RnRefv;
        }
        public List<PR_CP> GetAll()
        {
            var all = (from d in ITPManager.TB_PR_CPs
                       select new PR_CP
                       {
                            RnRefv = d.RnRefv,
                            Name = d.Name,
                            TPNO = d.TPNO,
                            AdrL1 = d.AdrL1,
                            AdrL2 = d.AdrL2,
                            Street = d.Street,
                            City = d.City


                       }).ToList();

            return all;
        }

        public void Update(TB_PR_CP updetails)
        {
            var refid = ITPManager.TB_PR_CPs.SingleOrDefault(d => d.RnRefv == updetails.RnRefv);

            if(refid != null)
            {
                refid.RnRefv = updetails.RnRefv;
                refid.Name = updetails.Name;
                refid.TPNO = updetails.TPNO;
                refid.AdrL1 = updetails.AdrL1;
                refid.AdrL2 = updetails.AdrL2;
                refid.Street = updetails.Street;
                refid.City = updetails.City;

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

        //public void Delete(TB_PR_CP log)
        //{
            
        //    ITPManager.DeleteDatabase();

        //    //return ContactP.RnRefv;
        //    var remove = (from d in ITPManager.TB_PR_CPs
        //                  where d.RnRefv == log.RnRefv
        //                  select d).FirstOrDefault();


        //    ITPManager.TB_PR_CPs.DeleteOnSubmit(log);
                //ITPManager.DeleteDatabase();
            

           
        }
    }

