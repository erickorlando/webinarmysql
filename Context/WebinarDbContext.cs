using System.Reflection;
using Microsoft.EntityFrameworkCore;

namespace WebinarApiRest;

public class WebinarDbContext : DbContext
{
    public WebinarDbContext(DbContextOptions<WebinarDbContext> options)
        :base(options)
    {
        
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
    }
}