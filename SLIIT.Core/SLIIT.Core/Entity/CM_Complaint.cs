using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLIIT.Core.Entity
{
    public class CM_Complaint
    {
        public int CM_ID { get; set; }
        public string CM_CUSTOMER_NAME { get; set; }
        public string CM_EMAIL { get; set; }
        public string CM_HOME_ADDRESS { get; set; }
        public string CM_DESCRIPTION { get; set; }
        public int CM_PRIORITY { get; set; }
        public string CM_TYPE { get; set; }
        public int CM_ISDELETE { get; set; }
        public int UID { get; set; }
    }
}
