using CSM.Data;
using CSM.DataModels;
using CSM.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class ShipmentController : Controller
    {
        private readonly ApplicationDbContext _context;
        public ShipmentController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult EmployeeAsign(string? searchInput)
        {
            IQueryable<Shipment> query = _context.Shipment
                .Include(s => s.Parcel)
                .Include(s => s.Recipient)
                .Where(s => s.Status == "Pending");

            if (!string.IsNullOrWhiteSpace(searchInput))
            {
                query = query.Where(s =>
                    s.TrackNumber.Contains(searchInput) ||
                    s.Status.Contains(searchInput)
                );
            }

            var shipmentInfo = query.ToList();

            var employees = _context.Employe.ToList();

            var viewModel = new EmployeeAsignVM
            {
                Shipments = shipmentInfo,
                Employees = employees
            };

            return View(viewModel);
        }



        [HttpPost]
        public IActionResult EmployeeAsign(EmployeeAsignVM model)
        {
            
                if (model.SelectedShipmentIds != null && model.SelectedShipmentIds.Any())
                {
                    // Fetch the selected employee
                    var selectedEmployee = _context.Employe.FirstOrDefault(e => e.EmployeId == model.SelectedEmployeeId);

                    if (selectedEmployee != null)
                    {
                        // Assign the selected shipments to the employee
                        var shipmentsToAssign = _context.Shipment.Where(s => model.SelectedShipmentIds.Contains(s.ShipmentId)).ToList();

                        foreach (var shipment in shipmentsToAssign)
                        {
                            shipment.EmployeId = selectedEmployee.EmployeId;
                            shipment.DeliveryAt = model.SelectedDate;
                            shipment.Status = "On The Way";
                            _context.Update(shipment);
                        }

                        _context.SaveChanges();
                    }

                    // Redirect to the same action or another page as needed
                    return RedirectToAction("EmployeeAsign");
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Please select at least one shipment to assign.");
                }
            

            // If model state is not valid, return the view with the same model to display errors
            model.Employees = _context.Employe.ToList();
            model.Shipments = _context.Shipment.Include(s => s.Parcel).Include(s => s.Recipient).ToList();

            return View(model);
        }

        [HttpGet]
        public IActionResult ShipmentList(string? searchInput)
        {
            IQueryable<Shipment> query = _context.Shipment
                .Include(s => s.Parcel)
                .Include(s => s.Recipient)
                .Where(s => s.Status != "Completed");

            if (!string.IsNullOrWhiteSpace(searchInput))
            {
                query = query.Where(s =>
                    s.TrackNumber.Contains(searchInput) ||
                    s.Status.Contains(searchInput)
                );
            }

            var shipmentInfo = query.ToList();

            var employees = _context.Employe.ToList();

            var viewModel = new ShipmentListVM
            {
                SelectedDate = DateTime.Now,
                Employees = employees,
                Shipments = shipmentInfo,
                SelectedShipmentIds = new List<int>()
            };

            return View(viewModel);
        }



        [HttpPost]
        public IActionResult UpdateStatus(ShipmentListVM model)
        {
            if (model.SelectedShipmentIds != null)
            {
                // Update the status of selected shipments
                var shipmentsToUpdate = _context.Shipment.Where(s => model.SelectedShipmentIds.Contains(s.ShipmentId)).ToList();
                foreach (var shipment in shipmentsToUpdate)
                {
                    shipment.DeliveryAt = DateTime.Now;
                    shipment.Status = "Completed";
                }
                _context.SaveChanges();
            }

            return RedirectToAction("ShipmentList");
        }



    }
}
