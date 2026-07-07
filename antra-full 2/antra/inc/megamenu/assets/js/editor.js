(function ($) {
    $(document).on('click', '#elementor-panel-footer-back-to-admin', function (e) {
        if ($(window.parent).length == 1 && window.parent.antra_menu_modal !== undefined) {
            window.parent.antra_menu_modal.model.set('edit_submenu', false);
        }
    });

    $('#tmpl-elementor-panel-footer-content').remove();
})(jQuery);
