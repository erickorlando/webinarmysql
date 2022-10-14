namespace WebinarApiRest.Entities;

public class Product : EntityBase
{
    public string Code { get; set; } = default!;
    public string Description { get; set; } = default!;
    public decimal UnitPrice { get; set; }
}