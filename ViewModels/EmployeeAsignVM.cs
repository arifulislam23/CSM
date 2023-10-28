using CSM.DataModels;

namespace CSM.ViewModels
{
    public class EmployeeAsignVM
    {
        public DateTime SelectedDate { get; set; }
        public int SelectedEmployeeId { get; set; }
        public List<Shipment> Shipments { get; set; }
        public List<int> SelectedShipmentIds { get; set; }
        public List<Employe> Employees { get; set; }
    }
}
