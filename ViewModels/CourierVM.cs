using CSM.DataModels;

namespace CSM.ViewModels
{
    public class CourierVM
    {
        public Customer Customer { get; set; }
        public Parcel Parcel { get; set; }
        public Recipient Recipient { get; set; }
        public Shipment Shipment { get; set; }
    }
}
