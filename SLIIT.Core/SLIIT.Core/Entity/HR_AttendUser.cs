﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public class HR_AttendUser
    {
        public int RnAttendUserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Dept { get; set; }
        public bool isDeleted { get; set; }

    }
}
