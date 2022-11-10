using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SistemaZonaFranca.Migrations
{
    /// <inheritdoc />
    public partial class RelacionesFaltantes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_FacturaDetalles_FacturaId",
                table: "FacturaDetalles",
                column: "FacturaId");

            migrationBuilder.CreateIndex(
                name: "IX_FacturaDetalles_InventarioId",
                table: "FacturaDetalles",
                column: "InventarioId");

            migrationBuilder.CreateIndex(
                name: "IX_Envios_CiudadDestinoId",
                table: "Envios",
                column: "CiudadDestinoId");

            migrationBuilder.CreateIndex(
                name: "IX_Envios_CiudadOrigenId",
                table: "Envios",
                column: "CiudadOrigenId");

            migrationBuilder.CreateIndex(
                name: "IX_Envios_FacturaId",
                table: "Envios",
                column: "FacturaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Envios_Ciudades_CiudadDestinoId",
                table: "Envios",
                column: "CiudadDestinoId",
                principalTable: "Ciudades",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Envios_Ciudades_CiudadOrigenId",
                table: "Envios",
                column: "CiudadOrigenId",
                principalTable: "Ciudades",
                principalColumn: "Id",
                onDelete: ReferentialAction.NoAction);

            migrationBuilder.AddForeignKey(
                name: "FK_Envios_Facturas_FacturaId",
                table: "Envios",
                column: "FacturaId",
                principalTable: "Facturas",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FacturaDetalles_Facturas_FacturaId",
                table: "FacturaDetalles",
                column: "FacturaId",
                principalTable: "Facturas",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FacturaDetalles_Inventarios_InventarioId",
                table: "FacturaDetalles",
                column: "InventarioId",
                principalTable: "Inventarios",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Envios_Ciudades_CiudadDestinoId",
                table: "Envios");

            migrationBuilder.DropForeignKey(
                name: "FK_Envios_Ciudades_CiudadOrigenId",
                table: "Envios");

            migrationBuilder.DropForeignKey(
                name: "FK_Envios_Facturas_FacturaId",
                table: "Envios");

            migrationBuilder.DropForeignKey(
                name: "FK_FacturaDetalles_Facturas_FacturaId",
                table: "FacturaDetalles");

            migrationBuilder.DropForeignKey(
                name: "FK_FacturaDetalles_Inventarios_InventarioId",
                table: "FacturaDetalles");

            migrationBuilder.DropIndex(
                name: "IX_FacturaDetalles_FacturaId",
                table: "FacturaDetalles");

            migrationBuilder.DropIndex(
                name: "IX_FacturaDetalles_InventarioId",
                table: "FacturaDetalles");

            migrationBuilder.DropIndex(
                name: "IX_Envios_CiudadDestinoId",
                table: "Envios");

            migrationBuilder.DropIndex(
                name: "IX_Envios_CiudadOrigenId",
                table: "Envios");

            migrationBuilder.DropIndex(
                name: "IX_Envios_FacturaId",
                table: "Envios");
        }
    }
}
