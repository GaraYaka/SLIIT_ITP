using SLIIT.Core.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SLIIT.Core.BL
{
    public class SettingBL : AbstractBL<TB_Setting, long>
    {
        public TB_Setting GetSettings()
        {
            var settings = from sett in ITPManager.TB_Settings
                           select sett;
            if (settings.Count<TB_Setting>() > 0)
                return settings.First<TB_Setting>();
            return null;
        }
    }
}
