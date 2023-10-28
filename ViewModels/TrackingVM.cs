using System.ComponentModel.DataAnnotations;

namespace CSM.ViewModels
{
    public class TrackingVM
    {
        public string? ShipperName { get; set; } 
        public string? ShipperPhone { get; set; } 
        public string? Status { get; set; } 
        public string? TrackNumber { get; set; }
        public DateTime? DeliveryDate { get; set; }
    }
}
