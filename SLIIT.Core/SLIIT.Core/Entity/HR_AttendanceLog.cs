using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class HR_AttendanceLog
    {
        public int RnLogID { get; set; }
        public int UserID { get; set; }
        public DateTime LogTime { get; set; }
        public string DisplayLogTime
        {
            get { return string.Format("{0:yyyy/MM/dd}", LogTime); }
        }
        public bool Type { get; set; }
        public bool IsDeleted { get; set; }
        public string UserName { get; set; }
    }
}
