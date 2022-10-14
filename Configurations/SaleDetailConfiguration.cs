using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebinarApiRest.Entities;

namespace WebinarApiRest.Configuations;

public class SaleDetailConfiguration : IEntityTypeConfiguration<SaleDetail>
{
    public void Configure(EntityTypeBuilder<SaleDetail> builder)
    {
        builder.Property(p => p.Quantity)
            .HasPrecision(11, 2);

        builder.Property(p => p.UnitPrice)
            .HasPrecision(11, 2);

        builder.Property(p => p.TotalPrice)
            .HasPrecision(11, 2);
    }
}