using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class FacturaDetalle
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int FacturaId { get; set; }

        [Required]
        public int InventarioId { get; set; }

        [Required]
        public int Cantidad { get; set; }

        [Required]
        [Column(TypeName = "money")]
        public decimal SubTotal { get; set; }

        [ForeignKey("FacturaId")]
        public virtual Factura? Factura { get; set; }

        [ForeignKey("InventarioId")]
        public virtual Inventario? Inventario { get; set; }
    }
}
