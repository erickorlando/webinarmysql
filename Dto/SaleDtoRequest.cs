namespace WebinarApiRest.Dto;

public record SaleDtoRequest(int CustomerId, ICollection<SaleDetailDtoRequest> Details);

public record SaleDetailDtoRequest(int ProductId, decimal Quantity, decimal UnitPrice);