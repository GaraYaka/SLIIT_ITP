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
    public class UserBL : AbstractBL<TB_User, long>
    {
        public User GetUserByID(int userID)
        {
            var user = (from d in ITPManager.TB_Users
                        where d.RnUserID == userID
                        select new User
                        {
                            RnUserID = d.RnUserID,
                            UserName = d.UserName,
                            Password = d.Password,
                            FirstName = d.FirstName,
                            LastName = d.LastName,
                            ProfilePic = d.ProfilePic
                        }).SingleOrDefault();

            return user;
        }

        public User AutenticateLogin(User user)
        {
            var isValidated = (from d in ITPManager.TB_Users
                               where d.UserName == user.UserName
                                      && d.Password == user.Password
                               select new User
                               {
                                   RnUserID = d.RnUserID,
                                   UserName = d.UserName,
                                   Password = d.Password
                               }).SingleOrDefault();

            return isValidated;
        }



    }
}
