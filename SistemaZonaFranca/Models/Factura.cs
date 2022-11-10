using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class Factura
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string PersonaId { get; set; } = string.Empty;

        [Required]
        [MaxLength(30)]
        public string Estado { get; set; } = string.Empty;


        [ForeignKey("PersonaId")]
        public virtual Persona? Persona { get; set; }
    }
}
