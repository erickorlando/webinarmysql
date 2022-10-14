namespace WebinarApiRest.Entities;

public class Customer  : EntityBase
{
    public string FirstName { get; set; } = default!;
    public string LastName { get; set; } = default!;
    public int Age { get; set; } 
}