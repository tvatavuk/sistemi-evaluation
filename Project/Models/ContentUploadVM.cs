using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace SistemiEvaluation.Models
{
    public class ContentUploadVM
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }
     
        public string  Image { get; set; }

    }
}
