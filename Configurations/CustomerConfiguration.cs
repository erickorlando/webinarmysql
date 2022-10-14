using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebinarApiRest.Entities;

namespace WebinarApiRest.Configuations;

public class CustomerConfiguration : IEntityTypeConfiguration<Customer>
{
    public void Configure(EntityTypeBuilder<Customer> builder)
    {
        // Fluent API
        builder.Property(p => p.FirstName)
            .HasMaxLength(100);

        builder.Property(p => p.LastName)
            .HasMaxLength(100);


        builder.HasData(new List<Customer>(){
            new Customer { Id = 1, FirstName = "Erick", LastName = "Orlando", Age = 37},
            new Customer { Id = 2, FirstName = "Bill", LastName = "Gates", Age = 68},
            new Customer { Id = 3, FirstName = "Mark", LastName = "Zuckeberg", Age = 35},
        });
    }
}