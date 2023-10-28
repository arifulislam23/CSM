using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using CSM.DataModels;

namespace CSM.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<Customer> Customers { get; set; } = default!;
        public DbSet<Parcel> Parcels { get; set; } = default!;
        public DbSet<Recipient> Recipients { get; set; } = default!;
        public DbSet<Employe> Employe { get; set; } = default!;
        public DbSet<Shipment> Shipment { get; set; } = default!;
        public DbSet<Price> Price { get; set; } = default!;
    }

}