using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SLIIT.Core.Entity
{
    public static class SLIITCommonResource
    {
        #region SessionVariables

        public const string USER_NAME = "User_Name";
        public const string USER_ID = "User_ID";
        public const string USER_EMAIL = "User_Email";
        public const string DISPLAY_NAME = "Dispaly_Name";
        public const string DISPLAY_IMAGE = "Dispaly_Image";

        #endregion


        #region ErrorMessages

        public const string ERROR_Incorrect_Credentials = "Incorrect Username or Password";

        #region HR_Error_Messages

        public const string ERROR_HR_CARD_NOT_FOUND = "Card details not found!";

        #endregion

        #region VF_Error_Messages

        public const string ERROR_VF_ID_MUST_BE_INT = "ID Must not be empty of type int";
        public const string ERROR_VF_PARSE_ERROR = "Error in Parsing!";
        public const string ERROR_VF_CANNOT_BE_LESS_THAN_ZERO = "Error cannot be less than zero!";

        #endregion



        #endregion

        public static string FormatIOUHeaderID(int iouHeaderID)
        {
            if (iouHeaderID == 0)
            {
                return string.Empty;
            }
            return string.Format("{0:IOU-0000000}", iouHeaderID);
        }

        public enum Status
        {
            New = 1,
            Submitted = 2,
            Approved = 3,
            Rejected = 4,
        }


        public static string GetStatusText(int? statusID)
        {
            if (statusID == (int)SLIITCommonResource.Status.New)
            {
                return SLIITCommonResource.Status.New.ToString();
            }
            else if (statusID == (int)SLIITCommonResource.Status.Submitted)
            {
                return "Awaiting HOD Approval";
            }
            else if (statusID == (int)SLIITCommonResource.Status.Approved)
            {
                return "Approved by Supervisor";
            }
            else if (statusID == (int)SLIITCommonResource.Status.Rejected)
            {
                return "Rejected";
            }
            return string.Empty;
        }
    }
}
