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
    public class IC_MasterDataBL : AbstractBL<TB_IC_MasterData, long>
    {

        public int Save(TB_IC_MasterData masterData)
        {
            ITPManager.TB_IC_MasterDatas.InsertOnSubmit(masterData);
            ITPManager.SubmitChanges();

            return masterData.RnItemID;
        }

        public List<IC_MasterData> GetAll()
        {
            var all = (from d in ITPManager.TB_IC_MasterDatas
                       select new IC_MasterData
                       {
                           RnItemID = d.RnItemID,
                           ItemCode = d.ItemCode,
                           ItemCategory = d.ItemCategory,
                           Quantity = d.Quantity,
                           ItemName = d.ItemName,
                           TotalPrice = (decimal)d.TotalPrice,
                           UnitPrice = (decimal)d.UnitPrice,

                           
                       }).ToList();

            return all;
        }


    }
}
