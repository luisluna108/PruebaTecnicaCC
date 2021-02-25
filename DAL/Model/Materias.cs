using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Model
{
    public class Materias
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        [Display(Name = "Fecha Inscripción")]
        public DateTime FechaInscripcion { get; set; }
        [Required]
        [Display(Name = "Duración Curso")]
        public int DuracionCurso { get; set; }
        [Required]
        [Display(Name = "Final Curso")]
        public DateTime FinalCurso { get; set; }
    }
}
