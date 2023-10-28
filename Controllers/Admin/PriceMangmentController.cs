using CSM.Data;
using CSM.DataModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class PriceMangmentController : Controller
    {
        private readonly ApplicationDbContext _context;
        public PriceMangmentController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            var prices = _context.Price.OrderBy(x => x.weightFrom).ToList();
            return (prices != null && prices.Count > 0) ? View(prices) : View();

        }

        [HttpPost]
        public async Task<IActionResult> Index(Price price)
        {
            if (price.PriceId == 0)
            {
                // Check if the weight range is available
                bool isWeightRangeAvailable = await _context.Price
                    .AllAsync(p => price.weightFrom > p.weightTo || price.weightTo < p.weightFrom);

                if (isWeightRangeAvailable && price.Amount != 0)
                {
                    _context.Price.Add(price);
                    await _context.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            else
            {
                // Check if the new weightTo and weight values are already used
                bool isNewWeightRangeUsed = await _context.Price
                    .AnyAsync(p => p.PriceId != price.PriceId &&
                        (price.weightFrom >= p.weightFrom && price.weightFrom <= p.weightTo ||
                         price.weightTo >= p.weightFrom && price.weightTo <= p.weightTo));

                if (!isNewWeightRangeUsed)
                {
                    _context.Price.Update(price);
                    await _context.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
               
            }
            TempData["Message"] = "The new weight range is already used";
            return RedirectToAction("Index");

        }


        [HttpPost]
        public JsonResult GetPrice(decimal parcelWeight)
        {
            var price = _context.Price
                .Where(p => p.weightFrom <= parcelWeight && p.weightTo >= parcelWeight)
                .FirstOrDefault();

            if (price != null)
            {
                return Json(new { amount = price.Amount });
            }

            return Json(new { amount = 0 });
        }

    }
}

