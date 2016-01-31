using System.Web.Mvc;

namespace HTMLHelperAnnotationApp.Controllers {
    public class HomeController : Controller {
        public ActionResult Index() {
            return View();
        }

        public ActionResult About() {
            ViewBag.Message = "This is About Page";
            return View();
        }

        public ActionResult Contact() {
            ViewBag.Message = "This is Contact Page";
            return View();
        }
    }
}