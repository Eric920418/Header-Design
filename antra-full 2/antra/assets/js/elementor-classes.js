
class antraCounter extends elementorModules.frontend.handlers.Base {
    getDefaultSettings() {
        return {
            selectors: {
                counterNumber: '.elementor-counter-number-style-2'
            }
        };
    }
    getDefaultElements() {
        const selectors = this.getSettings('selectors');
        return {
            $counterNumber: this.$element.find(selectors.counterNumber)
        };
    }
    onInit() {
        if (this.getDefaultElements().$counterNumber.length) {
            super.onInit();
            this.intersectionObserver = elementorModules.utils.Scroll.scrollObserver({
                callback: event => {
                    if (event.isInViewport) {
                        this.intersectionObserver.unobserve(this.elements.$counterNumber[0]);

                        var odo = this.elements.$counterNumber;
                        var countNumber = odo.attr("data-to-value");
                        odo.html(countNumber);
                    }
                }
            });
            this.intersectionObserver.observe(this.elements.$counterNumber[0]);
        }
    }
}

class antraAjaxFilter extends elementorModules.frontend.handlers.Base {
    getDefaultSettings() {
        return {
            selectors: {
                filterBtn: '.submit-filter',
                filterField: '.fitler-field',
                renderBox: '.elementor-widget-render',
                paginationLink: '.antra-pagination-list a.page-numbers'
            }
        };
    }
    getDefaultElements() {
        const selectors = this.getSettings('selectors');
        return {
            filterBtn: this.$element.find(selectors.filterBtn),
            filterField: this.$element.find(selectors.filterField),
            renderBox: this.$element.find(selectors.renderBox),
            paginationLink: this.$element.find(selectors.paginationLink)
        };
    }
    onInit() {
        if (elementorFrontend.isEditMode()) {
            return;
        }

        this.filterAction();
        this.paginationAction();
    }
    filterAction() {
        var $filterField = this.getDefaultElements().filterField;
        if ($filterField.length) {
            super.onInit();
            var ins = this;
            var $ = jQuery;

            this.$element.on('click', this.getSettings('selectors').filterBtn, function (e) {
                e.preventDefault();

                if ($(this).hasClass('loading')) {
                    return false;
                }

                var url = new URL(window.location.href);

                $filterField.each(function () {
                    var taxonomy = $(this).attr('name'); // game_genre, game_platform
                    var value = $(this).val();

                    if (value) {
                        url.searchParams.set(taxonomy, value);
                    } else {
                        url.searchParams.delete(taxonomy);
                    }
                    // url.searchParams.set('w_id', ins.$element.data('id'));
                });

                ins.sendRequest(url, $(this));
            })
        }
    }
    paginationAction() {
        var $paginationLink = this.getDefaultElements().paginationLink;
        if (!$paginationLink.length) {
            return false;
        }

        var ins = this;
        var $ = jQuery;
        this.$element.on('click', this.getSettings('selectors').paginationLink, function (e) {
            e.preventDefault();

            if ($(this).hasClass('loading')) {
                return false;
            }

            var url = $(this).attr('href');
            ins.sendRequest(url, $(this));
        })

    }
    sendRequest(url, btn) {
        var xhr = false;
        var $ = jQuery;
        if (xhr) {
            xhr.abort();
        }

        var $filterBtn = btn,
            $renderBox = this.getDefaultElements().renderBox,
            id = this.$element.data('id'),
            selectors = this.getSettings('selectors'),
            renderBoxSelector = selectors.renderBox;

        const offsetTop = this.$element.offset().top - 100;

        xhr = $.ajax({
            type: "GET",
            url: url,
            beforeSend: function () {
                $filterBtn.addClass('loading');
                $renderBox.addClass('filtering');
            },
            success: function (data) {
                var $html = $(data),
                    $filteredRenderBox = $html.find(`[data-id="${id}"] ${renderBoxSelector}`);

                if ($filteredRenderBox.length) {
                    $renderBox.html($filteredRenderBox.html());

                    if (typeof $.fn.animate === 'function') {
                        $('html, body').animate({
                            scrollTop: offsetTop
                        }, 500);
                    } else {
                        window.scrollTo(0, offsetTop);
                    }

                } else {
                    console.log('List or Item is not found!');
                }

                xhr = false;
            },
            error: function (xhr) { // if error occured
                alert("Error occured. Please try again!");
                $filterBtn.removeClass('loading');
                $renderBox.removeClass('filtering');
            },
            complete: function () {
                $filterBtn.removeClass('loading');
                $renderBox.removeClass('filtering');
            },
        });
    }
}

class antraLoadmorePost extends elementorModules.frontend.handlers.Base {
    getDefaultSettings() {
        return {
            selectors: {
                loadmoreBtn: '.antra-post-loadmore',
                list: '.antra-list-wrapper',
                item: '.antra-item'
            }
        };
    }
    getDefaultElements() {
        const selectors = this.getSettings('selectors');
        return {
            loadmoreBtn: this.$element.find(selectors.loadmoreBtn)
        };
    }
    onInit() {
        if (elementorFrontend.isEditMode()) {
            return;
        }
        var $ = jQuery;
        var $loadmoreBtn = this.getDefaultElements().loadmoreBtn;
        if ($loadmoreBtn.length) {
            super.onInit();

            var ins = this;

            this.$element.on('click', this.getSettings('selectors').loadmoreBtn, function (e) {
                e.preventDefault();

                if ($(this).hasClass('loading')) {
                    return false;
                }

                var url = $(this).attr('href'),
                    total = parseInt($(this).attr('data-total')),
                    current = parseInt($(this).attr('data-current'));

                if (url) {
                    if (current < total) {
                        let hideAfterDone = current + 1 == total
                        ins.sendRequest(url, $(this), hideAfterDone);
                    } else {
                        $(this).parent('.omero-loadmore').remove();
                    }
                }
            })
        }
    }
    sendRequest(url, btn, hideAfterDone = false) {
        var xhr = false;
        var $ = jQuery;

        if (xhr) {
            xhr.abort();
        }

        var $loadmoreBtn = btn,
            id = this.$element.data('id'),
            selectors = this.getSettings('selectors'),
            btnSelector = selectors.loadmoreBtn,
            listSelector = selectors.list,
            listWrapper = this.$element.find(listSelector),
            itemSelector = selectors.item;

        xhr = $.ajax({
            type: "GET",
            url: url,
            beforeSend: function () {
                $loadmoreBtn.addClass('loading');
            },
            success: function (data) {
                var $html = $(data),
                    itemAppend = $html.find(`[data-id="${id}"] ${itemSelector}`),
                    btnNew = $html.find(`[data-id="${id}"] ${btnSelector}`);

                // setTimeout(function() { 
                // }, 1000);

                if (itemAppend.length && listWrapper.length) {
                    listWrapper.append(itemAppend);
                } else {
                    console.log('List or Item is not found!');
                }

                if (btnNew.length) {
                    $loadmoreBtn.attr({
                        'href': btnNew.attr('href'),
                        'data-total': btnNew.attr('data-total'),
                        'data-current': btnNew.attr('data-current')
                    })
                }
                if (hideAfterDone || !btnNew.length) {
                    $loadmoreBtn.parent('.antra-loadmore').remove();
                }

                // window.history.pushState(null, null, url);
                xhr = false;
                $(document).trigger('antra-posttype-loaded');

            },
            error: function (xhr) { // if error occured
                alert("Error occured. Please try again!");
                $loadmoreBtn.removeClass('loading');
            },
            complete: function () {
                $loadmoreBtn.removeClass('loading');
            },
        });
    }
}

class antraSwiperBase extends elementorModules.frontend.handlers.SwiperBase {

    getDefaultSettings() {
        return {
            selectors: {
                carousel: '.antra-swiper', slideContent: '.swiper-slide'
            }
        };
    }

    getDefaultElements() {
        const selectors = this.getSettings('selectors');
        const elements = {
            $swiperContainer: this.$element.find(selectors.carousel)
        };
        elements.$slides = elements.$swiperContainer.find(selectors.slideContent);
        return elements;
    }

    handleElementHandlers(swiper) {
        // const element = this.getDefaultElements();
        jQuery('.swiper-index.swiper-index-' + this.$element.data('id')).find('.current-index').text(swiper.realIndex + 1);
    }

    addLastVisibleClass() {
        var $swiperEl = this.elements.$swiperContainer;
        $swiperEl.find('.swiper-slide').removeClass('last-visible');
        $swiperEl.find('.swiper-slide.swiper-slide-visible').last().addClass('last-visible');
    }

    getSwiperSettings() {

        const elementSettings = this.getElementSettings(), slidesToShow = +elementSettings.column || 3,
            isSingleSlide = 1 === slidesToShow,
            elementorBreakpoints = elementorFrontend.config.responsive.activeBreakpoints, defaultSlidesToShowMap = {
                mobile: 1, tablet: isSingleSlide ? 1 : 2
            };

        // console.log(this.elements.$slides.length);
        const swiperOptions = {
            slidesPerView: slidesToShow,
            loop: 'yes' === elementSettings.infinite,
            speed: elementSettings.speed,
            handleElementorBreakpoints: true,
            watchSlidesProgress: true,
            watchSlidesVisibility: true,
            loopedSlides: this.elements.$swiperContainer.data('count'),
        };

        if ('true' === this.elements.$swiperContainer.data('center')) {
            swiperOptions.centeredSlides = true;
        }

        swiperOptions.breakpoints = {};
        let lastBreakpointSlidesToShowValue = slidesToShow,
            spacingSwiperSize = elementSettings.column_spacing_swiper.size,
            lastBreakpointSpacing = spacingSwiperSize || spacingSwiperSize === 0 ? spacingSwiperSize : 30;
        Object.keys(elementorBreakpoints).reverse().forEach(breakpointName => {
            // Tablet has a specific default `column`.
            const defaultSlidesToShow = defaultSlidesToShowMap[breakpointName] ? defaultSlidesToShowMap[breakpointName] : lastBreakpointSlidesToShowValue;

            lastBreakpointSpacing = elementSettings['column_spacing_swiper_' + breakpointName].size || lastBreakpointSpacing;

            swiperOptions.breakpoints[elementorBreakpoints[breakpointName].value] = {
                slidesPerView: +elementSettings['column_' + breakpointName] || defaultSlidesToShow,
                slidesPerGroup: +elementSettings['column_' + breakpointName] || 1,
                spaceBetween: +lastBreakpointSpacing
            };
            lastBreakpointSlidesToShowValue = +elementSettings['column_' + breakpointName] || defaultSlidesToShow;
        });

        if ('yes' === elementSettings.autoplay) {
            if (elementSettings.smooth_swiper === 'yes') {
                swiperOptions.autoplay = {
                    delay: 0,
                };
                swiperOptions.freeMode = true;
            } else {
                swiperOptions.autoplay = {
                    delay: elementSettings.autoplay_speed,
                    disableOnInteraction: 'yes' === elementSettings.pause_on_interaction
                };
            }

            if ('ltr' === elementSettings.direction) {
                swiperOptions.autoplay.reverseDirection = true;
            }
        }

        if (isSingleSlide) {
            swiperOptions.effect = elementSettings.effect;

            if ('fade' === elementSettings.effect) {
                swiperOptions.fadeEffect = {
                    crossFade: true
                };
            }
        } else {
            swiperOptions.slidesPerGroup = +elementSettings.slides_to_scroll || 1;
        }

        if (elementSettings.column_spacing_swiper) {
            swiperOptions.spaceBetween = elementSettings.column_spacing_swiper.size;
        }

        if (elementSettings.center_carousel) {
            swiperOptions.centeredSlides = true;
        }

        const showArrows = 'arrows' === elementSettings.navigation || 'both' === elementSettings.navigation,
            showDots = 'dots' === elementSettings.navigation || 'both' === elementSettings.navigation;

        if (showArrows) {
            if ('yes' === elementSettings.custom_navigation) {
                swiperOptions.navigation = {
                    prevEl: elementSettings.custom_navigation_previous, nextEl: elementSettings.custom_navigation_next,
                };
            } else {
                swiperOptions.navigation = {
                    prevEl: '.elementor-swiper-button-prev-' + this.$element.data('id'),
                    nextEl: '.elementor-swiper-button-next-' + this.$element.data('id')
                };
            }
        }

        if (showDots) {
            swiperOptions.pagination = {
                el: '.swiper-pagination-' + this.$element.data('id'), type: 'bullets', clickable: true
            };
        }

        if ('yes' === elementSettings.lazyload) {
            swiperOptions.lazy = {
                loadPrevNext: true, loadPrevNextAmount: 1
            };
        }

        if ('yes' !== elementSettings.drag_move) {
            swiperOptions.allowTouchMove = false;
        }

        if ('yes' === elementSettings.show_index) {
            swiperOptions.on = {
                slideChange: (swiper) => {
                    this.handleElementHandlers(swiper);
                },
            };
        }

        if ('yes' === elementSettings.mousewheel) {
            swiperOptions.mousewheel = {
                releaseOnEdges: true,
            };
        }

        var ins = this;
        swiperOptions.on = {
            resize: function () {
                ins.addLastVisibleClass();
            },
            progress: function () {
                ins.addLastVisibleClass();
            },
        }

        return swiperOptions;
    }

    async onInit() {
        super.onInit(...arguments);

        if (!this.elements.$swiperContainer.length || 2 > this.elements.$slides.length) {
            return;
        }

        const Swiper = elementorFrontend.utils.swiper;
        this.swiper = await new Swiper(this.elements.$swiperContainer, this.getSwiperSettings()); // Expose the swiper instance in the frontend

        this.elements.$swiperContainer.trigger("swiperInit", [this.swiper]);

        this.elements.$swiperContainer.data('swiper', this.swiper);
        const elementSettings = this.getElementSettings();

        if ('yes' === elementSettings.pause_on_hover) {
            this.togglePauseOnHover(true);
        }
    }

    updateSwiperOption(propertyName) {
        const elementSettings = this.getElementSettings(), newSettingValue = elementSettings[propertyName],
            params = this.swiper.params; // Handle special cases where the value to update is not the value that the Swiper library accepts.

        switch (propertyName) {
            case 'column_spacing_swiper':
                params.spaceBetween = newSettingValue.size || 30;
                break;

            case 'autoplay_speed':
                params.autoplay.delay = newSettingValue;
                break;

            case 'speed':
                params.speed = newSettingValue;
                break;
        }

        this.swiper.update();
    }

    getChangeableProperties() {
        return {
            pause_on_hover: 'pauseOnHover',
            autoplay_speed: 'delay',
            speed: 'speed',
            column_spacing_swiper: 'spaceBetween'
        };
    }

    onElementChange(propertyName) {
        const changeableProperties = this.getChangeableProperties();

        if (changeableProperties[propertyName]) {
            // 'pause_on_hover' is implemented by the handler with event listeners, not the Swiper library.
            if ('pause_on_hover' === propertyName) {
                const newSettingValue = this.getElementSettings('pause_on_hover');
                this.togglePauseOnHover('yes' === newSettingValue);
            } else {
                this.updateSwiperOption(propertyName);
            }
        }
    }

    onEditSettingsChange(propertyName) {
        if ('activeItemIndex' === propertyName && typeof this.swiper != 'undefined') {
            this.swiper.slideToLoop(this.getEditSettings('activeItemIndex') - 1);
        }
    }
}