using System.ComponentModel.DataAnnotations;

namespace CSM.DataModels
{
    public class Price
    {
        [Key]
        public int PriceId { get; set; }
        public decimal weightFrom { get; set; }
        public decimal weightTo { get; set; }
        public int Amount { get; set; }
    }
}
