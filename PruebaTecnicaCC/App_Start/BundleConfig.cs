using System.Web;
using System.Web.Optimization;

namespace PruebaTecnicaCC
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Utilice la versión de desarrollo de Modernizr para desarrollar y obtener información. De este modo, estará
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                       "~/Scripts/datatable.js"));

            bundles.Add(new ScriptBundle("~/bundles/toastrJs").Include(
                       "~/Scripts/toastr.js"));

            bundles.Add(new ScriptBundle("~/bundles/scritps-site").Include(
                      "~/Scripts/scritps-site/alumno/alumno.js",
                      "~/Scripts/scritps-site/materia/materia.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/datatable.css"));

            bundles.Add(new StyleBundle("~/Content/toastr").Include(
                     "~/Content/toastr.css"));

            bundles.Add(new StyleBundle("~/Content/fontawesome").Include(
                "~/Content/fontawesome-all.css"));
            
            bundles.Add(new ScriptBundle("~/bundles/moment-datepickerJs").Include(
                "~/Scripts/moment.js",
                "~/Scripts/moment-datepicker.js"));

            bundles.Add(new StyleBundle("~/Content/moment-datepickerCss").Include(
                "~/Content/moment-datepicker/datepicker.css"));

            bundles.Add(new StyleBundle("~/Content/select2Css").Include(
               "~/Content/css/select2.min.css"));

            bundles.Add(new ScriptBundle("~/bundles/select2JS").Include(
                "~/Scripts/select2.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/i18nJS").Include(
               "~/Scripts/i18n/es.js"));

            bundles.Add(new ScriptBundle("~/bundles/siteJS").Include(
                "~/Scripts/scritps-site/site.js"));

        }
    }
}
