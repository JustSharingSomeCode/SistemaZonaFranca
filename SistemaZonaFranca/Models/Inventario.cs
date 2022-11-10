using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class Inventario
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string Nombre { get; set; } = string.Empty;

        [Required]
        [MaxLength(150)]
        public string Descripcion { get; set; } = string.Empty;

        [Required]
        public int Stock { get; set; }

        [Required]
        [Column(TypeName = "money")]
        public decimal Precio { get; set; }
    }
}
