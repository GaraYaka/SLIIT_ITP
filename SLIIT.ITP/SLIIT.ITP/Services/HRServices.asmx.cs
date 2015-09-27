using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using SLIIT.Core.BL;
using SLIIT.Core.DTO;
using SLIIT.Core.Entity;
using System.IO;
using System.Net.Mail;

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

            NotifyApprovalUserOnSubmission("isuru", "f", "isuru.samarasinha@midassafety.com");

        }




        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<HR_AttendUser> GetAllUsers()
        {
            return new HR_AttendUserBL().GetAll();
        }



        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Update(HR_AttendanceLog log)
        {
            TB_HR_AttendanceLog updated = new TB_HR_AttendanceLog();

            updated.RnLogID = log.RnLogID;
            updated.UserID = log.UserID;
            updated.LogTime = log.LogTime;
            updated.Type = log.Type;

            new HR_AttendanceLogBL().Update(updated);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Delete(HR_AttendanceLog log)
        {
            TB_HR_AttendanceLog deleted = new TB_HR_AttendanceLog();

            deleted.UserID = log.UserID;
            deleted.LogTime = log.LogTime;
            deleted.Type = log.Type;

            new HR_AttendanceLogBL().Delete(deleted);

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void Insert(HR_AttendanceLog log)
        {
            var attendUserDetails = new HR_AttendUserBL().GetAttendUserByID(log.UserID);

            this.PunchCard(attendUserDetails.CardNo);
            NotifyApprovalUserOnSubmission("isuru", "f", "isuru.samarasinha@midassafety.com");
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public List<HR_AttendanceLog> GetAllAttendenceLogs()
        {
            return new HR_AttendanceLogBL().GetAll();
        }

        private void NotifyApprovalUserOnSubmission(string displayName, string formattedPettyCashID, string email)
        {
            var mailBody = String.Empty;
            System.Net.Mail.Attachment attachment;
            string emailSubject = "test";

            StreamReader sr = new StreamReader(Server.MapPath("../UI/Mail/test.html"));
            mailBody = sr.ReadToEnd();
            sr.Close();

            attachment = new System.Net.Mail.Attachment(Server.MapPath("../Images/midaslogo.jpg"));
            attachment.ContentDisposition.Inline = false;
            attachment.ContentId = "img001logo";

            List<System.Net.Mail.Attachment> list = new List<Attachment>();
            list.Add(attachment);

            string description = "You have received a pending Cash Receipt request for approval.";

            mailBody = mailBody.Replace("#Dear_Display_Name#", displayName);
            mailBody = mailBody.Replace("#Description#", description);
            mailBody = mailBody.Replace("#Formatted_ID#", formattedPettyCashID);
            mailBody = mailBody.Replace("#System_URL#", "test");
            mailBody = mailBody.Replace("#IMAGE_URL#", "cid:img001logo"); ;

            TriggerAsyncMail(email, emailSubject, mailBody, list);
        }

        private void TriggerAsyncMail(string email, string emailSubject, string emailBody, List<Attachment> att)
        {
            SLIIT.Core.BL.SendMailBL.Send(email, emailSubject, emailBody, string.Empty, att);
        }
    }
}
