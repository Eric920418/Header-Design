/******/ (() => { // webpackBootstrap
    /******/ 	"use strict";
    /******/ 	var __webpack_modules__ = ({});
    /************************************************************************/
    /******/ 	// The module cache
    /******/ 	var __webpack_module_cache__ = {};
    /******/
    /******/ 	// The require function
    /******/ 	function __webpack_require__(moduleId) {
        /******/ 		// Check if module is in cache
        /******/ 		var cachedModule = __webpack_module_cache__[moduleId];
        /******/ 		if (cachedModule !== undefined) {
            /******/ 			return cachedModule.exports;
            /******/ 		}
        /******/ 		// Create a new module (and put it into the cache)
        /******/ 		var module = __webpack_module_cache__[moduleId] = {
            /******/ 			// no module.id needed
            /******/ 			// no module.loaded needed
            /******/ 			exports: {}
            /******/ 		};
        /******/
        /******/ 		// Execute the module function
        /******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
        /******/
        /******/ 		// Return the exports of the module
        /******/ 		return module.exports;
        /******/ 	}
    /******/
    /******/ 	// expose the modules object (__webpack_modules__)
    /******/ 	__webpack_require__.m = __webpack_modules__;
    /******/
    /************************************************************************/
    /******/ 	/* webpack/runtime/chunk loaded */
    /******/ 	(() => {
        /******/ 		var deferred = [];
        /******/ 		__webpack_require__.O = (result, chunkIds, fn, priority) => {
            /******/ 			if(chunkIds) {
                /******/ 				priority = priority || 0;
                /******/ 				for(var i = deferred.length; i > 0 && deferred[i - 1][2] > priority; i--) deferred[i] = deferred[i - 1];
                /******/ 				deferred[i] = [chunkIds, fn, priority];
                /******/ 				return;
                /******/ 			}
            /******/ 			var notFulfilled = Infinity;
            /******/ 			for (var i = 0; i < deferred.length; i++) {
                /******/ 				var [chunkIds, fn, priority] = deferred[i];
                /******/ 				var fulfilled = true;
                /******/ 				for (var j = 0; j < chunkIds.length; j++) {
                    /******/ 					if ((priority & 1 === 0 || notFulfilled >= priority) && Object.keys(__webpack_require__.O).every((key) => (__webpack_require__.O[key](chunkIds[j])))) {
                        /******/ 						chunkIds.splice(j--, 1);
                        /******/ 					} else {
                        /******/ 						fulfilled = false;
                        /******/ 						if(priority < notFulfilled) notFulfilled = priority;
                        /******/ 					}
                    /******/ 				}
                /******/ 				if(fulfilled) {
                    /******/ 					deferred.splice(i--, 1)
                    /******/ 					var r = fn();
                    /******/ 					if (r !== undefined) result = r;
                    /******/ 				}
                /******/ 			}
            /******/ 			return result;
            /******/ 		};
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/ensure chunk */
    /******/ 	(() => {
        /******/ 		__webpack_require__.f = {};
        /******/ 		// This file contains only the entry chunk.
        /******/ 		// The chunk loading function for additional chunks
        /******/ 		__webpack_require__.e = (chunkId) => {
            /******/ 			return Promise.all(Object.keys(__webpack_require__.f).reduce((promises, key) => {
                /******/ 				__webpack_require__.f[key](chunkId, promises);
                /******/ 				return promises;
                /******/ 			}, []));
            /******/ 		};
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/get javascript chunk filename */
    /******/ 	(() => {
        /******/ 		// This function allow to reference async chunks
        /******/ 		__webpack_require__.u = (chunkId) => {
            /******/ 			// return url for filenames not based on template
            /******/ 			if (chunkId === "code-highlight") return "" + chunkId + ".cc6c8eb49e0aff6d419e.bundle.js";
            /******/ 			if (chunkId === "video-playlist") return "" + chunkId + ".5ee0445e2c9b1f2ed68f.bundle.js";
            /******/ 			if (chunkId === "paypal-button") return "" + chunkId + ".a8f3d929735cca75a572.bundle.js";
            /******/ 			if (chunkId === "progress-tracker") return "" + chunkId + ".a7329beb7783748287a5.bundle.js";
            /******/ 			if (chunkId === "animated-headline") return "" + chunkId + ".0ccd23763059df7affcc.bundle.js";
            /******/ 			if (chunkId === "media-carousel") return "" + chunkId + ".b5cf350f530535d64364.bundle.js";
            /******/ 			if (chunkId === "carousel") return "" + chunkId + ".364bbaf018e09f58c819.bundle.js";
            /******/ 			if (chunkId === "countdown") return "" + chunkId + ".6b48da864045c1ea0edd.bundle.js";
            /******/ 			if (chunkId === "hotspot") return "" + chunkId + ".66952182f9ae91b6896c.bundle.js";
            /******/ 			if (chunkId === "form") return "form.23168c11e0d20fa0282b.bundle.js";
            /******/ 			if (chunkId === "gallery") return "" + chunkId + ".e5ba72e3c57da531df85.bundle.js";
            /******/ 			if (chunkId === "lottie") return "" + chunkId + ".dccf7257e6cc366bc6bd.bundle.js";
            /******/ 			if (chunkId === "nav-menu") return "" + chunkId + ".e248eec66bc3d5587cf6.bundle.js";
            /******/ 			if (chunkId === "popup") return "" + chunkId + ".5ddbdd46f21fc221d760.bundle.js";
            /******/ 			if (chunkId === "load-more") return "" + chunkId + ".cd76720206dc6d21abc0.bundle.js";
            /******/ 			if (chunkId === "posts") return "" + chunkId + ".c23c8d29f44afbd62da6.bundle.js";
            /******/ 			if (chunkId === "portfolio") return "" + chunkId + ".71a9b9fb42566ae496bd.bundle.js";
            /******/ 			if (chunkId === "share-buttons") return "" + chunkId + ".d147b71ef798e333e678.bundle.js";
            /******/ 			if (chunkId === "slides") return "" + chunkId + ".6d3f738223ac9b3c9b7a.bundle.js";
            /******/ 			if (chunkId === "social") return "" + chunkId + ".b17f5f1767e41333a1dc.bundle.js";
            /******/ 			if (chunkId === "table-of-contents") return "" + chunkId + ".0744140055afdd9bf411.bundle.js";
            /******/ 			if (chunkId === "archive-posts") return "" + chunkId + ".22a6d49be96f6e1aa290.bundle.js";
            /******/ 			if (chunkId === "search-form") return "" + chunkId + ".fda69e244861c6890e79.bundle.js";
            /******/ 			if (chunkId === "woocommerce-menu-cart") return "" + chunkId + ".cf8829a628c66ec7c688.bundle.js";
            /******/ 			if (chunkId === "woocommerce-checkout-page") return "" + chunkId + ".acd4a2b8bc03ed32111f.bundle.js";
            /******/ 			if (chunkId === "woocommerce-cart") return "" + chunkId + ".39ccd7e510e98f3afb01.bundle.js";
            /******/ 			if (chunkId === "woocommerce-my-account") return "" + chunkId + ".d52e81c74f27be09eb2e.bundle.js";
            /******/ 			// return url for filenames based on template
            /******/ 			return undefined;
            /******/ 		};
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/global */
    /******/ 	(() => {
        /******/ 		__webpack_require__.g = (function() {
            /******/ 			if (typeof globalThis === 'object') return globalThis;
            /******/ 			try {
                /******/ 				return this || new Function('return this')();
                /******/ 			} catch (e) {
                /******/ 				if (typeof window === 'object') return window;
                /******/ 			}
            /******/ 		})();
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/hasOwnProperty shorthand */
    /******/ 	(() => {
        /******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/load script */
    /******/ 	(() => {
        /******/ 		var inProgress = {};
        /******/ 		var dataWebpackPrefix = "elementor-pro:";
        /******/ 		// loadScript function to load a script via script tag
        /******/ 		__webpack_require__.l = (url, done, key, chunkId) => {
            /******/ 			if(inProgress[url]) { inProgress[url].push(done); return; }
            /******/ 			var script, needAttach;
            /******/ 			if(key !== undefined) {
                /******/ 				var scripts = document.getElementsByTagName("script");
                /******/ 				for(var i = 0; i < scripts.length; i++) {
                    /******/ 					var s = scripts[i];
                    /******/ 					if(s.getAttribute("src") == url || s.getAttribute("data-webpack") == dataWebpackPrefix + key) { script = s; break; }
                    /******/ 				}
                /******/ 			}
            /******/ 			if(!script) {
                /******/ 				needAttach = true;
                /******/ 				script = document.createElement('script');
                /******/
                /******/ 				script.charset = 'utf-8';
                /******/ 				script.timeout = 120;
                /******/ 				if (__webpack_require__.nc) {
                    /******/ 					script.setAttribute("nonce", __webpack_require__.nc);
                    /******/ 				}
                /******/ 				script.setAttribute("data-webpack", dataWebpackPrefix + key);
                /******/ 				script.src = url;
                /******/ 			}
            /******/ 			inProgress[url] = [done];
            /******/ 			var onScriptComplete = (prev, event) => {
                    /******/ 				// avoid mem leaks in IE.
                    /******/ 				script.onerror = script.onload = null;
                    /******/ 				clearTimeout(timeout);
                    /******/ 				var doneFns = inProgress[url];
                    /******/ 				delete inProgress[url];
                    /******/ 				script.parentNode && script.parentNode.removeChild(script);
                    /******/ 				doneFns && doneFns.forEach((fn) => (fn(event)));
                    /******/ 				if(prev) return prev(event);
                    /******/ 			}
                /******/ 			;
            /******/ 			var timeout = setTimeout(onScriptComplete.bind(null, undefined, { type: 'timeout', target: script }), 120000);
            /******/ 			script.onerror = onScriptComplete.bind(null, script.onerror);
            /******/ 			script.onload = onScriptComplete.bind(null, script.onload);
            /******/ 			needAttach && document.head.appendChild(script);
            /******/ 		};
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/publicPath */
    /******/ 	(() => {
        /******/ 		var scriptUrl;
        /******/ 		if (__webpack_require__.g.importScripts) scriptUrl = __webpack_require__.g.location + "";
        /******/ 		var document = __webpack_require__.g.document;
        /******/ 		if (!scriptUrl && document) {
            /******/ 			if (document.currentScript)
            /******/ 				scriptUrl = document.currentScript.src
            /******/ 			if (!scriptUrl) {
                /******/ 				var scripts = document.getElementsByTagName("script");
                /******/ 				if(scripts.length) scriptUrl = scripts[scripts.length - 1].src
                /******/ 			}
            /******/ 		}
        /******/ 		// When supporting browsers where an automatic publicPath is not supported you must specify an output.publicPath manually via configuration
        /******/ 		// or pass an empty string ("") and set the __webpack_public_path__ variable from your code to use your own logic.
        /******/ 		if (!scriptUrl) throw new Error("Automatic publicPath is not supported in this browser");
        /******/ 		scriptUrl = scriptUrl.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/[^\/]+$/, "/");
        /******/ 		__webpack_require__.p = scriptUrl;
        /******/ 	})();
    /******/
    /******/ 	/* webpack/runtime/jsonp chunk loading */
    /******/ 	(() => {
        /******/ 		// no baseURI
        /******/
        /******/ 		// object to store loaded and loading chunks
        /******/ 		// undefined = chunk not loaded, null = chunk preloaded/prefetched
        /******/ 		// [resolve, reject, Promise] = chunk loading, 0 = chunk loaded
        /******/ 		var installedChunks = {
            /******/ 			"webpack-pro.runtime": 0
            /******/ 		};
        /******/
        /******/ 		__webpack_require__.f.j = (chunkId, promises) => {
            /******/ 				// JSONP chunk loading for javascript
            /******/ 				var installedChunkData = __webpack_require__.o(installedChunks, chunkId) ? installedChunks[chunkId] : undefined;
            /******/ 				if(installedChunkData !== 0) { // 0 means "already installed".
                /******/
                /******/ 					// a Promise means "currently loading".
                /******/ 					if(installedChunkData) {
                    /******/ 						promises.push(installedChunkData[2]);
                    /******/ 					} else {
                    /******/ 						if("webpack-pro.runtime" != chunkId) {
                        /******/ 							// setup Promise in chunk cache
                        /******/ 							var promise = new Promise((resolve, reject) => (installedChunkData = installedChunks[chunkId] = [resolve, reject]));
                        /******/ 							promises.push(installedChunkData[2] = promise);
                        /******/
                        /******/ 							// start chunk loading
                        /******/ 							var url = __webpack_require__.p + __webpack_require__.u(chunkId);
                        /******/ 							// create error before stack unwound to get useful stacktrace later
                        /******/ 							var error = new Error();
                        /******/ 							var loadingEnded = (event) => {
                            /******/ 								if(__webpack_require__.o(installedChunks, chunkId)) {
                                /******/ 									installedChunkData = installedChunks[chunkId];
                                /******/ 									if(installedChunkData !== 0) installedChunks[chunkId] = undefined;
                                /******/ 									if(installedChunkData) {
                                    /******/ 										var errorType = event && (event.type === 'load' ? 'missing' : event.type);
                                    /******/ 										var realSrc = event && event.target && event.target.src;
                                    /******/ 										error.message = 'Loading chunk ' + chunkId + ' failed.\n(' + errorType + ': ' + realSrc + ')';
                                    /******/ 										error.name = 'ChunkLoadError';
                                    /******/ 										error.type = errorType;
                                    /******/ 										error.request = realSrc;
                                    /******/ 										installedChunkData[1](error);
                                    /******/ 									}
                                /******/ 								}
                            /******/ 							};
                        /******/ 							__webpack_require__.l(url, loadingEnded, "chunk-" + chunkId, chunkId);
                        /******/ 						} else installedChunks[chunkId] = 0;
                    /******/ 					}
                /******/ 				}
            /******/ 		};
        /******/
        /******/ 		// no prefetching
        /******/
        /******/ 		// no preloaded
        /******/
        /******/ 		// no HMR
        /******/
        /******/ 		// no HMR manifest
        /******/
        /******/ 		__webpack_require__.O.j = (chunkId) => (installedChunks[chunkId] === 0);
        /******/
        /******/ 		// install a JSONP callback for chunk loading
        /******/ 		var webpackJsonpCallback = (parentChunkLoadingFunction, data) => {
            /******/ 			var [chunkIds, moreModules, runtime] = data;
            /******/ 			// add "moreModules" to the modules object,
            /******/ 			// then flag all "chunkIds" as loaded and fire callback
            /******/ 			var moduleId, chunkId, i = 0;
            /******/ 			for(moduleId in moreModules) {
                /******/ 				if(__webpack_require__.o(moreModules, moduleId)) {
                    /******/ 					__webpack_require__.m[moduleId] = moreModules[moduleId];
                    /******/ 				}
                /******/ 			}
            /******/ 			if(runtime) var result = runtime(__webpack_require__);
            /******/ 			if(parentChunkLoadingFunction) parentChunkLoadingFunction(data);
            /******/ 			for(;i < chunkIds.length; i++) {
                /******/ 				chunkId = chunkIds[i];
                /******/ 				if(__webpack_require__.o(installedChunks, chunkId) && installedChunks[chunkId]) {
                    /******/ 					installedChunks[chunkId][0]();
                    /******/ 				}
                /******/ 				installedChunks[chunkIds[i]] = 0;
                /******/ 			}
            /******/ 			return __webpack_require__.O(result);
            /******/ 		}
        /******/
        /******/ 		var chunkLoadingGlobal = self["antraChunkelElementor"] = self["antraChunkelElementor"] || [];
        /******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
        /******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
        /******/ 	})();
    /******/
    /************************************************************************/
    /******/
    /******/
    /******/ })()
;


(self["antraChunkelElementor"] = self["antraChunkelElementor"] || []).push([["frontend"],{

    /***/ "../node_modules/@babel/runtime/helpers/defineProperty.js":
    /*!****************************************************************!*\
      !*** ../node_modules/@babel/runtime/helpers/defineProperty.js ***!
      \****************************************************************/
    /***/ ((module) => {

        function _defineProperty(obj, key, value) {
            if (key in obj) {
                Object.defineProperty(obj, key, {
                    value: value,
                    enumerable: true,
                    configurable: true,
                    writable: true
                });
            } else {
                obj[key] = value;
            }

            return obj;
        }

        module.exports = _defineProperty;
        module.exports.default = module.exports, module.exports.__esModule = true;

        /***/ }),

    /***/ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js":
    /*!***********************************************************************!*\
      !*** ../node_modules/@babel/runtime/helpers/interopRequireDefault.js ***!
      \***********************************************************************/
    /***/ ((module) => {

        function _interopRequireDefault(obj) {
            return obj && obj.__esModule ? obj : {
                "default": obj
            };
        }

        module.exports = _interopRequireDefault;
        module.exports.default = module.exports, module.exports.__esModule = true;

        /***/ }),

    /***/ "../assets/dev/js/frontend/frontend.js":
    /*!*********************************************!*\
      !*** ../assets/dev/js/frontend/frontend.js ***!
      \*********************************************/
    /***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        __webpack_require__(/*! ../public-path */ "../assets/dev/js/public-path.js");

        var _frontend = _interopRequireDefault(__webpack_require__(/*! ../../../../modules/motion-fx/assets/js/frontend/frontend */ "../modules/motion-fx/assets/js/frontend/frontend.js"));

        class ElementorProFrontend extends elementorModules.ViewModule {
            onInit() {
                super.onInit();
                this.config = {};
                this.modules = {};
            }

            bindEvents() {
                jQuery(window).on('elementor/frontend/init', this.onElementorFrontendInit.bind(this));
            }

            initModules() {
                // Handlers that should be available by default for sections usage.
                let handlers = {
                    motionFX: _frontend.default,
                }; // Keep this line before applying filter on the handlers.

                elementorProFrontend.trigger('elementor-pro/modules/init:before');
                handlers = elementorFrontend.hooks.applyFilters('elementor-pro/frontend/handlers', handlers);
                jQuery.each(handlers, (moduleName, ModuleClass) => {
                    this.modules[moduleName] = new ModuleClass();
                }); // TODO: BC Since 2.9.0

                this.modules.linkActions = {
                    addAction: (...args) => {
                        elementorFrontend.utils.urlActions.addAction(...args);
                    }
                };
            }

            onElementorFrontendInit() {
                this.initModules();
            }

        }

        window.elementorProFrontend = new ElementorProFrontend();

        /***/ }),

    /***/ "../assets/dev/js/public-path.js":
    /*!***************************************!*\
      !*** ../assets/dev/js/public-path.js ***!
      \***************************************/
    /***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

        "use strict";


        /* eslint-disable camelcase */
        __webpack_require__.p = 'js/';

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/frontend.js":
    /*!***********************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/frontend.js ***!
      \***********************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _handler = _interopRequireDefault(__webpack_require__(/*! ./handler */ "../modules/motion-fx/assets/js/frontend/handler.js"));

        class _default extends elementorModules.Module {
            constructor() {
                super();
                elementorFrontend.elementsHandler.attachHandler('global', _handler.default, null);
            }

        }

        exports.default = _default;

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/handler.js":
    /*!**********************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/handler.js ***!
      \**********************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _motionFx = _interopRequireDefault(__webpack_require__(/*! ./motion-fx/motion-fx */ "../modules/motion-fx/assets/js/frontend/motion-fx/motion-fx.js"));
        class _default extends elementorModules.frontend.handlers.Base {
            __construct(...args) {
                super.__construct(...args);

                this.toggle = elementorFrontend.debounce(this.toggle, 200);
            }

            getDefaultSettings() {
                return {
                    selectors: {
                        container: '.elementor-widget-container'
                    }
                };
            }

            getDefaultElements() {
                const selectors = this.getSettings('selectors');
                return {
                    $container: this.$element.find(selectors.container)
                };
            }

            bindEvents() {
                elementorFrontend.elements.$window.on('resize', this.toggle);
            }

            unbindEvents() {
                elementorFrontend.elements.$window.off('resize', this.toggle);
            }

            addCSSTransformEvents() {
                // Remove CSS transition variable that assigned from scroll.js in order to allow the transition of the CSS-Transform.
                const motionFxScrolling = this.getElementSettings('motion_fx_motion_fx_scrolling');

                if (motionFxScrolling && !this.isTransitionEventAdded) {
                    this.isTransitionEventAdded = true;
                    this.elements.$container.on('mouseenter', () => {
                        this.elements.$container.css('--e-transform-transition-duration', '');
                    });
                }
            }

            initEffects() {
                this.effects = {
                    translateY: {
                        interaction: 'scroll',
                        actions: ['translateY']
                    },
                    translateX: {
                        interaction: 'scroll',
                        actions: ['translateX']
                    },
                    rotateZ: {
                        interaction: 'scroll',
                        actions: ['rotateZ']
                    },
                    scale: {
                        interaction: 'scroll',
                        actions: ['scale']
                    },
                    opacity: {
                        interaction: 'scroll',
                        actions: ['opacity']
                    },
                    blur: {
                        interaction: 'scroll',
                        actions: ['blur']
                    },
                    mouseTrack: {
                        interaction: 'mouseMove',
                        actions: ['translateXY']
                    },
                    tilt: {
                        interaction: 'mouseMove',
                        actions: ['tilt']
                    }
                };
            }

            prepareOptions(name) {
                const elementSettings = this.getElementSettings(),
                    type = 'motion_fx' === name ? 'element' : 'background',
                    interactions = {};
                jQuery.each(elementSettings, (key, value) => {
                    const keyRegex = new RegExp('^' + name + '_(.+?)_effect'),
                        keyMatches = key.match(keyRegex);

                    if (!keyMatches || !value) {
                        return;
                    }

                    const options = {},
                        effectName = keyMatches[1];
                    jQuery.each(elementSettings, (subKey, subValue) => {
                        const subKeyRegex = new RegExp(name + '_' + effectName + '_(.+)'),
                            subKeyMatches = subKey.match(subKeyRegex);

                        if (!subKeyMatches) {
                            return;
                        }

                        const subFieldName = subKeyMatches[1];

                        if ('effect' === subFieldName) {
                            return;
                        }

                        if ('object' === typeof subValue) {
                            subValue = Object.keys(subValue.sizes).length ? subValue.sizes : subValue.size;
                        }

                        options[subKeyMatches[1]] = subValue;
                    });
                    const effect = this.effects[effectName],
                        interactionName = effect.interaction;

                    if (!interactions[interactionName]) {
                        interactions[interactionName] = {};
                    }

                    effect.actions.forEach(action => interactions[interactionName][action] = options);
                });
                let $element = this.$element,
                    $dimensionsElement;
                const elementType = this.getElementType();

                if ('element' === type && 'section' !== elementType) {
                    $dimensionsElement = $element;
                    let childElementSelector;

                    if ('column' === elementType) {
                        childElementSelector = elementorFrontend.config.legacyMode.elementWrappers ? '.elementor-column-wrap' : '.elementor-widget-wrap';
                    } else {
                        childElementSelector = '.elementor-widget-container';
                    }

                    $element = $element.find('> ' + childElementSelector);
                }

                const options = {
                    type,
                    interactions,
                    elementSettings,
                    $element,
                    $dimensionsElement,
                    refreshDimensions: this.isEdit,
                    range: elementSettings[name + '_range'],
                    classes: {
                        element: 'elementor-motion-effects-element',
                        parent: 'elementor-motion-effects-parent',
                        backgroundType: 'elementor-motion-effects-element-type-background',
                        container: 'elementor-motion-effects-container',
                        layer: 'elementor-motion-effects-layer',
                        perspective: 'elementor-motion-effects-perspective'
                    }
                };

                if (!options.range && 'fixed' === this.getCurrentDeviceSetting('_position')) {
                    options.range = 'page';
                }

                if ('fixed' === this.getCurrentDeviceSetting('_position')) {
                    options.isFixedPosition = true;
                }

                if ('background' === type && 'column' === this.getElementType()) {
                    options.addBackgroundLayerTo = ' > .elementor-element-populated';
                }

                return options;
            }

            activate(name) {
                const options = this.prepareOptions(name);

                if (jQuery.isEmptyObject(options.interactions)) {
                    return;
                }

                this[name] = new _motionFx.default(options);
            }

            deactivate(name) {
                if (this[name]) {
                    this[name].destroy();
                    delete this[name];
                }
            }

            toggle() {
                const currentDeviceMode = elementorFrontend.getCurrentDeviceMode(),
                    elementSettings = this.getElementSettings();
                ['motion_fx', 'background_motion_fx'].forEach(name => {
                    const devices = elementSettings[name + '_devices'],
                        isCurrentModeActive = !devices || -1 !== devices.indexOf(currentDeviceMode);

                    if (isCurrentModeActive && (elementSettings[name + '_motion_fx_scrolling'] || elementSettings[name + '_motion_fx_mouse'])) {
                        if (this[name]) {
                            this.refreshInstance(name);
                        } else {
                            this.activate(name);
                        }
                    } else {
                        this.deactivate(name);
                    }
                });
            }

            refreshInstance(instanceName) {
                const instance = this[instanceName];

                if (!instance) {
                    return;
                }

                const preparedOptions = this.prepareOptions(instanceName);
                instance.setSettings(preparedOptions);
                instance.refresh();
            }

            onInit() {
                super.onInit();
                this.initEffects();
                this.addCSSTransformEvents();
                this.toggle();
            }

            onElementChange(propertyName) {
                if (/motion_fx_((scrolling)|(mouse)|(devices))$/.test(propertyName)) {
                    if ('motion_fx_motion_fx_scrolling' === propertyName) {
                        this.addCSSTransformEvents();
                    }

                    this.toggle();
                    return;
                }

                const propertyMatches = propertyName.match('.*?(motion_fx|_transform)');

                if (propertyMatches) {
                    const instanceName = propertyMatches[0].match('(_transform)') ? 'motion_fx' : propertyMatches[0];
                    this.refreshInstance(instanceName);

                    if (!this[instanceName]) {
                        this.activate(instanceName);
                    }
                }

                if (/^_position/.test(propertyName)) {
                    ['motion_fx', 'background_motion_fx'].forEach(instanceName => {
                        this.refreshInstance(instanceName);
                    });
                }
            }

            onDestroy() {
                super.onDestroy();
                ['motion_fx', 'background_motion_fx'].forEach(name => {
                    this.deactivate(name);
                });
            }

        }

        exports.default = _default;

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/motion-fx/actions.js":
    /*!********************************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/motion-fx/actions.js ***!
      \********************************************************************/
    /***/ ((__unused_webpack_module, exports) => {

        "use strict";


        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        class _default extends elementorModules.Module {
            getMovePointFromPassedPercents(movableRange, passedPercents) {
                const movePoint = passedPercents / movableRange * 100;
                return +movePoint.toFixed(2);
            }

            getEffectValueFromMovePoint(range, movePoint) {
                return range * movePoint / 100;
            }

            getStep(passedPercents, options) {
                if ('element' === this.getSettings('type')) {
                    return this.getElementStep(passedPercents, options);
                }

                return this.getBackgroundStep(passedPercents, options);
            }

            getElementStep(passedPercents, options) {
                return -(passedPercents - 50) * options.speed;
            }

            getBackgroundStep(passedPercents, options) {
                const movableRange = this.getSettings('dimensions.movable' + options.axis.toUpperCase());
                return -this.getEffectValueFromMovePoint(movableRange, passedPercents);
            }

            getDirectionMovePoint(passedPercents, direction, range) {
                let movePoint;

                if (passedPercents < range.start) {
                    if ('out-in' === direction) {
                        movePoint = 0;
                    } else if ('in-out' === direction) {
                        movePoint = 100;
                    } else {
                        movePoint = this.getMovePointFromPassedPercents(range.start, passedPercents);

                        if ('in-out-in' === direction) {
                            movePoint = 100 - movePoint;
                        }
                    }
                } else if (passedPercents < range.end) {
                    if ('in-out-in' === direction) {
                        movePoint = 0;
                    } else if ('out-in-out' === direction) {
                        movePoint = 100;
                    } else {
                        movePoint = this.getMovePointFromPassedPercents(range.end - range.start, passedPercents - range.start);

                        if ('in-out' === direction) {
                            movePoint = 100 - movePoint;
                        }
                    }
                } else if ('in-out' === direction) {
                    movePoint = 0;
                } else if ('out-in' === direction) {
                    movePoint = 100;
                } else {
                    movePoint = this.getMovePointFromPassedPercents(100 - range.end, 100 - passedPercents);

                    if ('in-out-in' === direction) {
                        movePoint = 100 - movePoint;
                    }
                }

                return movePoint;
            }

            translateX(actionData, passedPercents) {
                actionData.axis = 'x';
                actionData.unit = 'px';
                this.transform('translateX', passedPercents, actionData);
            }

            translateY(actionData, passedPercents) {
                actionData.axis = 'y';
                actionData.unit = 'px';
                this.transform('translateY', passedPercents, actionData);
            }

            translateXY(actionData, passedPercentsX, passedPercentsY) {
                this.translateX(actionData, passedPercentsX);
                this.translateY(actionData, passedPercentsY);
            }

            tilt(actionData, passedPercentsX, passedPercentsY) {
                const options = {
                    speed: actionData.speed / 10,
                    direction: actionData.direction
                };
                this.rotateX(options, passedPercentsY);
                this.rotateY(options, 100 - passedPercentsX);
            }

            rotateX(actionData, passedPercents) {
                actionData.axis = 'x';
                actionData.unit = 'deg';
                this.transform('rotateX', passedPercents, actionData);
            }

            rotateY(actionData, passedPercents) {
                actionData.axis = 'y';
                actionData.unit = 'deg';
                this.transform('rotateY', passedPercents, actionData);
            }

            rotateZ(actionData, passedPercents) {
                actionData.unit = 'deg';
                this.transform('rotateZ', passedPercents, actionData);
            }

            scale(actionData, passedPercents) {
                const movePoint = this.getDirectionMovePoint(passedPercents, actionData.direction, actionData.range);
                this.updateRulePart('transform', 'scale', 1 + actionData.speed * movePoint / 1000);
            }

            transform(action, passedPercents, actionData) {
                if (actionData.direction) {
                    passedPercents = 100 - passedPercents;
                }

                this.updateRulePart('transform', action, this.getStep(passedPercents, actionData) + actionData.unit);
            }

            setCSSTransformVariables(elementSettings) {
                this.CSSTransformVariables = [];
                jQuery.each(elementSettings, (settingKey, settingValue) => {
                    const transformKeyMatches = settingKey.match(/_transform_(.+?)_effect/m);

                    if (transformKeyMatches && settingValue) {
                        if ('perspective' === transformKeyMatches[1]) {
                            this.CSSTransformVariables.unshift(transformKeyMatches[1]);
                            return;
                        }

                        if (this.CSSTransformVariables.includes(transformKeyMatches[1])) {
                            return;
                        }

                        this.CSSTransformVariables.push(transformKeyMatches[1]);
                    }
                });
            }

            opacity(actionData, passedPercents) {
                const movePoint = this.getDirectionMovePoint(passedPercents, actionData.direction, actionData.range),
                    level = actionData.level / 10,
                    opacity = 1 - level + this.getEffectValueFromMovePoint(level, movePoint);
                this.$element.css({
                    opacity,
                    'will-change': 'opacity'
                });
            }

            blur(actionData, passedPercents) {
                const movePoint = this.getDirectionMovePoint(passedPercents, actionData.direction, actionData.range),
                    blur = actionData.level - this.getEffectValueFromMovePoint(actionData.level, movePoint);
                this.updateRulePart('filter', 'blur', blur + 'px');
            }

            updateRulePart(ruleName, key, value) {
                if (!this.rulesVariables[ruleName]) {
                    this.rulesVariables[ruleName] = {};
                }

                if (!this.rulesVariables[ruleName][key]) {
                    this.rulesVariables[ruleName][key] = true;
                    this.updateRule(ruleName);
                }

                const cssVarKey = `--${key}`;
                this.$element[0].style.setProperty(cssVarKey, value);
            }

            updateRule(ruleName) {
                let value = '';
                value += this.concatTransformCSSProperties(ruleName);
                value += this.concatTransformMotionEffectCSSProperties(ruleName);
                this.$element.css(ruleName, value);
            }

            concatTransformCSSProperties(ruleName) {
                let value = '';

                if ('transform' === ruleName) {
                    jQuery.each(this.CSSTransformVariables, (index, variableKey) => {
                        const variableName = variableKey;

                        if (variableKey.startsWith('flip')) {
                            variableKey = variableKey.replace('flip', 'scale');
                        } // Adding default value because of the hover state. if there is no default the transform will break.


                        const defaultUnit = variableKey.startsWith('rotate') || variableKey.startsWith('skew') ? 'deg' : 'px',
                            defaultValue = variableKey.startsWith('scale') ? 1 : 0 + defaultUnit;
                        value += `${variableKey}(var(--e-transform-${variableName}, ${defaultValue}))`;
                    });
                }

                return value;
            }

            concatTransformMotionEffectCSSProperties(ruleName) {
                let value = '';
                jQuery.each(this.rulesVariables[ruleName], variableKey => {
                    value += `${variableKey}(var(--${variableKey}))`;
                });
                return value;
            }

            runAction(actionName, actionData, passedPercents, ...args) {
                if (actionData.affectedRange) {
                    if (actionData.affectedRange.start > passedPercents) {
                        passedPercents = actionData.affectedRange.start;
                    }

                    if (actionData.affectedRange.end < passedPercents) {
                        passedPercents = actionData.affectedRange.end;
                    }
                }

                this[actionName](actionData, passedPercents, ...args);
            }

            refresh() {
                this.rulesVariables = {};
                this.CSSTransformVariables = [];
                this.$element.css({
                    transform: '',
                    filter: '',
                    opacity: '',
                    'will-change': ''
                });
            }

            onInit() {
                this.$element = this.getSettings('$targetElement');
                this.refresh();
            }

        }

        exports.default = _default;

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/base.js":
    /*!******************************************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/motion-fx/interactions/base.js ***!
      \******************************************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _defineProperty2 = _interopRequireDefault(__webpack_require__(/*! @babel/runtime/helpers/defineProperty */ "../node_modules/@babel/runtime/helpers/defineProperty.js"));

        class _default extends elementorModules.ViewModule {
            constructor(...args) {
                super(...args);
                (0, _defineProperty2.default)(this, "onInsideViewport", () => {
                    this.run();
                    this.animationFrameRequest = requestAnimationFrame(this.onInsideViewport);
                });
            }

            __construct(options) {
                this.motionFX = options.motionFX;

                if (!this.intersectionObservers) {
                    this.setElementInViewportObserver();
                }
            }

            setElementInViewportObserver() {
                this.intersectionObserver = elementorModules.utils.Scroll.scrollObserver({
                    callback: event => {
                        if (event.isInViewport) {
                            this.onInsideViewport();
                        } else {
                            this.removeAnimationFrameRequest();
                        }
                    }
                });
                this.intersectionObserver.observe(this.motionFX.elements.$parent[0]);
            }

            runCallback(...args) {
                const callback = this.getSettings('callback');
                callback(...args);
            }

            removeIntersectionObserver() {
                if (this.intersectionObserver) {
                    this.intersectionObserver.unobserve(this.motionFX.elements.$parent[0]);
                }
            }

            removeAnimationFrameRequest() {
                if (this.animationFrameRequest) {
                    cancelAnimationFrame(this.animationFrameRequest);
                }
            }

            destroy() {
                this.removeAnimationFrameRequest();
                this.removeIntersectionObserver();
            }

            onInit() {
                super.onInit();
            }

        }

        exports.default = _default;

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/mouse-move.js":
    /*!************************************************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/motion-fx/interactions/mouse-move.js ***!
      \************************************************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _base = _interopRequireDefault(__webpack_require__(/*! ./base */ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/base.js"));

        class MouseMoveInteraction extends _base.default {
            bindEvents() {
                if (!MouseMoveInteraction.mouseTracked) {
                    elementorFrontend.elements.$window.on('mousemove', MouseMoveInteraction.updateMousePosition);
                    MouseMoveInteraction.mouseTracked = true;
                }
            }

            run() {
                const mousePosition = MouseMoveInteraction.mousePosition,
                    oldMousePosition = this.oldMousePosition;

                if (oldMousePosition.x === mousePosition.x && oldMousePosition.y === mousePosition.y) {
                    return;
                }

                this.oldMousePosition = {
                    x: mousePosition.x,
                    y: mousePosition.y
                };
                const passedPercentsX = 100 / innerWidth * mousePosition.x,
                    passedPercentsY = 100 / innerHeight * mousePosition.y;
                this.runCallback(passedPercentsX, passedPercentsY);
            }

            onInit() {
                this.oldMousePosition = {};
                super.onInit();
            }

        }

        exports.default = MouseMoveInteraction;
        MouseMoveInteraction.mousePosition = {};

        MouseMoveInteraction.updateMousePosition = event => {
            MouseMoveInteraction.mousePosition = {
                x: event.clientX,
                y: event.clientY
            };
        };

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/scroll.js":
    /*!********************************************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/motion-fx/interactions/scroll.js ***!
      \********************************************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _base = _interopRequireDefault(__webpack_require__(/*! ./base */ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/base.js"));

        class _default extends _base.default {
            run() {
                if (pageYOffset === this.windowScrollTop) {
                    return false;
                }

                this.onScrollMovement();
                this.windowScrollTop = pageYOffset;
            }

            onScrollMovement() {
                this.updateMotionFxDimensions();
                this.updateAnimation();
                this.resetTransitionVariable();
            }

            resetTransitionVariable() {
                this.motionFX.$element.css('--e-transform-transition-duration', '100ms');
            }

            updateMotionFxDimensions() {
                const motionFXSettings = this.motionFX.getSettings();

                if (motionFXSettings.refreshDimensions) {
                    this.motionFX.defineDimensions();
                }
            }

            updateAnimation() {
                let passedRangePercents;

                if ('page' === this.motionFX.getSettings('range')) {
                    passedRangePercents = elementorModules.utils.Scroll.getPageScrollPercentage();
                } else if (this.motionFX.getSettings('isFixedPosition')) {
                    passedRangePercents = elementorModules.utils.Scroll.getPageScrollPercentage({}, window.innerHeight);
                } else {
                    passedRangePercents = elementorModules.utils.Scroll.getElementViewportPercentage(this.motionFX.elements.$parent);
                }

                this.runCallback(passedRangePercents);
            }

        }

        exports.default = _default;

        /***/ }),

    /***/ "../modules/motion-fx/assets/js/frontend/motion-fx/motion-fx.js":
    /*!**********************************************************************!*\
      !*** ../modules/motion-fx/assets/js/frontend/motion-fx/motion-fx.js ***!
      \**********************************************************************/
    /***/ ((__unused_webpack_module, exports, __webpack_require__) => {

        "use strict";


        var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "../node_modules/@babel/runtime/helpers/interopRequireDefault.js");

        Object.defineProperty(exports, "__esModule", ({
            value: true
        }));
        exports.default = void 0;

        var _scroll = _interopRequireDefault(__webpack_require__(/*! ./interactions/scroll */ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/scroll.js"));

        var _mouseMove = _interopRequireDefault(__webpack_require__(/*! ./interactions/mouse-move */ "../modules/motion-fx/assets/js/frontend/motion-fx/interactions/mouse-move.js"));

        var _actions = _interopRequireDefault(__webpack_require__(/*! ./actions */ "../modules/motion-fx/assets/js/frontend/motion-fx/actions.js"));

        class _default extends elementorModules.ViewModule {
            getDefaultSettings() {
                return {
                    type: 'element',
                    $element: null,
                    $dimensionsElement: null,
                    addBackgroundLayerTo: null,
                    interactions: {},
                    refreshDimensions: false,
                    range: 'viewport',
                    classes: {
                        element: 'motion-fx-element',
                        parent: 'motion-fx-parent',
                        backgroundType: 'motion-fx-element-type-background',
                        container: 'motion-fx-container',
                        layer: 'motion-fx-layer',
                        perspective: 'motion-fx-perspective'
                    }
                };
            }

            bindEvents() {
                this.onWindowResize = this.onWindowResize.bind(this);
                elementorFrontend.elements.$window.on('resize', this.onWindowResize);
            }

            unbindEvents() {
                elementorFrontend.elements.$window.off('resize', this.onWindowResize);
            }

            addBackgroundLayer() {
                const settings = this.getSettings();
                this.elements.$motionFXContainer = jQuery('<div>', {
                    class: settings.classes.container
                });
                this.elements.$motionFXLayer = jQuery('<div>', {
                    class: settings.classes.layer
                });
                this.updateBackgroundLayerSize();
                this.elements.$motionFXContainer.prepend(this.elements.$motionFXLayer);
                const $addBackgroundLayerTo = settings.addBackgroundLayerTo ? this.$element.find(settings.addBackgroundLayerTo) : this.$element;
                $addBackgroundLayerTo.prepend(this.elements.$motionFXContainer);
            }

            removeBackgroundLayer() {
                this.elements.$motionFXContainer.remove();
            }

            updateBackgroundLayerSize() {
                const settings = this.getSettings(),
                    speed = {
                        x: 0,
                        y: 0
                    },
                    mouseInteraction = settings.interactions.mouseMove,
                    scrollInteraction = settings.interactions.scroll;

                if (mouseInteraction && mouseInteraction.translateXY) {
                    speed.x = mouseInteraction.translateXY.speed * 10;
                    speed.y = mouseInteraction.translateXY.speed * 10;
                }

                if (scrollInteraction) {
                    if (scrollInteraction.translateX) {
                        speed.x = scrollInteraction.translateX.speed * 10;
                    }

                    if (scrollInteraction.translateY) {
                        speed.y = scrollInteraction.translateY.speed * 10;
                    }
                }

                this.elements.$motionFXLayer.css({
                    width: 100 + speed.x + '%',
                    height: 100 + speed.y + '%'
                });
            }

            defineDimensions() {
                const $dimensionsElement = this.getSettings('$dimensionsElement') || this.$element,
                    elementOffset = $dimensionsElement.offset();
                const dimensions = {
                    elementHeight: $dimensionsElement.outerHeight(),
                    elementWidth: $dimensionsElement.outerWidth(),
                    elementTop: elementOffset.top,
                    elementLeft: elementOffset.left
                };
                dimensions.elementRange = dimensions.elementHeight + innerHeight;
                this.setSettings('dimensions', dimensions);

                if ('background' === this.getSettings('type')) {
                    this.defineBackgroundLayerDimensions();
                }
            }

            defineBackgroundLayerDimensions() {
                const dimensions = this.getSettings('dimensions');
                dimensions.layerHeight = this.elements.$motionFXLayer.height();
                dimensions.layerWidth = this.elements.$motionFXLayer.width();
                dimensions.movableX = dimensions.layerWidth - dimensions.elementWidth;
                dimensions.movableY = dimensions.layerHeight - dimensions.elementHeight;
                this.setSettings('dimensions', dimensions);
            }

            initInteractionsTypes() {
                this.interactionsTypes = {
                    scroll: _scroll.default,
                    mouseMove: _mouseMove.default
                };
            }

            prepareSpecialActions() {
                const settings = this.getSettings(),
                    hasTiltEffect = !!(settings.interactions.mouseMove && settings.interactions.mouseMove.tilt);
                this.elements.$parent.toggleClass(settings.classes.perspective, hasTiltEffect);
            }

            cleanSpecialActions() {
                const settings = this.getSettings();
                this.elements.$parent.removeClass(settings.classes.perspective);
            }

            runInteractions() {
                const settings = this.getSettings();
                this.actions.setCSSTransformVariables(settings.elementSettings);
                this.prepareSpecialActions();
                jQuery.each(settings.interactions, (interactionName, actions) => {
                    this.interactions[interactionName] = new this.interactionsTypes[interactionName]({
                        motionFX: this,
                        callback: (...args) => {
                            jQuery.each(actions, (actionName, actionData) => this.actions.runAction(actionName, actionData, ...args));
                        }
                    });
                    this.interactions[interactionName].run();
                });
            }

            destroyInteractions() {
                this.cleanSpecialActions();
                jQuery.each(this.interactions, (interactionName, interaction) => interaction.destroy());
                this.interactions = {};
            }

            refresh() {
                this.actions.setSettings(this.getSettings());

                if ('background' === this.getSettings('type')) {
                    this.updateBackgroundLayerSize();
                    this.defineBackgroundLayerDimensions();
                }

                this.actions.refresh();
                this.destroyInteractions();
                this.runInteractions();
            }

            destroy() {
                this.destroyInteractions();
                this.actions.refresh();
                const settings = this.getSettings();
                this.$element.removeClass(settings.classes.element);
                this.elements.$parent.removeClass(settings.classes.parent);

                if ('background' === settings.type) {
                    this.$element.removeClass(settings.classes.backgroundType);
                    this.removeBackgroundLayer();
                }
            }

            onInit() {
                super.onInit();
                const settings = this.getSettings();
                this.$element = settings.$element;
                this.elements.$parent = this.$element.parent();
                this.$element.addClass(settings.classes.element);
                this.elements.$parent = this.$element.parent();
                this.elements.$parent.addClass(settings.classes.parent);

                if ('background' === settings.type) {
                    this.$element.addClass(settings.classes.backgroundType);
                    this.addBackgroundLayer();
                }

                this.defineDimensions();
                settings.$targetElement = 'element' === settings.type ? this.$element : this.elements.$motionFXLayer;
                this.interactions = {};
                this.actions = new _actions.default(settings);
                this.initInteractionsTypes();
                this.runInteractions();
            }

            onWindowResize() {
                this.defineDimensions();
            }

        }

        exports.default = _default;

        /***/ }),

},
    /******/ __webpack_require__ => { // webpackRuntimeModules
        /******/ "use strict";
        /******/
        /******/ var __webpack_exec__ = (moduleId) => (__webpack_require__(__webpack_require__.s = moduleId))
        /******/ var __webpack_exports__ = (__webpack_exec__("../assets/dev/js/frontend/frontend.js"));
        /******/ }
]);
//# sourceMappingURL=frontend.js.map

