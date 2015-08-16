using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;

namespace SLIIT.Core.BL
{
    public class UserRoleBL : AbstractBL<TB_UserRole, long>
    {
        public List<Menu> GetMenuByUserID(int userID)
        {
            var roles = (from d in ITPManager.TB_UserRoles
                         where d.UserID == userID
                         select d.RoleID).ToList();

            var menu = (from d in ITPManager.TB_MenuRoles
                        where roles.Contains(d.RoleID)
                        select new Menu
                        {
                            MenuDisplayName = d.TB_Menu.MenuName,
                            MenuImage = d.TB_Menu.MenuImage,
                            MenuHomePage = d.TB_Menu.MenuPath,
                            MenuColorStyle = d.TB_Menu.MenuColorStyle,
                            MenuOrder = d.TB_Menu.MenuOrder,
                            RoleName = d.TB_Role.RoleName,
                            RoleIcon = d.TB_Role.RoleIcon
                        }).ToList();

            return menu;
        }
    }
}
