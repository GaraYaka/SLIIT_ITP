using SLIIT.Core.DTO;
using SLIIT.Core.BL;
using SLIIT.Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.BL
{
    public class IC_IssueItemBL : AbstractBL<TB_IC_IssueItem,long>
    {
        public int Insert(TB_IC_IssueItem IssueItem)
        {
            ITPManager.TB_IC_IssueItems.InsertOnSubmit(IssueItem);
            ITPManager.SubmitChanges();

            return IssueItem.RnIssueID;
        }

        public List<IC_IssueItem> GetAll()
        {
            var all = (from d in ITPManager.TB_IC_IssueItems
                       select new IC_IssueItem
                       {
                           RnIssueID = d.RnIssueID,
                           ItemCode = d.ItemCode,
                           IssuePrice = d.IssuePrice,
                           IssueQty = d.IssueQty,
                           RnBinCardID = d.RnBinCardID,
                           RnCatID = d.RnCatID,
                           Cemail = d.Cemail,
                           InvoiceNum = d.InvoiceNum


                       }).ToList();

            return all;
        }

        //public void Update(TB_IC_IssueItem updateDetails)
        //{
        //    var item = ITPManager.TB_IC_IssueItems.SingleOrDefault(d => d.Cemail == updateDetails.Cemail);

        //    if (item != null)
        //    {
        //        item.Cemail = updateDetails.Cemail;

        //        SaveChanges();
        //    }

        //}
    }
}
