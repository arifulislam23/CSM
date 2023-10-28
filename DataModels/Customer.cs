using System.ComponentModel.DataAnnotations;

namespace CSM.DataModels
{
    public class Customer
    {
            [Key]
            public int CustomerId { get; set; }

            [MaxLength(50)]
            public string Name { get; set; }

            [MaxLength(150)]
            public string Address { get; set; }

            [MaxLength(15)]
            public string MobileNumber { get; set; }
        
    }
}
