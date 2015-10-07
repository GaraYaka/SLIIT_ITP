using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;


namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for PRServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PRServices : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void SavePerson(string Name, string TPNO, string AdrL1,string AdrL2,string Street,string City)
        {


            TB_PR_CP addCp = new TB_PR_CP();

            addCp.Name = Name;
            addCp.TPNO = TPNO;
            addCp.AdrL1 = AdrL1;
            addCp.AdrL2 = AdrL2;
            addCp.Street = Street;
            addCp.City = City;



            new PR_ContactPersonBL().Save(addCp);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<PR_CP> GetRnRef()
        {
            return new PR_ContactPersonBL().GetAll();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void UpdateBinItem(int RnRefv,string Name, string TPNO, string AdrL1, string AdrL2, string Street, string City)
        {


            TB_PR_CP addCp = new TB_PR_CP();

            addCp.RnRefv = RnRefv;
            addCp.Name = Name;
            addCp.TPNO = TPNO;
            addCp.AdrL1 = AdrL1;
            addCp.AdrL2 = AdrL2;
            addCp.Street = Street;
            addCp.City = City;



            new PR_ContactPersonBL().Update(addCp);

        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void DeleteRow(int RnRefv)
        {


            TB_PR_CP addCp = new TB_PR_CP();

            addCp.RnRefv = RnRefv;
           
            //new PR_ContactPersonBL().Delete(addCp);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Delete(PR_CP log)
        {
            TB_PR_CP deleted = new TB_PR_CP();


            deleted.RnRefv = log.RnRefv;
            deleted.Name = log.Name;
            deleted.TPNO = log.TPNO;
            deleted.AdrL1 = log.AdrL1;
            deleted.AdrL2 = log.AdrL2;
            deleted.Street = log.Street;
            deleted.City = log.City;

           // new PR_ContactPersonBL().Delete(deleted);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void SaveBOQ(string Company, string Contact, string AdrL1, string AdrL2, string Street, string City, int TPNO, string Type, DateTime Date, string Status, string Remarks)
        {


            TB_PR_BOQ addBoq = new TB_PR_BOQ();

            addBoq.Company = Company;
            addBoq.Contact = Contact;
            addBoq.AdrL1 = AdrL1;
            addBoq.AdrL2 = AdrL2;
            addBoq.Street = Street;
            addBoq.City = City;
            addBoq.TPNO = TPNO;
            addBoq.Type = Type;
            addBoq.Date = Date;
            addBoq.Status = Status;
            addBoq.Remarks = Remarks;



            new PR_BOQBL().Save(addBoq);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<PR_boq> GetRnBOQ()
        {
            return new PR_BOQBL().GetAll();
        }

         
        


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void SavePO(int RnPO, int RnBOQ, float Amount, DateTime Date, string Status)
        {


            TB_PR_PO addPO = new TB_PR_PO();

            addPO.RnBOQ = RnBOQ;
            addPO.Amount = Amount;
            addPO.Date = Date;
            addPO.Status = Status;




            new PR_PurchaseBL().Save(addPO);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<PR_PO> GetRnPO()
        {
            return new PR_PurchaseBL().GetAll();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void UpdatePO(int RnPO, int RnBOQ, float Amount, DateTime Date, string Status)
        {


            TB_PR_PO addPO = new TB_PR_PO();

            addPO.RnPO = RnPO;
            addPO.RnBOQ = RnBOQ;
            addPO.Amount = Amount;
            addPO.Date = Date;
            addPO.Status = Status;




            new PR_PurchaseBL().Update(addPO);

        }


        //[WebMethod(EnableSession = true)]
        //[ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        //public void DeleteRow(int RnPO)
        //{


        //    TB_PR_PO addPO = new TB_PR_PO();

        //    addPO.RnPO = RnPO;

        //    new PR_PurchaseBL().Delete(addPO);

        //}

        //        {
        //    TB_PR_PO deleted = new TB_PR_PO();


        //    deleted.RnPO = log.RnPO;
        //    deleted.RnBOQ = log.RnBOQ;
        //    deleted.Amount = log.Amount;
        //    deleted.Date = log.Date;
        //    deleted.Status = log.Status;
        //    deleted.Street = log.Street;


        //    new PR_PurchaseBL().Delete(deleted);

        //}

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void SaveRFQ(int RnRFQ, string Company, DateTime Date, int RnBOQ, int RnRefv, string Remarks)
        {


            TB_PR_RFQ addRFQ = new TB_PR_RFQ();

            addRFQ.RnRFQ = RnRFQ;
            addRFQ.Company = Company;
            addRFQ.Date = Date;
            addRFQ.RnBOQ = RnBOQ;
            addRFQ.RnRefv = RnRefv;
            addRFQ.Remarks = Remarks;



            new PR_RequestForQuotationBL().Save(addRFQ);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<PR_rfq> GetRnREQ()
        {
            return new PR_RequestForQuotationBL().GetAll();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Updaterfq(int RnRFQ, string Company, DateTime Date, int RnBOQ, int RnRefv, string Remarks)
        {


            TB_PR_RFQ addRFQ = new TB_PR_RFQ();

            addRFQ.RnRFQ = RnRFQ;
            addRFQ.Company = Company;
            addRFQ.Date = Date;
            addRFQ.RnBOQ = RnBOQ;
            addRFQ.RnRefv = RnRefv;
            addRFQ.Remarks = Remarks;




            new PR_RequestForQuotationBL().Update(addRFQ);

        }


        //[WebMethod(EnableSession = true)]
        //[ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        //public void DeleteRow(int RnRRFQ)
        //{


        //    TB_PR_RFQ addRFQ = new TB_PR_RFQ();

        //    addRFQ.RnRFQ = RnRFQ;

        //    new PR_RequestForQuotationBL().Delete(addRFQ);

        //}

    }
}
