using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SLIIT.Core.DTO;

namespace SLIIT.Core.BL
{
    public class AbstractBL <T, Idt>
    {
        private ITPManagerDataContext _ITPManager = new ITPManagerDataContext();

        public List<T> GetAll<T>()
        {
            _ITPManager.DeferredLoadingEnabled = false;
            _ITPManager.ObjectTrackingEnabled = false;
            List<T> entities = _ITPManager.GetTable(typeof(T)) as List<T>;
            return entities;
        }

        protected AbstractBL()
        {

        }

        public bool SaveChanges()
        {
            try
            {
                _ITPManager.SubmitChanges();

                return true;
            }
            catch (Exception e)
            {
                //Logger.Error("AbstractDao", "Error In Save Changes: \n " + e.Message);
                //Logger.Error("AbstractDao", "Error In Save Changes: \n " + e.StackTrace);
                if (null != _ITPManager.Transaction)
                {
                    _ITPManager.Transaction.Rollback();
                }
                throw e;
            }
        }

        protected ITPManagerDataContext ITPManager
        {
            get
            {
                if (null == _ITPManager)
                {
                    _ITPManager = new ITPManagerDataContext();
                }
                return _ITPManager;
            }
            set
            {
                _ITPManager = value;
            }
        } 
    }
}
