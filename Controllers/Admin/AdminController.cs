using CSM.Data;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CSM.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly SignInManager<IdentityUser> _signInManager;
        public AdminController(ApplicationDbContext context, SignInManager<IdentityUser> signInManager)
        {
            _context = context;
            _signInManager = signInManager;
        }
        
        public IActionResult Index()
        {

            return View();
        }
        [AllowAnonymous]
        public IActionResult Logout()
        {
             _signInManager.SignOutAsync();

            // Redirect to the home page after logout
            return RedirectToAction("Index", "Home");
        }
    }


}
