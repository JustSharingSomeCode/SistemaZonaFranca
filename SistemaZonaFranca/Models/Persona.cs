using System.ComponentModel.DataAnnotations;

namespace SistemaZonaFranca.Models
{
    public class Persona
    {
        [Key]
        [MaxLength(50)]
        public string Cedula { get; set; } = string.Empty;

        [Required]
        [MaxLength(50)]
        public string Nombre { get; set; } = string.Empty;

        [Required]
        [MaxLength(50)]
        public string Apellido { get; set; } = string.Empty;

        [Required]
        public string Telefono { get; set; } = string.Empty;

        [Required]
        public int Edad { get; set; }
    }
}
