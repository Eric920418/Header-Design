(function ($) {
	'use strict';
	$(window).load(function(){
		var addPageCustomCss = function () {
			var customCSS = elementor.settings.page.model.get('custom_css');

			if (customCSS) {
				customCSS = customCSS.replace(/selector/g, '.elementor-page-' + elementor.config.document.id);
				elementor.settings.page.controlsCSS.elements.$stylesheetElement.append(customCSS);
			}
		};

		var addCustomCss = function (css, context) {
			if (!context) {
				return;
			}

			var model = context.model,
				customCSS = model.get('settings').get('custom_css');
			var selector = '.elementor-element.elementor-element-' + model.get('id');

			if ('document' === model.get('elType')) {
				selector = elementor.config.document.settings.cssWrapperSelector;
			}

			if (customCSS) {
				css += customCSS.replace(/selector/g, selector);
			}
			return css;
		};

		elementor.hooks.addFilter('editor/style/styleText', addCustomCss);
		elementor.settings.page.model.on('change', addPageCustomCss);
		elementor.on('preview:loaded', addPageCustomCss);
	})

})(jQuery);
