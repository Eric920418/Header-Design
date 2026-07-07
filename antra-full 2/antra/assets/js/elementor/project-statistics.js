(function ($) {
    "use strict";
    $.fn.getGridData = function() {
        // calc computed style
        const gridComputedStyle = window.getComputedStyle(this[0]);

        return {
            gridRowCount: gridComputedStyle.getPropertyValue("grid-template-rows").split(" ").length,
            gridColumnCount: gridComputedStyle.getPropertyValue("grid-template-columns").split(" ").length,
            gridRowSizes: gridComputedStyle.getPropertyValue("grid-template-rows").split(" ").map(parseFloat),
            gridColumnSizes: gridComputedStyle.getPropertyValue("grid-template-columns").split(" ").map(parseFloat)
        }
    };
    
    $.fn.updateGridBorder = function(showLast = false) {
        // this.css('overflow-x', 'clip');
        this.addClass('antra-grid-border');
        var gridData = this.getGridData(),
            gridColumnCount = gridData.gridColumnCount,
            gridRowCount = gridData.gridRowCount,
            items = this.children(),
            countItems = items.length;

        if (!this.closest('.elementor-widget').length) {
            showLast = true;
        }
    
        items.removeClass('divider-right');
        items.removeClass('divider-bottom');
        // items.addClass('grid-divider-item');
        items.each(function(i) {
            var ele = $(this);
            if (!ele.hasClass('grid-divider-item')) {
                $(this).wrap('<div class="grid-divider-item"></div>');
                ele = $(this).parent('.grid-divider-item');
            }
            var index = i+1;
            if(index % gridColumnCount !== 0) {
                // if (index != countItems) {
                // }
                ele.addClass('divider-right');
            }

            var lastItems = gridColumnCount * (gridRowCount - 1);
            if (showLast) {
                ele.addClass('divider-bottom');
            } else {
                if(index <= lastItems) {
                    ele.addClass('divider-bottom');
                }
            }
        })
    };

    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            if ($element.hasClass('show-divider-yes')) {
                // Update Grid Border
                let tgGrid = $element.find('.elementor-grid');
                if (tgGrid.length) {
                    tgGrid.each(function() {
                        $(this).updateGridBorder();
                    })
                    $(window).on('resize', function() {
                        let tgGrid = $element.find('.elementor-grid');
                        tgGrid.each(function() {
                            $(this).updateGridBorder();
                        })
                    })
                }
            }
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-project-statistics.default', addHandler);
    });
})(jQuery);

