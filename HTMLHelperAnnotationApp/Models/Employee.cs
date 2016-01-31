using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HTMLHelperAnnotationApp.Models {
    public class Employee {
        public int Id { get; set; }
        [Required(ErrorMessage = "Provide your name")]
        [DisplayName("Employee Name")]
        [StringLength(20,MinimumLength = 5, ErrorMessage = "Name should between 5 and 20 character")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Provide Email address")]
        [DisplayName("Email Address")]
        [RegularExpression(@"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",ErrorMessage = "Please Enter a valid email address")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Select Gender")]
        public string Gender { get; set; }
        [Required(ErrorMessage = "Provide Address")]
        [StringLength(200,ErrorMessage = "Address should be between 200 characters")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Select Department")]
        public string Depratment { get; set; }
        [Required(ErrorMessage = "Provide password")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Provide password")]
        [DisplayName("Confirm Password")]
        [Compare("Password")]
        [NotMapped]
        public string ConfirmPassword { get; set; }
    }
}