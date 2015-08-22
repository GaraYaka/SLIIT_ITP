using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;

namespace SLIIT.ITP.Services
{
    /// <summary>
    /// Summary description for HRServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class HRServices : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void PunchCard(int cardNo)
        {
            if (cardNo != 0)
            {
                //get userdetals from card number
                var attendUserDetails = new HR_AttendUserBL().GetAttendUserByCardNo(cardNo);

                if (attendUserDetails == null)
                {
                    throw new Exception(SLIITCommonResource.ERROR_HR_CARD_NOT_FOUND.ToString());
                }

                //get the last time log
                var lastAttenednceLog = new HR_AttendanceLogBL().GetLastLogByAttendUser(attendUserDetails.RnAttendUserID);

                //if the lastAttenednceLog is empty, user is new
                //if last punch was IN, then set OUT, else do the opposite
                //true = IN
                //false = OUT
                
                TB_HR_AttendanceLog log = new TB_HR_AttendanceLog();

                if (lastAttenednceLog == null)
                {
                    log.Type = true;
                }
                else if (lastAttenednceLog.Type == true)//if last was IN
                {
                    log.Type = false;
                }
                else//if last log was OUT
                {
                    log.Type = true;
                }
                
                log.UserID = attendUserDetails.RnAttendUserID;
                log.LogTime = DateTime.Now;

                //save in db
                new HR_AttendanceLogBL().Insert(log);

            }


        }



        
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void GetAllUsers()
        {
            new HR_AttendUserBL().GetAll();
        }

        //[WebMethod(EnableSession = true)]
        //[ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        //public TB_HR_AttendanceLog GetAllByDate(int date)
        //{
        //    return 
        //}

    }
}
