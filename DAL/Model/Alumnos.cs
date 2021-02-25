using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Model
{
    public class Alumnos
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        [Display(Name = "Fecha Nacimiento")]
        public DateTime FechaNacimiento { get; set; }
        [Required]
        public bool Genero { get; set; }
        [Display(Name = "Materias")]
        public int IdMateria { get; set; }

        [ForeignKey(nameof(IdMateria))]
        public Materias Materias { get; set; }
    }
}
