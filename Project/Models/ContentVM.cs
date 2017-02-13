using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemiEvaluation.Models
{
    public class ContentVM
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

        [Required]
        public string Image { get; set; }
        //[Required]
        //public string GmapLat { get; set; }

        //[Required]
        //public string GmapLng { get; set; }
    }
}
