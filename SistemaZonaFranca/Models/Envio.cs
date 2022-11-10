using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SistemaZonaFranca.Models
{
    public class Envio
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int FacturaId { get; set; }

        [Required]
        public int CiudadOrigenId { get; set; }

        [Required]
        [MaxLength(50)]
        public string DireccionOrigen { get; set; } = string.Empty;

        [Required]
        public int CiudadDestinoId { get; set; }

        [Required]
        [MaxLength(50)]
        public string DireccionDestino { get; set; } = string.Empty;

        [Required]
        public DateTime FechaEntrega { get; set; }

        [Required]
        [MaxLength(30)]
        public string Estado { get; set; } = string.Empty;


        [ForeignKey("FacturaId")]
        public virtual Factura? Factura { get; set; }

        [ForeignKey("CiudadOrigenId")]
        public virtual Ciudad? CiudadOrigen { get; set; }

        [ForeignKey("CiudadDestinoId")]
        public virtual Ciudad? CiudadDestino { get; set; }
    }
}
