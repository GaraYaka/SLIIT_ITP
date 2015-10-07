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

        public void Update(TB_IC_MasterData updateDetails)
        {
            var item = ITPManager.TB_IC_MasterDatas.SingleOrDefault(d => d.RnItemID == updateDetails.RnItemID);
                        
            if(item != null)
            {
                item.ItemCode = updateDetails.ItemCode;
                item.ItemName = updateDetails.ItemName;
                item.ItemCategory = updateDetails.ItemCategory;
                item.ReOrderQty = updateDetails.ReOrderQty;

                SaveChanges();
            }
   
        }

        public List<IC_MasterData> GetAll()
        {
            var all = (from d in ITPManager.TB_IC_MasterDatas
                       select new IC_MasterData
                       {
                           RnItemID = d.RnItemID,
                           ItemCode = d.ItemCode,
                           ItemCategory = d.ItemCategory,
                           ItemName = d.ItemName,
                           ReOrderQty = d.ReOrderQty,

                           
                       }).ToList();

            return all;
        }
        public List<IC_Category> GetAllCategories()
        {
            var allCats = (from d in ITPManager.TB_IC_Categories
                           select new IC_Category
                           {
                               RnCatID=d.RnCatID,
                               CategoryName=d.CategoryName
                           }).ToList();
            return allCats;
        }

        
    }
}
