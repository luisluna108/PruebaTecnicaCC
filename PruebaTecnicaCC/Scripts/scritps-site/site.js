toastr.options = {
    progressBar: true
};

function initSelect2(selector, url, callbackResult, extraParam, tags) {
    $(selector).select2({
        language: 'es',
        ajax: {
            type: 'GET',
            url: url,
            dataType: 'json',
            delay: 500, // wait 500 milliseconds before triggering the request
            data: function (params) {
                var query = {
                    search: params.term,
                    page: params.page || 1,
                    _type: params._type,
                    extraParam: extraParam || null
                };

                return query;
            },
            processResults: function (data, params) {
                params.page = params.page || 1;

                return {
                    results: data.results,
                    pagination: {
                        more: (params.page * 10) < data.count_filtered
                    }
                };
            },
            cache: true,
        },
        placeholder: "Selecciona una materia...",
        allowClear: true,
        templateResult: callbackResult || function (result) {
            return result.text;
        },
        tags: tags || false,
        createTag: function (params) {
            var term = $.trim(params.term);

            if (term === '') {
                return null;
            }

            $("#IsNew" + selector.replace("#", "")).remove();
            $(selector).closest("form").append("<input type='hidden' id='IsNew" + selector.replace("#", "") + "' name='IsNew" + selector.replace("#", "") + "' value='True' />");

            return {
                id: term,
                text: term,
                newTag: true // add additional parameters
            };
        }
    });
}
