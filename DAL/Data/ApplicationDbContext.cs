using DAL.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("DefaultConnection")
        {

        } 

        public DbSet<Alumnos> Alumnos { get; set; }
        public DbSet<Materias> Materias { get; set; }

    }
}
