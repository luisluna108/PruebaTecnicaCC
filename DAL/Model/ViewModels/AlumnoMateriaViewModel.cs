using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Model.ViewModels
{
    public class AlumnoMateriaViewModel
    {
        public int Id { get; set; }
        [Display(Name = "Nombre")]
        public string NombreAlumno { get; set; }
        [Display(Name = "Apellido")]
        public string ApellidoAlumno { get; set; }
        [Display(Name = "Fecha Nacimiento")]
        public DateTime FechaNacimiento { get; set; }
        public bool Genero { get; set; }
        public int IdMaterias { get; set; }
        public string NombreMateria { get; set; }
    }
}
