using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace SistemiEvaluation.Models
{
    public class SliderUploadVM
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string LinkText { get; set; }

        [Required]
        public string LinkUrl { get; set; }
     
        public string  Image { get; set; }

    }
}
