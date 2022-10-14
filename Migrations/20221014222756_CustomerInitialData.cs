using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebinarApiRest.Migrations
{
    public partial class CustomerInitialData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Customer",
                columns: new[] { "Id", "Age", "FirstName", "LastName" },
                values: new object[] { 1, 37, "Erick", "Orlando" });

            migrationBuilder.InsertData(
                table: "Customer",
                columns: new[] { "Id", "Age", "FirstName", "LastName" },
                values: new object[] { 2, 68, "Bill", "Gates" });

            migrationBuilder.InsertData(
                table: "Customer",
                columns: new[] { "Id", "Age", "FirstName", "LastName" },
                values: new object[] { 3, 35, "Mark", "Zuckeberg" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Customer",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Customer",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Customer",
                keyColumn: "Id",
                keyValue: 3);
        }
    }
}
