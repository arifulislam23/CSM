using CSM.Data;
using CSM.DataModels;
using CSM.Models;
using CSM.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace CSM.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;
       
        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;

        }
      

        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(string tracking_item)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(tracking_item))
                {
                    var parcelInfo = _context.Shipment
                    .Where(s => s.TrackNumber == tracking_item)
                    .Join(
                        _context.Employe,
                        shipment => shipment.EmployeId,
                        employee => employee.EmployeId,
                        (shipment, employee) => new
                        {
                            TrackNumber = shipment.TrackNumber,
                            Status = shipment.Status,
                            DeliveryDate = shipment.DeliveryAt,
                            ShipperName = employee.Name,
                            ShipperPhone = employee.Phone
                        }
                    )
                    .FirstOrDefault();

                    if (parcelInfo != null)
                    {
                        var trackingInfo = new TrackingVM
                        {
                            TrackNumber = parcelInfo.TrackNumber,
                            Status = parcelInfo.Status,
                            DeliveryDate = parcelInfo.DeliveryDate,
                            ShipperName = parcelInfo.ShipperName,
                            ShipperPhone = parcelInfo.ShipperPhone
                        };

                        return View(trackingInfo);
                    }
                    else
                    {
                        // Parcel not found, return an error message
                        ViewBag.ErrorMessage = "Parcel not found.";
                        return View("Index", new TrackingVM());
                    }
                }
                else
                {
                    // Tracking Number error message
                    ViewBag.ErrorMessage = "Tracking Number not found.";
                    return View("Index", new TrackingVM());
                }
            }
            catch { }
            
            return View();
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}