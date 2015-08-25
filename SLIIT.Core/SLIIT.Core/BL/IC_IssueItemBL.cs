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
        public void Insert(TB_IC_IssueItem IssueItem)
        {
            ITPManager.TB_IC_IssueItems.InsertOnSubmit(IssueItem);
            ITPManager.SubmitChanges();
        }

        public List<IC_IssueItem> GetAll()
        {
            var all = (from d in ITPManager.TB_IC_IssueItems
                       select new IC_IssueItem
                       {
                          RnIssueID = d.RnIssueID,
                          ItemCode = d.ItemCode,
                          ItemCategory = d.ItemCategory,
                          ItemName = d.ItemName,
                          StockQty = d.StockQty,
                          IssueQty = d.IssueQty,
                          UnitPrice = (decimal)d.UnitPrice,
                          IssueUnitPrice = (decimal)d.IssueUnitprice,
                          TotalPrice = (decimal)d.TotalPrice
                       }).ToList();

            return all;
        }
    }
}
