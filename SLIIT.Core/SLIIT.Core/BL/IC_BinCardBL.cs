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
    public class IC_BinCardBL : AbstractBL<TB_IC_BinCard, long>
    {
        public int Save(TB_IC_BinCard bincard)
        {
            ITPManager.TB_IC_BinCards.InsertOnSubmit(bincard);
            ITPManager.SubmitChanges();

            return bincard.RnBinCardID;
        }

        public List<IC_BinCard> GetAll()
        {
            var all = (from d in ITPManager.TB_IC_BinCards
                       select new IC_BinCard
                       {
                           RnBinCardID = d.RnBinCardID,
                           ItemCode = d.ItemCode,
                           Unit = d.Unit,
                           UnitPrice = d.UnitPrice,
                           Quantity = d.Quantity,
                           RnCatID = d.RnCatID


                       }).ToList();

            return all;
        }

        public List<IC_BinCard> SearchAll(int catid)
        {
            var all = (from d in ITPManager.TB_IC_BinCards
                       where d.RnCatID == catid
                       select new IC_BinCard
                       {
                           RnBinCardID = d.RnBinCardID,
                           ItemCode = d.ItemCode,
                           Unit = d.Unit,
                           UnitPrice = d.UnitPrice,
                           Quantity = d.Quantity,
                           RnCatID = d.RnCatID


                       }).ToList();

            return all;
        }

        public void Update(TB_IC_BinCard updateDetails)
        {
            var item = ITPManager.TB_IC_BinCards.SingleOrDefault(d => d.RnBinCardID == updateDetails.RnBinCardID);

            if (item != null)
            {
                item.ItemCode = updateDetails.ItemCode;
                item.Unit = updateDetails.Unit;
                item.UnitPrice = updateDetails.UnitPrice;
                item.Quantity = updateDetails.Quantity;
                item.RnCatID = updateDetails.RnCatID;

                SaveChanges();
            }

        }




    }
}
