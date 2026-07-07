(function ($) {
    'use strict';

    let lenis = null;
    let rafId = null;

    function startLenis() {
        if (lenis) return;
        lenis = new Lenis({
            duration: 1.5,
            easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
            direction: 'vertical',
            gestureDirection: 'vertical',
            smooth: true,
            mouseMultiplier: 1,
            smoothTouch: false,
            touchMultiplier: 2,
            infinite: false,
        });

        function raf(time) {
            lenis.raf(time);
            rafId = requestAnimationFrame(raf);
        }
        rafId = requestAnimationFrame(raf);
        $('html').css('scroll-behavior', 'initial');
    }

    function stopLenis() {
        if (!lenis) return;
        if (rafId) cancelAnimationFrame(rafId);
        lenis.destroy();
        lenis = null;
        $('html').css('scroll-behavior', 'smooth');
    }

    function handleResize() {
        if ($(window).width() <= 992) {
            stopLenis();
        } else {
            startLenis();
        }
    }

    // Init on load
    handleResize();

    $(window).on('resize', function () {
        handleResize();
    });

})(jQuery);
