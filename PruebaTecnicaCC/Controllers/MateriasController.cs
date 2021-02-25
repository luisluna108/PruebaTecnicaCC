using DAL.Data;
using DAL.Model;
using DAL.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace PruebaTecnicaCC.Controllers
{
    public class MateriasController : Controller
    {
        ApplicationDbContext context = new ApplicationDbContext();

        // GET: Materias
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<JsonResult> GetAllMaterias(DataTableJS request)
        {
            var FilterId = 0;
            var keyword = request.Search.Value ?? string.Empty;

            var query = context.Database.SqlQuery<Materias>("SP_Select_Materias @FilterN, @FilterId",
                new SqlParameter("@FilterN", keyword),
                new SqlParameter("@FilterId", FilterId)).ToList();

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
                    nombre = e.Nombre,
                    fechaInscripcion = e.FechaInscripcion.ToString("dd/MM/yyyy HH:mm:ss"),
                    duracionCurso = e.DuracionCurso + " Meses",
                    finalCurso = e.FinalCurso.ToString("dd/MM/yyyy HH:mm:ss")
                })
            });
        }

        [HttpGet]
        public ActionResult CreateMateria()
        {
            return View();
        }

        [HttpPost]
        public JsonResult CreateMateria(Materias alumnos)
        {
            if (!ModelState.IsValid)
                return Json(false, JsonRequestBehavior.AllowGet);

            context.Database.ExecuteSqlCommand("exec SP_Create_Materia @Nombre, @FechaInscripcion, @DuracionCurso, @FinalCurso",
                           new SqlParameter("@Nombre", alumnos.Nombre),
                           new SqlParameter("@FechaInscripcion", alumnos.FechaInscripcion),
                           new SqlParameter("@DuracionCurso", alumnos.DuracionCurso),
                           new SqlParameter("@FinalCurso", alumnos.FinalCurso));

            return Json(true, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult DetailsMateria(int Id)
        {

            var query = context.Database.SqlQuery<Materias>("SP_Select_Materias @FilterN, @FilterId",
                new SqlParameter("@FilterN", string.Empty),
                new SqlParameter("@FilterId", Id)).ToList();

            Materias materia = new Materias { 
                Id = Id,
                Nombre = query[0].Nombre,
                FechaInscripcion = query[0].FechaInscripcion,
                DuracionCurso = query[0].DuracionCurso,
                FinalCurso = query[0].FinalCurso
            };


            return View(materia);
        }
    }
}