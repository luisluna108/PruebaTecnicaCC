var MateriaTable;

$('#FechaInscripcion').datepicker({
    uiLibrary: 'bootstrap4',
    locale: 'es-es',
    format: 'YYYY/MM/DD'
});

$('#FinalCurso').datepicker({
    uiLibrary: 'bootstrap4',
    locale: 'es-es',
    format: 'YYYY/MM/DD'
});

$("#FechaInscripcion").change(function () {

    var duracionCurso = parseInt($('#DuracionCurso').val());
    var fechaInscripcion = moment($("#FechaInscripcion").val());

    $("#FinalCurso").val("");

    if (duracionCurso > 0)
        fechaInscripcion.add(duracionCurso, 'month');

    $("#FinalCurso").val(fechaInscripcion.format('YYYY/MM/DD'));
});

$("#DuracionCurso").change(function () {

    var duracionCurso = parseInt($('#DuracionCurso').val());
    var fechaInscripcion = moment($("#FechaInscripcion").val());

    $("#FinalCurso").val("");

    if (fechaInscripcion != "") {
        if (duracionCurso > 0)
            fechaInscripcion.add(duracionCurso, 'month');
    }
   

    $("#FinalCurso").val(fechaInscripcion.format('YYYY/MM/DD'));
});

LoadGridMateria();


function LoadGridMateria() {
    MateriaTable = $('#MateriaTable').DataTable(
        {
            "processing": true,
            "serverSide": true,
            "searching": true,
            "responsive": true,
            "ajax": {
                "url": baseUrl + "Materias/GetAllMaterias",
                "type": "POST"
                //"data": function (data) {
                //    data.User = $('#SelectUSer').text();
                //}
            },
            "columns": [
                {
                    "visible": false,
                    class: "id",
                    id: "IdMateria",
                    "targets": 0,
                    "orderable": false,
                    "data": "id"
                },
                {
                    //"width": "10%",
                    class: "nombre",
                    "targets": 1,
                    "orderable": false,
                    "data": "nombre"
                },
                {
                    class: "fechaInscripcion",
                    "targets": 2,
                    "orderable": false,
                    "data": "fechaInscripcion"
                },
                {
                    class: "duracionCurso",
                    "targets": 3,
                    "orderable": false,
                    "data": "duracionCurso"
                },
                {
                    "targets": 4,
                    "orderable": false,
                    class: "finalCurso",
                    "data": "finalCurso"
                },
                {
                    "width": "15%",
                    "targets": 5,
                    "orderable": false,
                    "data": null,
                    "mData": "id",
                    "mRender": function (data, type, row) {
                        return "<button class='btn btn-default' onclick='DetailsMateria(" + data.id + ")' style='cursor:pointer'><i class='fas fa-info-circle'></i> Reporte </button>";

                    }
                }
            ],
            "oLanguage": {
                "sSearch": "Buscar por Nombre: ",
                "sLengthMenu": "Mostrar _MENU_ ",
                "sEmptyTable": "NO EXISTE NINGUN REGISTRO",
                "sInfo": "Resultados _START_ De  _END_  Total  _TOTAL_",
                "sZeroRecords": "NO EXISTE NINGUN REGISTRO",
                "oPaginate": { "sNext": "Siguiente", "sPrevious": "Anterior" }
            },


        }
    );
};

function SaveMateria() {
    var Nombre = $('#Nombre').val();
    var FechaInscripcion = $('#FechaInscripcion').val();
    var DuracionCurso = $('#DuracionCurso').val();
    var FinalCurso = $('#FinalCurso').val();

    $.post(baseUrl + "Materias/CreateMateria", { Nombre: Nombre, FechaInscripcion: FechaInscripcion, DuracionCurso: DuracionCurso, FinalCurso: FinalCurso }, function (response) {
        if (response) {
            toastr.success("Datos gurdados exitosamente!", "Crear Materia");
            setTimeout(function () { window.location.href = baseUrl + "Materias/Index" }, 5000);
        }
        else
            toastr.error("Datos incompletos", "Error");

    });
}

function DetailsMateria(Id) {
    window.location.href = baseUrl + "Materias/DetailsMateria?Id=" + Id;
    AlumnoTable.draw;
}
