using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;
using System.IO;
using System.Net.Mail;


namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for ICServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ICServices : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_MasterData> GetAll()
        {
            return new IC_MasterDataBL().GetAll();
        }

       
       
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void SaveItem(string itemCode, string itemName, int category, int reorderqty)
        {


            TB_IC_MasterData addItem = new TB_IC_MasterData();

            addItem.ItemCode = itemCode;
            addItem.ItemCategory = category;
            addItem.ItemName = itemName;
            addItem.ReOrderQty = reorderqty;

            new IC_MasterDataBL().Save(addItem);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void UpdateItem(int RnItemID, string itemCode, string itemName, int category, int reorderqty)
        {
            TB_IC_MasterData addItem = new TB_IC_MasterData();

            addItem.RnItemID = RnItemID;
            addItem.ItemCode = itemCode;
            addItem.ItemCategory = category;
            addItem.ItemName = itemName;
            addItem.ReOrderQty = reorderqty;

            new IC_MasterDataBL().Update(addItem);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_Category> GetAllCategories()
        {
            return new IC_MasterDataBL().GetAllCategories();
        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_MasterData> GetMasterData()
        {
            return new IC_MasterDataBL().GetAll();
        }
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public string takeItem(string itemCode)
        {

            string ic = itemCode;

            return ic;

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void AddtoBinCard(string itemCode, string Unit, decimal UnitPrice, int Quantity,int RnCatID)
        {


            TB_IC_BinCard addItem = new TB_IC_BinCard();

            addItem.ItemCode = itemCode;
            addItem.Unit = Unit;
            addItem.UnitPrice = UnitPrice;
            addItem.Quantity = Quantity;
            addItem.RnCatID = RnCatID;
            new IC_BinCardBL().Save(addItem);

            

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_BinCard> GetBinCard()
        {
            return new IC_BinCardBL().GetAll();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_BinCard> searchData(int catid)
        {
            return new IC_BinCardBL().GetAll();
            
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void UpdateBinItem(int RnBinCardID, string ItemCode, string Unit, decimal UnitPrice, int Quantity, int RnCatID)
        {
            TB_IC_BinCard addItem = new TB_IC_BinCard();

            addItem.RnBinCardID = RnBinCardID;
            addItem.ItemCode = ItemCode;
            addItem.Unit = Unit;
            addItem.UnitPrice = UnitPrice;
            addItem.Quantity = Quantity;
            addItem.RnCatID = RnCatID;

            new IC_BinCardBL().Update(addItem);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void IssueItem(string ItemCode, decimal IssuePrice, int IssueQty, int RnCatID, int RnBinCardID, string Cemail, string InvoiceNum)
        {


            TB_IC_IssueItem addItem = new TB_IC_IssueItem();

            addItem.ItemCode = ItemCode;
            addItem.IssuePrice = IssuePrice;
            addItem.IssueQty = IssueQty;
            addItem.RnCatID = RnCatID;
            addItem.RnBinCardID = RnBinCardID;
            addItem.Cemail = Cemail;
            addItem.InvoiceNum = InvoiceNum;

            new IC_IssueItemBL().Insert(addItem);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<IC_IssueItem> GetIssueData()
        {
            return new IC_IssueItemBL().GetAll();
        }

        private void NotifyApprovalUserOnSubmission(string displayName, string formattedPettyCashID, string email)
        {
            var mailBody = String.Empty;
            System.Net.Mail.Attachment attachment;
            string emailSubject = "test";

            StreamReader sr = new StreamReader(Server.MapPath("../UI/Mail/Invoice.html"));
            mailBody = sr.ReadToEnd();
            sr.Close();

            attachment = new System.Net.Mail.Attachment(Server.MapPath("../Images/midaslogo.jpg"));
            attachment.ContentDisposition.Inline = false;
            attachment.ContentId = "img001logo";

            List<System.Net.Mail.Attachment> list = new List<Attachment>();
            list.Add(attachment);

            string description = "You have received a Receipt for your order.";

            mailBody = mailBody.Replace("#Dear_Display_Name#", displayName);
            mailBody = mailBody.Replace("#Description#", description);
            mailBody = mailBody.Replace("#Formatted_ID#", formattedPettyCashID);
            mailBody = mailBody.Replace("#System_URL#", "test");
            mailBody = mailBody.Replace("#IMAGE_URL#", "cid:img001logo"); ;

            TriggerAsyncMail(email, emailSubject, mailBody, list);
        }

        private void TriggerAsyncMail(string email, string emailSubject, string emailBody, List<Attachment> att)
        {
           // SLIIT.Core.BL.SendMailBL.Send(email, emailSubject, emailBody, string.Empty, att);
        }
    }
}
