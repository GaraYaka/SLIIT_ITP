using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace SLIIT.Core.Entity
{
    public class VF_Vehicle
    {
        public int RnVehicleID { get; set; }
        public string RegNo { get; set; }
        public string Model { get; set; }
        public DateTime YearOfManuf { get; set; }
        public string YearOfManufDisplayDate 
        {
            get { return string.Format("{0:yyyy/MM/dd}", YearOfManuf); }
        }
        public DateTime YearOfPurchase { get; set; }
        public string YearOfPurchaseDisplayDate
        {
            get { return string.Format("{0:yyyy/MM/dd}", YearOfPurchase); }
        }
        public HR_AttendUser Driver { get; set; }
        public string EngineNo { get; set; }
        public string ChassieNo { get; set; }
        public VF_VehicleStatus Status { get; set; }
        public bool? IsDeleted { get; set; }


    }
}
