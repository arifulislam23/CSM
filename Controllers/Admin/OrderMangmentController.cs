using CSM.Data;
using CSM.DataModels;
using CSM.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class OrderMangmentController : Controller
    {
        private readonly ApplicationDbContext _context;
        public OrderMangmentController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult CreateOrder()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CreateOrder(CourierVM viewModel)
        {

            if (IsAnyFieldMissing(viewModel))
            {
                ModelState.AddModelError("", "Please fill in all required fields.");
                return View(viewModel);
            }
            try
            {
                int CustomerId = 0;
                var customer = new Customer
                {
                    MobileNumber = viewModel.Customer.MobileNumber,
                    Name = viewModel.Customer.Name,
                    Address = viewModel.Customer.Address
                };

                // Check if the customer with the given mobile number already exists
                var existingCustomer = _context.Customers.FirstOrDefault(c => c.MobileNumber == customer.MobileNumber);

                if (existingCustomer != null)
                {
                    // Customer with the same mobile number exists, update Name and Address
                    existingCustomer.Name = customer.Name;
                    existingCustomer.Address = customer.Address;
                    customer.CustomerId = existingCustomer.CustomerId;
                }
                else
                {
                    // Customer does not exist, add it to the database
                    _context.Customers.Add(customer);
                }

                var recipient = new Recipient
                {
                    MobileNumber = viewModel.Recipient.MobileNumber,
                    Name = viewModel.Recipient.Name,
                    Address = viewModel.Recipient.Address
                };

                var parcel = new Parcel
                {
                    ParcelType = viewModel.Parcel.ParcelType,
                    Weight = viewModel.Parcel.Weight,
                    Description = viewModel.Parcel.Description,
                    Price = viewModel.Parcel.Price,
                };

                _context.Recipients.Add(recipient);
                _context.Parcels.Add(parcel);
                await _context.SaveChangesAsync();

                // Create the Shipment object with the foreign key relationships
                var shipment = new Shipment
                {
                    ParcelId = parcel.ParcelId,
                    CustomerId = customer.CustomerId,
                    RecipientId = recipient.RecipientId,
                    TrackNumber = customer.MobileNumber + parcel.ParcelId

                };

                _context.Shipment.Add(shipment);
                await _context.SaveChangesAsync();

                return RedirectToAction("Details", new { id = shipment.ShipmentId });

            }
            catch (DbUpdateConcurrencyException) { }


            return RedirectToAction("CreateOrder");
        }
        private bool IsAnyFieldMissing(CourierVM viewModel)
        {
            return viewModel.Parcel == null ||
                   viewModel.Parcel.Weight == 0 ||
                   string.IsNullOrWhiteSpace(viewModel.Parcel.ParcelType) ||
                   viewModel.Customer == null ||
                   string.IsNullOrWhiteSpace(viewModel.Customer.Name) ||
                   string.IsNullOrWhiteSpace(viewModel.Customer.MobileNumber) ||
                   viewModel.Recipient == null ||
                   string.IsNullOrWhiteSpace(viewModel.Recipient.Address) ||
                   string.IsNullOrWhiteSpace(viewModel.Recipient.MobileNumber) ||
                   string.IsNullOrWhiteSpace(viewModel.Customer.Address);
        }
        [HttpPost]
        public JsonResult Customerinfo(string mobileNumber)
        {
            try
            {
                // Check if the mobile number exists in the Customer table
                var customer = _context.Customers.FirstOrDefault(c => c.MobileNumber == mobileNumber);

                if (customer != null)
                {
                    // If found, return the name and address
                    var result = new
                    {
                        name = customer.Name,
                        address = customer.Address
                    };
                    return Json(result);
                }
                else
                {
                    return Json("");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                return Json("Server error");
            }
        }

        [HttpGet]
        public IActionResult OrdersList(string? searchInput, int? page)
        {
            int pageSize = 20;
            int pageNumber = page ?? 1;

            var OrderList = _context.Shipment
                .Include(s => s.Customer)
                .Include(s => s.Parcel)
                .OrderByDescending(x => x.ParcelId);

            if (!string.IsNullOrWhiteSpace(searchInput))
            {
                // Filter the query based on the search term
                OrderList = (IOrderedQueryable<Shipment>)OrderList.Where(x => x.TrackNumber.Contains(searchInput) || x.Status.Contains(searchInput));
            }

            var pagedOrders = OrderList.ToPagedList(pageNumber, pageSize);
            ViewBag.searchInput = searchInput;
            return View(pagedOrders);
        }


        public IActionResult Details(int id)
        {
            var OrderDetails = _context.Shipment
                .Include(s => s.Customer)
                .Include (s => s.Parcel)
                .Include(s => s.Shipper)
                .Include(s => s.Recipient)
                .FirstOrDefault(x => x.ShipmentId == id);

            return View(OrderDetails);
        }
        public IActionResult UpdateOrder(int id)
        {
            // Find the shipment by ID
            var shipment = _context.Shipment
                .Include(s => s.Parcel)
                .Include(s => s.Customer)
                .Include(s => s.Recipient)
                .FirstOrDefault(s => s.ShipmentId == id);

            if (shipment == null)
            {
                return NotFound(); // Handle not found
            }

            // Create a view model to hold the shipment data
            var viewModel = new CourierVM
            {
                Shipment = shipment,
                Customer = shipment.Customer,
                Recipient = shipment.Recipient,
                Parcel = shipment.Parcel
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateOrder(CourierVM viewModel)
        {
            if (IsAnyFieldMissing(viewModel))
            {
                ModelState.AddModelError("", "Please fill in all required fields.");
                return View(viewModel);
            }

            try
            {
                int shipmentId = viewModel.Shipment.ShipmentId;

                // Find the shipment to update
                var shipmentToUpdate = _context.Shipment
                    .Include(s => s.Parcel)
                    .Include(s => s.Customer)
                    .Include(s => s.Recipient)
                    .FirstOrDefault(s => s.ShipmentId == shipmentId);

                if (shipmentToUpdate == null)
                {
                    return NotFound(); // Handle not found
                }

                // Update customer information
                shipmentToUpdate.Customer.Name = viewModel.Customer.Name;
                shipmentToUpdate.Customer.MobileNumber = viewModel.Customer.MobileNumber;
                shipmentToUpdate.Customer.Address = viewModel.Customer.Address;

                // Update recipient information
                shipmentToUpdate.Recipient.Name = viewModel.Recipient.Name;
                shipmentToUpdate.Recipient.MobileNumber = viewModel.Recipient.MobileNumber;
                shipmentToUpdate.Recipient.Address = viewModel.Recipient.Address;

                // Update parcel information
                shipmentToUpdate.Parcel.ParcelType = viewModel.Parcel.ParcelType;
                shipmentToUpdate.Parcel.Weight = viewModel.Parcel.Weight;
                shipmentToUpdate.Parcel.Description = viewModel.Parcel.Description;
                shipmentToUpdate.Parcel.Price = viewModel.Parcel.Price;

                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // Handle concurrency exception
            }

            return RedirectToAction("UpdateOrder");
        }




    }
}
