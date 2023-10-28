using CSM.Data;
using CSM.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using X.PagedList;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class ReportsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ReportsController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult ConsignmentList(string? searchInput, int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 20;

            var query = _context.Shipment
                .Include(x => x.Customer)
                .Include(x => x.Parcel)
                .Include(x => x.Shipper)
                .Include(x => x.Recipient)
                .OrderByDescending(x => x.ShipmentId);

            if (!string.IsNullOrEmpty(searchInput))
            {
                // Add search conditions here based on your requirements.
                query = (IOrderedQueryable<DataModels.Shipment>)query.Where(x =>
                    x.TrackNumber.Contains(searchInput) ||
                    x.Status.Contains(searchInput)
                );
            }

            var pagedConsignments = query.ToPagedList(pageNumber, pageSize);
            ViewBag.searchInput = searchInput;
            return View(pagedConsignments);
        }

        [HttpGet]
        public async Task<IActionResult> CustomerList(string searchInput, int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 20;

            var query = _context.Customers
                .OrderBy(x => x.Name);

            if (!string.IsNullOrEmpty(searchInput))
            {
                searchInput = searchInput.ToLower();

                query = (IOrderedQueryable<DataModels.Customer>)query
                    .Where(c =>
                        c.Name.ToLower().Contains(searchInput) ||
                        c.MobileNumber.Contains(searchInput) ||
                        c.CustomerId.ToString().Contains(searchInput) ||
                        c.Address.ToLower().Contains(searchInput)
                    );
            }

            var customerViewModels = query
                .Select(c => new CustomerVM
                {
                    Customer = c,
                    TotalOrders = _context.Shipment.Count(s => s.CustomerId == c.CustomerId)
                });

            var pagedCustomers = await customerViewModels.ToPagedListAsync(pageNumber, pageSize);
            ViewBag.searchInput = searchInput;
            return View(pagedCustomers);
        }


    }
}
