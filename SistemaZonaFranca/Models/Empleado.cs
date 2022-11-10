using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class Empleado
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(50)]
        public string PersonaId { get; set; } = string.Empty;

        [Required]
        [MaxLength(50)]
        public string Cargo { get; set; } = string.Empty;

        [Required]
        [Column(TypeName = "money")]
        public decimal Salario { get; set; }


        [ForeignKey("PersonaId")]
        public virtual Persona? Persona { get; set; }
    }
}
