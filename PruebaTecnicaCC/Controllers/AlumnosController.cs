using DAL.Data;
using DAL.Model.ViewModels;
using DAL.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity.Infrastructure;
using System.Threading.Tasks;
using System.Data.SqlClient;
using DAL.Model;

namespace PruebaTecnicaCC.Controllers
{
    public class AlumnosController : Controller
    {

        ApplicationDbContext context = new ApplicationDbContext();

        // GET: Alumnos
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> GetAllAlumnos(DataTableJS request, int idMateria = 0, int idAlumno = 0)
        {
            var keyword = request.Search.Value ?? string.Empty;

            var query = context.Database.SqlQuery<Alumnos>("SP_Select_Alumnos @FilterNP, @FilterIdMateria, @FilterIdAlumno",
              new SqlParameter("@FilterNP", keyword),
               new SqlParameter("@FilterIdMateria", idMateria),
               new SqlParameter("@FilterIdAlumno", idAlumno)).ToList();

            var recordsTotal = query.Count();

            var result = query.Skip(request.Start).Take(request.Length).AsQueryable();

            return Json(new
            {
                draw = request.Draw,
                recordsTotal = recordsTotal,
                recordsFiltered = recordsTotal,
                data = result.Select(e => new
                {
                    id = e.Id,
                    nombreAlumno = e.Nombre,
                    apellidoAlumno = e.Apellido,
                    fechaNacimiento = e.FechaNacimiento.ToString("dd/MM/yyyy HH:mm:ss"),
                    genero = e.Genero == true ? "Masculino" : "Femenino",
                    idMateriaAlumno = e.IdMateria
                })
            });
        }

        [HttpGet]
        public ActionResult CreateAlumno()
        {
            List<SelectListItem> materiasList = context.Materias.AsNoTracking()
                               .OrderBy(n => n.Nombre)
                                   .Select(n =>
                                   new SelectListItem
                                   {
                                       Value = n.Id.ToString(),
                                       Text = n.Nombre
                                   }).ToList();

            ViewData["MateriaList"] = materiasList;

            return View();
        }

        [HttpPost]
        public JsonResult CreateAlumno(Alumnos alumnos)
        {
            if (!ModelState.IsValid)
                return Json(false, JsonRequestBehavior.AllowGet);

            context.Database.ExecuteSqlCommand("exec SP_Create_Alumno @Nombre, @Apellido, @FechaNacimiento, @Genero, @IdMaterias",
                           new SqlParameter("@Nombre", alumnos.Nombre),
                           new SqlParameter("@Apellido", alumnos.Apellido),
                           new SqlParameter("@FechaNacimiento", alumnos.FechaNacimiento),
                           new SqlParameter("@Genero", alumnos.Genero),
                           new SqlParameter("@IdMaterias", alumnos.IdMateria));

            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult DetailsAlumno(int Id)
        {
            var FilterIdMateria = 0;

            var query = context.Database.SqlQuery<AlumnoMateriaViewModel>("SP_Select_Alumnos @FilterNP, @FilterIdMateria, @FilterIdAlumno",
               new SqlParameter("@FilterNP", string.Empty),
                new SqlParameter("@FilterIdMateria", FilterIdMateria),
                new SqlParameter("@FilterIdAlumno", Id)).ToList();

            return Json(new
            {
                data = query.Select(e => new
                {
                    id = e.Id,
                    nombreAlumno = e.NombreAlumno,
                    apellidoAlumno = e.ApellidoAlumno,
                    fechaNacimiento = e.FechaNacimiento.ToString("dd/MM/yyyy HH:mm:ss"),
                    genero = e.Genero,
                    nombreMateria = e.NombreMateria
                }
            )}, JsonRequestBehavior.AllowGet);
        }

    }
}