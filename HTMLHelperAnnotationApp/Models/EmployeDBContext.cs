using System.Data.Entity;

namespace HTMLHelperAnnotationApp.Models {
    public class EmployeDBContext : DbContext {
        public DbSet<Employee> Employees { get; set; }
    }
}