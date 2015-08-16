using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class Menu
    {
        public int MenuID { get; set; }
        public string MenuDisplayName { get; set; }
        public string MenuImage { get; set; }
        public string MenuHomePage { get; set; }
        public string MenuParameters { get; set; }
        public string SystemID { get; set; }
        public int? RoleType { get; set; }
        public string RoleName { get; set; }
        public string MenuColorStyle { get; set; }
        public int? MenuOrder { get; set; }
        public string RoleIcon { get; set; }
        public string RoleDisplayName { get; set; }
    }
}
