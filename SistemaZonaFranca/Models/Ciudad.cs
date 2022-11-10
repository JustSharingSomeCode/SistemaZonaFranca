using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class Ciudad
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(30)]
        public string Nombre { get; set; } = string.Empty;

        [Required]
        public int PaisId { get; set; }

        [ForeignKey("PaisId")]
        public virtual Pais? Pais { get; set; }
    }
}
