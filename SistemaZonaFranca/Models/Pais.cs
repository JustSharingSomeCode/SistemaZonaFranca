﻿using System.ComponentModel.DataAnnotations;

namespace SistemaZonaFranca.Models
{
    public class Pais
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(30)]
        public string Nombre { get; set; } = string.Empty;
    }
}
