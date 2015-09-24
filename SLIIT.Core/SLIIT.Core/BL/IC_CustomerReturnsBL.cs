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
    public class IC_CustomerReturnsBL : AbstractBL<TB_IC_CustomerReturn,long>
    {
        public void Insert(TB_IC_CustomerReturn CusReturn)
        {
            ITPManager.TB_IC_CustomerReturns.InsertOnSubmit(CusReturn);
            ITPManager.SubmitChanges();
        }

        //public List<IC_CustomerReturns> GetAll()
        //{
        //    var all = (from d in ITPManager.TB_IC_CustomerReturns
        //               select new IC_CustomerReturns
        //               {
        //                   RnReturnID = d.RnReturnID,
        //                   IssueCode = d.IssueCode,
        //                   ItemCode = d.ItemCode,
        //                   ItemCategory = d.ItemCategory,
        //                   ItemName = d.ItemName,
        //                   StockQty = d.StockQty,
        //                   IssueQty = d.IssueQty,
        //                   UnitPrice = (decimal)d.UnitPrice,
        //                   IssuePrice = (decimal)d.IssuePrice,
                           
                           

        //               }).ToList();

        //    return all;
        //}
    }
}
