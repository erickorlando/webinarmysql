namespace WebinarApiRest.Entities;

public class SaleDetail : EntityBase
{
    public Sale Sale { get; set; } = default!;
    public int SaleId { get; set; }
    public Product Product { get; set; } = default!;
    public int ProductId { get; set; }
    public decimal Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public decimal TotalPrice { get; set; }
}