using CSM.Data;
using CSM.DataModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using X.PagedList;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class EmployeMangmentController : Controller
    {
        private readonly ApplicationDbContext _context;

        public EmployeMangmentController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index(string? searchInput,int? page)
        {
            int pageNumber = page ?? 1; 
            int pageSize = 20;

            var query = _context.Employe.AsQueryable();

            if (!string.IsNullOrEmpty(searchInput))
            {
                 searchInput = searchInput.ToLower();

                query = query
                    .Where(e =>
                        e.Name.ToLower().Contains(searchInput) ||
                        e.EmployeId.ToString().Contains(searchInput) ||
                        e.Phone.Contains(searchInput) ||
                        e.Address.Contains(searchInput) ||
                        e.Email.Contains(searchInput)
                    );
            }
            if (query != null)
            {
                ViewBag.searchInput = searchInput;
                var pagedEmployees = await query.ToPagedListAsync(pageNumber, pageSize);
                return View(pagedEmployees);
            }

            return Problem("Entity set is null.");
        }
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Employe == null)
            {
                return NotFound();
            }

            var employe = await _context.Employe
                .FirstOrDefaultAsync(m => m.EmployeId == id);
            if (employe == null)
            {
                return NotFound();
            }

            return View(employe);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Employe employe)
        {
            if (ModelState.IsValid)
            {
                var emp = _context.Employe.Any(m => m.Phone == employe.Phone);
                if (emp == false)
                {
                    _context.Add(employe);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                TempData["Message"] = "Phone Number already used";
                return View(employe);
            }
            TempData["Message"] = "Give Valid Information";
            return View(employe);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Employe == null)
            {
                return NotFound();
            }

            var employe = await _context.Employe.FindAsync(id);
            if (employe == null)
            {
                return NotFound();
            }
            return View(employe);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(int id, Employe employe)
        {
            if (id != employe.EmployeId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var existingEmployee = _context.Employe.FirstOrDefault(x => x.EmployeId == id);

                    if (existingEmployee == null)
                    {
                        return NotFound();
                    }

                    if (existingEmployee.Phone != employe.Phone && _context.Employe.Any(x => x.Phone == employe.Phone))
                    {
                        TempData["Message"] = "Mobile Number already used by another person";
                        return View(employe);
                    }

                    existingEmployee.Name = employe.Name;
                    existingEmployee.Address = employe.Address;
                    existingEmployee.Phone = employe.Phone;
                    existingEmployee.Email = employe.Email;

                    _context.Update(existingEmployee);
                    await _context.SaveChangesAsync();



                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmployeExists(employe.EmployeId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(employe);
        }

        private bool EmployeExists(int id)
        {
            return (_context.Employe?.Any(e => e.EmployeId == id)).GetValueOrDefault();
        }
    }

}
