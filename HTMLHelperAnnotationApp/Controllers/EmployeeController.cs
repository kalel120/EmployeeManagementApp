using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using HTMLHelperAnnotationApp.Models;

namespace HTMLHelperAnnotationApp.Controllers {
    public class EmployeeController : Controller {
        private EmployeDBContext db = new EmployeDBContext();
        public ActionResult Index() {
            return View(db.Employees.ToList());
        }
        public ActionResult Details(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null) {
                return HttpNotFound();
            }
            return View(employee);
        }
        public ActionResult Create() {
            ViewBag.Items = GetDepartment();
            return View();
        }
        private List<SelectListItem> GetDepartment() {
            List<SelectListItem> items = new List<SelectListItem> {
                new SelectListItem {Text = "--Select List--",Value = ""},
                new SelectListItem {Text = "Human Resource", Value = "HR"},
                new SelectListItem {Text = "Software Development", Value = "SR"},
                new SelectListItem {Text = "Project Manager", Value = "PM"},
                new SelectListItem {Text = "Managing Director", Value = "MD"}
            };
            return items;
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee employee) {
            if (ModelState.IsValid) {
                ViewBag.Items = GetDepartment();
                db.Employees.Add(employee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(employee);
        }
        public ActionResult Edit(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null) {
                return HttpNotFound();
            }
            return View(employee);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Employee employee) {
            if (ModelState.IsValid) {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employee);
        }
        public ActionResult Delete(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = db.Employees.Find(id);
            if (employee == null) {
                return HttpNotFound();
            }
            return View(employee);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id) {
            Employee employee = db.Employees.Find(id);
            db.Employees.Remove(employee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing) {
            if (disposing) {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
