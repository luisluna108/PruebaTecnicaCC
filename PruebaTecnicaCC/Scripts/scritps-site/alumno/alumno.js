var AlumnoTable;

$('.js-example-basic-single').select2();

LoadGridAlumno();

initSelect2("#IdMaterias", baseUrl + "Alumnos/MateriasList");

$('#FechaNacimiento').datepicker({
    uiLibrary: 'bootstrap4',
    locale: 'es-es',
    format: 'YYYY/MM/DD'
});

function LoadGridAlumno() {
    AlumnoTable = $('#AlumnoTable').DataTable(
        {
            "search": true,
            "searching": true,
            "bLengthChange": true, //oculta el lengtmenu
            "info": true,//oculta el sInfo
            "pageLength": 10,
            "processing": true,
            "serverSide": true,
            "responsive": true,
            "ajax": {
                "url": baseUrl + "Alumnos/GetAllAlumnos",
                "type": "POST",
                "data": function (data) {
                    data.idMateria = $('#IdMateria').val();
                }
            },
            "columns": [
                {
                    "visible": false,
                    class: "id",
                    "targets": 0,
                    "orderable": false,
                    "data": "id"
                },
                {
                    //"width": "10%",
                    class: "nombreAlumno",
                    "targets": 1,
                    "orderable": false,
                    "data": "nombreAlumno"
                },
                {
                    class: "apellidoAlumno",
                    "targets": 2,
                    "orderable": false,
                    "data": "apellidoAlumno"
                },
                {
                    class: "fechaNacimiento",
                    "targets": 3,
                    "orderable": false,
                    "data": "fechaNacimiento"
                },
                {
                    "targets": 4,
                    "orderable": false,
                    class: "genero",
                    "data": "genero"
                },
                {
                    "visible": false,
                    "targets": 5,
                    "orderable": false,
                    class: "idMateriaAlumno",
                    "data": "idMateriaAlumno"
                },
                {
                    class: "opcionesAlumno",
                    "width": "15%",
                    "targets": 6,
                    "orderable": false,
                    "data": null,
                    "mData": "id",
                    "mRender": function (data, type, row) {
                        return "<button class='btn btn-default' onclick='DetailsAlumno(" + data.id + ")'><i class='fas fa-info-circle'></i> Detalles </button>";

                    }
                }
            ],
            "oLanguage": {
                "sSearch": "Buscar por Nombre o Apellido: ",
                "sLengthMenu": "Mostrar _MENU_ ",
                "sEmptyTable": "NO EXISTE NINGUN REGISTRO",
                "sInfo": "Resultados _START_ De  _END_  Total  _TOTAL_",
                "sZeroRecords": "NO EXISTE NINGUN REGISTRO",
                "oPaginate": { "sNext": "Siguiente", "sPrevious": "Anterior" }
            },


        }
    );
};

function SaveAlumno() {
    var Nombre = $('#Nombre').val();
    var Apellido = $('#Apellido').val();
    var FechaNacimiento = $('#FechaNacimiento').val();
    var Genero = $('input:radio[name=Genero]:checked').val();
    var IdMaterias = $('#IdMaterias').val();

    $.post(baseUrl + "Alumnos/CreateAlumno", { Nombre: Nombre, Apellido: Apellido, FechaNacimiento: FechaNacimiento, Genero: Genero, IdMateria: IdMaterias }, function (response) {
        if (response) {
            toastr.success("Datos gurdados exitosamente!", "Crear Alumno");
            setTimeout(function () { window.location.href = baseUrl + "Alumnos/Index" }, 5000);
        } else
            toastr.error("Datos incompletos", "Error");
    });
}

function DetailsAlumno(Id) {
    $.get(baseUrl + "Alumnos/DetailsAlumno", { Id: Id }, function (response) {

        $('#NombreAlumnoDetalle').val(response.data[0].nombreAlumno);
        $('#ApellidoAlumnoDetalle').val(response.data[0].apellidoAlumno);
        $('#FechaNacimientoDetalle').val(response.data[0].fechaNacimiento);
        $('#NombreMateriaDetalle').val(response.data[0].nombreMateria);

        if (response.data[0].genero)
            $("#GeneroMDetalle").prop("checked", true);
        else
            $("#GeneroFDetalle").prop("checked", true);

        $('#alumnoDetailsModal').modal('show');
    });
    //window.location.href = baseUrl + "Alumnos/DetailsAlumno?Id=" + Id;

}
