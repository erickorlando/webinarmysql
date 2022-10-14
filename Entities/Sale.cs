namespace WebinarApiRest.Entities;

public class Sale : EntityBase
{
    public Customer Customer { get; set; } = default!;
    public int CustomerId { get; set; }
    public DateTime SaleDate { get; set; }
    public string SaleNumber { get; set; } = default!;
    public decimal TotalSale { get; set; }
}