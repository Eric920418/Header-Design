( function( $ ) {
    'use strict';
    $( document ).ready(function() {
        $('li.setup-theme').hide();

        $('select[name ="setup-theme"]').each( function (e) {
            var setup_value = $("option:selected", this).val();
            if(setup_value == 'profile'){
                $('li.profile').show();
            }else{
                $('li.custom_theme').show();
            }
        });

        $('select[name ="setup-theme"]').on('change', function (e) {
            var setup_value = $("option:selected", this).val();

            if(setup_value == 'profile'){
                $('li.profile').show();
                $('li.custom_theme').hide();
            }else{
                $('li.custom_theme').show();
                $('li.profile').hide();
            }
        });
    });

})( jQuery );

