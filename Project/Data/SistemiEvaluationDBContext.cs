using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using SistemiEvaluation.Entities;

namespace SistemiEvaluation.Data
{
    public class SistemiEvaluationDBContext: IdentityDbContext<ApplicationUser>
    {
        public virtual DbSet<Content> Content { get; set; }
        public virtual DbSet<Slider> Slider { get; set; }
        public SistemiEvaluationDBContext(DbContextOptions<SistemiEvaluationDBContext> options) : base(options) { } // ovo je generičan kod uvik se piše na isti način

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

        }
    }
}
