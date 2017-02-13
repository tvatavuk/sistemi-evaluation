using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace SistemiEvaluation.Models
{
    public class SliderVM
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

        [Required]
        public string Image { get; set; }
        // public byte?[] ImageBytes { get; set; }
    }
}
