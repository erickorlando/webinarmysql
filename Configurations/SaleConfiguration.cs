using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebinarApiRest.Entities;

namespace WebinarApiRest.Configuations;

public class SaleConfiguration : IEntityTypeConfiguration<Sale>
{
    public void Configure(EntityTypeBuilder<Sale> builder)
    {
        builder.Property(p => p.TotalSale)
            .HasPrecision(11, 2);

        builder.Property(p => p.SaleNumber)
            .HasMaxLength(20);
    }
}