using System.ComponentModel.DataAnnotations;

namespace CSM.DataModels
{
    public class Shipment
    {
        [Key]
        public int ShipmentId { get; set; }

        public int ParcelId { get; set; } // Foreign key to link to the Parcel model

        public int CustomerId { get; set; } // Foreign key to link to the Recipient model
        public int RecipientId { get; set; } // Foreign key to link to the Recipient model

        public int? EmployeId { get; set; } // Foreign key to link to the Employee model

        [MaxLength(50)]
        public string Status { get; set; } = "Pending";
        [MaxLength(20)]
        public string? TrackNumber { get; set; }
        public DateTime? DeliveryAt { get; set; }



        // Navigation properties to link to related models
        public Customer? Customer { get; set; }
        public Parcel? Parcel { get; set; }
        public Recipient? Recipient { get; set; }
        public Employe? Shipper { get; set; }
    }
}
