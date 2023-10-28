using System.ComponentModel.DataAnnotations;

namespace CSM.DataModels
{
    public class Parcel
    {
        [Key]
        public int ParcelId { get; set; }

        [MaxLength(50)]
        public string ParcelType { get; set; }

        [MaxLength(255)]
        public string? Description { get; set; }

        [Range(0.1, 1000)]
        public decimal Weight { get; set; }
        public decimal Price { get; set; } = 0;

        public DateTime CreateAt { get; set; } = DateTime.Now;
    }
}
