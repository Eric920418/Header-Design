(function ($, elementorFrontend, elementorModules) {
    'use strict';
    var _sticky = elementorModules.frontend.handlers.Base.extend({
        currentConfig: {},
        debouncedReactivate: null,
        bindEvents() {
            elementorFrontend.addListenerOnce(this.getUniqueHandlerID() + 'sticky', 'resize', this.reactivateOnResize);
        },
        unbindEvents() {
            elementorFrontend.removeListeners(this.getUniqueHandlerID() + 'sticky', 'resize', this.reactivateOnResize);
        },
        isStickyInstanceActive() {
            return undefined !== this.$element.data('sticky');
        },
        /**
         * Get the current active setting value for a responsive control.
         *
         * @param {string} setting
         * @return {any} - Setting value.
         */
        getResponsiveSetting(setting) {
            const elementSettings = this.getElementSettings();
            return elementorFrontend.getCurrentDeviceSetting(elementSettings, setting);
        },
        /**
         * Return an array of settings names for responsive control (e.g. `settings`, `setting_tablet`, `setting_mobile` ).
         *
         * @param {string} setting
         * @return {string[]} - List of settings.
         */
        getResponsiveSettingList(setting) {
            const breakpoints = Object.keys(elementorFrontend.config.responsive.activeBreakpoints);
            return ['', ...breakpoints].map(suffix => {
                return suffix ? `${setting}_${suffix}` : setting;
            });
        },
        getConfig() {
            const elementSettings = this.getElementSettings(),
                stickyOptions = {
                    to: elementSettings.sticky,
                    offset: this.getResponsiveSetting('sticky_offset'),
                    effectsOffset: this.getResponsiveSetting('sticky_effects_offset'),
                    classes: {
                        sticky: 'elementor-sticky',
                        stickyActive: 'elementor-sticky--active elementor-section--handles-inside',
                        stickyEffects: 'elementor-sticky--effects',
                        spacer: 'elementor-sticky__spacer'
                    },
                    isRTL: elementorFrontend.config.is_rtl,
                    // In edit mode, since the preview is an iframe, the scrollbar is on the left. The scrollbar width is
                    // compensated for in this case.
                    handleScrollbarWidth: elementorFrontend.isEditMode()
                },
                $wpAdminBar = elementorFrontend.elements.$wpAdminBar,
                isParentContainer = this.isContainerElement(this.$element[0]) && !this.isContainerElement(this.$element[0].parentElement);
            if ($wpAdminBar.length && 'top' === elementSettings.sticky && 'fixed' === $wpAdminBar.css('position')) {
                stickyOptions.offset += $wpAdminBar.height();
            }

            // The `stickyOptions.parent` value should only be applied to inner elements, and not to top level containers.
            if (elementSettings.sticky_parent && !isParentContainer) {
                // TODO: The e-container classes should be removed in the next update.
                stickyOptions.parent = '.e-container, .e-container__inner, .e-con, .e-con-inner, .elementor-widget-wrap';
            }
            return stickyOptions;
        },
        activate() {
            this.currentConfig = this.getConfig();
            this.$element.sticky(this.currentConfig);
        },
        deactivate() {
            if (!this.isStickyInstanceActive()) {
                return;
            }
            this.$element.sticky('destroy');
        },
        run(refresh) {
            if (!this.getElementSettings('sticky')) {
                this.deactivate();
                return;
            }
            var currentDeviceMode = elementorFrontend.getCurrentDeviceMode(),
                activeDevices = this.getElementSettings('sticky_on');
            if (-1 !== activeDevices.indexOf(currentDeviceMode)) {
                if (true === refresh) {
                    this.reactivate();
                } else if (!this.isStickyInstanceActive()) {
                    this.activate();
                }
            } else {
                this.deactivate();
            }
        },
        /**
         * Reactivate the sticky instance on resize only if the new sticky config is different from the current active one,
         * in order to avoid re-initializing the sticky when not needed, and avoid layout shifts.
         * The config can be different between devices, so this need to be checked on each screen resize to make sure that
         * the current screen size uses the appropriate Sticky config.
         *
         * @return {void}
         */
        reactivateOnResize() {
            clearTimeout(this.debouncedReactivate);
            this.debouncedReactivate = setTimeout(() => {
                const config = this.getConfig(),
                    isDifferentConfig = JSON.stringify(config) !== JSON.stringify(this.currentConfig);
                if (isDifferentConfig) {
                    this.run(true);
                }
            }, 300);
        },
        reactivate() {
            this.deactivate();
            this.activate();
        },
        onElementChange(settingKey) {
            if (-1 !== ['sticky', 'sticky_on'].indexOf(settingKey)) {
                this.run(true);
            }

            // Settings that trigger a re-activation when changed.
            const settings = [...this.getResponsiveSettingList('sticky_offset'), ...this.getResponsiveSettingList('sticky_effects_offset'), 'sticky_parent'];
            if (-1 !== settings.indexOf(settingKey)) {
                this.reactivate();
            }
        },
        /**
         * Listen to device mode changes and re-initialize the sticky.
         *
         * @return {void}
         */
        onDeviceModeChange() {
            // Wait for the call stack to be empty.
            // The `run` function requests the current device mode from the CSS so it's not ready immediately.
            // (need to wait for the `deviceMode` event to change the CSS).
            // See `elementorFrontend.getCurrentDeviceMode()` for reference.
            setTimeout(() => this.run(true));
        },
        onInit() {
            elementorModules.frontend.handlers.Base.prototype.onInit.apply(this, arguments);
            if (elementorFrontend.isEditMode()) {
                elementor.listenTo(elementor.channels.deviceMode, 'change', () => this.onDeviceModeChange());
            }
            this.run();
        },
        onDestroy() {
            elementorModules.frontend.handlers.Base.prototype.onDestroy.apply(this, arguments);
            this.deactivate();
        },
        /**
         *
         * @param {HTMLElement|null|undefined} element
         * @return {boolean} Is the passed element a container.
         */
        isContainerElement(element) {
            const containerClasses = [
                // TODO: The e-container classes should be removed in the next update.
                'e-container', 'e-container__inner', 'e-con', 'e-con-inner'];
            return containerClasses.some(containerClass => {
                return element?.classList.contains(containerClass);
            });
        }
    });

    var _vertical_line = elementorModules.frontend.handlers.Base.extend({

        onInit() {
            const elementSettings = this.getElementSettings();
            if (elementSettings.gamico_section_vertical_line_switcher === 'yes') {
                let line_html = '';
                for (let i = 0; i < elementSettings.gamico_line_number; i++) {
                    line_html += '<span></span>';
                }
                this.$element.append(`<div class="elementor-vertical-lines"><div class="col-full"><div class="line-wrap">${line_html}</div></div></div>`);
            }
        }

    });

    $(window).on('elementor/frontend/init', () => {
        const addHandlerWidget = ($element) => {
            elementorFrontend.elementsHandler.addHandler(_sticky, {
                $element,
            });
            elementorFrontend.elementsHandler.addHandler(_vertical_line, {
                $element,
            });
        };
        
        const addHandlerWrapper = ($element) => {
            elementorFrontend.elementsHandler.addHandler(_sticky, {
                $element,
            });
            elementorFrontend.elementsHandler.addHandler(_vertical_line, {
                $element,
            });

            var $settings = $element.data('settings');
            if($settings && $settings.sticky_show_up) {
                var lastScrollTop = 0,
                    current = '';
                $(window).scroll(function(event){
                    var st = $(this).scrollTop();
                    if (st > lastScrollTop && current != 'down'){
                        $element.slideUp();
                    } 
                    if (st <= lastScrollTop && current != 'up'){
                        $element.slideDown();
                    } 
                    lastScrollTop = st;
                });
            }
        };

        elementorFrontend.hooks.addAction('frontend/element_ready/section', addHandlerWrapper);
        elementorFrontend.hooks.addAction('frontend/element_ready/container', addHandlerWrapper);
        elementorFrontend.hooks.addAction('frontend/element_ready/widget', addHandlerWidget);
    });

}(jQuery, window.elementorFrontend, window.elementorModules));
