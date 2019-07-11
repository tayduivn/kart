"use strict";

function asyncProductDiscount() {
    new Swiper("#swiper-product-deal-best-sell-nested-2v2", {
        direction: "horizontal",
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: ".swiper-pagination-product-discount-2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    }), new Swiper("#swiper-product-deal-coming-nested-2v2", {
        direction: "horizontal",
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: ".swiper-pagination-product-discount-3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    });
}

function newsSideToggle() {
    $(".sidebar-toggle").click(function() {
        $(".sidebar-index-wrappper").slideToggle();
    }), $(".have-children-2 a").each(function() {
        $(this).click(function(e) {
            e.stopPropagation(), $(this).siblings("ul").slideToggle();
        });
    });
}

function slideToggle() {
    $(".sidebar-menu > li.have-children > a").click(function(e) {
        e.preventDefault(), $(this).parent().hasClass("active") ? ($(this).next().slideToggle(500), 
        $(".sidebar-menu li").removeClass("active")) : ($(".sidebar-menu li ul").slideUp(500), 
        $(this).next().slideToggle(500), $(".sidebar-menu li").removeClass("active"), $(this).parent().addClass("active"));
    });
}

function hamburgerMobileActive() {
    var e = document.querySelector(".hamburger-mobile");
    e.addEventListener("click", function() {
        e.classList.toggle("is-active"), $("#wrapper").toggleClass("active"), $(".sidebar-menu li").removeClass("active"), 
        $(".sidebar-menu li ul").slideUp().stop();
    });
}

function hamburgerLaptopActive() {
    var e = $(".hamburger-laptop");
    e.on("click", function(i) {
        e.toggleClass("is-active"), $(".laptop-navigation-all").toggleClass("active");
    });
}

function mobileHomeslide() {
    new Swiper("#swiper-home-slide", {
        loop: !0,
        speed: 600,
        slidesPerView: 1,
        effect: "fade",
        fadeEffect: {
            crossFade: !0
        },
        draggable: !0,
        iOSEdgeSwipeDetection: !0,
        breakpointsInverse: !0,
        longSwipesMs: 900,
        autoplay: {
            delay: 3e3
        }
    });
}

function mobileNav() {
    new Swiper("#swiper-mobile-nav", {
        loop: !1,
        speed: 600,
        draggable: !0,
        iOSEdgeSwipeDetection: !0,
        breakpointsInverse: !0,
        longSwipesMs: 900,
        breakpoints: {
            0: {
                slidesPerView: 4.5,
                spaceBetween: 0
            },
            576: {
                slidesPerView: 5.5,
                spaceBetween: 0
            },
            768: {
                slidesPerView: 6.5,
                spaceBetween: 0
            }
        }
    });
}

function hotlineSelectOption() {
    $(".hotline-contact-option").click(function() {
        $(this).toggleClass("open"), $(".hotline-option", this).toggleClass("open");
    }), $(".hotline-option li").click(function() {
        var e = $(this).text(), i = $(this).attr("data-value");
        $(".default-hotline-option span").text(e), $(".hotline-contact-option").attr("data-selected-value", i);
    });
}

function headerSelectLocation() {
    $(".location-contact-options").click(function() {
        $(this).toggleClass("open"), $(".options", this).toggleClass("open");
    }), $(".options li").click(function() {
        var e = $(this).text(), i = $(this).attr("data-value");
        $(".default-select-options span").text(e), $(".location-contact-options").attr("data-selected-value", i);
    });
}

function productRecentlyInit() {
    new Swiper("#product-recently-init", {
        navigation: {
            nextEl: ".button-next-recent",
            prevEl: ".button-prev-recent"
        },
        pagination: {
            el: ".swiper-pagination-product-recently",
            type: "bullets"
        },
        clickable: !0,
        draggable: !0,
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 5
            },
            992: {
                slidesPerView: 4
            },
            1200: {
                slidesPerView: 5
            }
        }
    });
}

function swiperDiscountInit() {
    $(".swiper-slide-custom").each(function(index, el) {
        var ethis = $(this);
        new Swiper(ethis, {
        direction: "horizontal",
        simulateTouch:false,
        navigation: {
            nextEl: $(".button-next",ethis),
            prevEl: $(".button-prev",ethis)
        },
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: $(".swiper-pagination",ethis.next()),
            type: "bullets"
        },
        paginationClickable: !0,
        breakpointsInverse: !0,
        clickable: !0,
        draggable: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    })    
    });

    $(".swipper-nested-product-1").each(function(index, el) {
        var ethis = $(this);
        new Swiper(ethis, {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: false,
        clickable: !0,
        draggable: !0,
        navigation: {
            nextEl: $(".button-next-product",ethis),
            prevEl: $(".button-prev-product",ethis)
        },
        pagination: {
            el: $(".swiper-pagination",ethis.next()),
            type: "bullets"
        },
        paginationClickable: !0,
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                //simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    });
    });

    /*new Swiper("#swiper-product-deal-nested-2v2", {
        direction: "horizontal",
        simulateTouch:false,
        navigation: {
            nextEl: "#swiper-product-deal-nested-2v2 .button-next",
            prevEl: "#swiper-product-deal-nested-2v2 .button-prev"
        },
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: ".swiper-pagination-product-discount",
            type: "bullets"
        },
        breakpointsInverse: !0,
        clickable: !0,
        draggable: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    }), new Swiper("#swiper-product-deal-best-sell-nested-2v2", {
        direction: "horizontal",
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: ".swiper-pagination-product-discount-2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    }), new Swiper("#swiper-product-deal-coming-nested-2v2", {
        direction: "horizontal",
        slidesPerView: 4,
        slidesPerColumn: 1.5,
        spaceBetween: 1,
        pagination: {
            el: ".swiper-pagination-product-discount-3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1
            },
            576: {
                slidesPerView: 2,
                spaceBetween: 5,
                slidesPerColumn: 1.5
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    });*/
}

function tabActiveProductDiscount() {
    $("ul#product-discount li a").on("click", function() {
        $(this).parents("ul#product-discount").find("li").removeClass("active"), $(this).parents("ul#product-discount li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $(".tab-panel").removeClass("active"), $("#" + e).addClass("active");
    });
}

function productSwiperOriginInit() {
   /*new Swiper("#swiper-nested-1v1", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-1v1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-1v2", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-1v2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-1v3", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-1v3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-1v4", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-1v4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-2v1", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-2v1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-2v2", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-2v2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-2v3", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-2v3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-2v4", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-2v4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-3v1", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-3v1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-3v2", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-3v2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-3v3", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-3v3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-3v4", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-3v4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-4v1", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-4v1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-4v2", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-4v2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-4v3", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-4v3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-4v4", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-4v4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-5v1", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-5v1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-5v2", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-5v2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-5v3", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-5v3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    }), new Swiper("#swiper-nested-5v4", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-product-5v4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    });*/
}

function tabActiveCategory1() {
    $("ul#category-mega-nav-1 li a").on("click", function() {
        $(this).parents("ul#category-mega-nav-1").find("li").removeClass("active"), $(this).parents("ul#category-mega-nav-1 li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $("#tab-product-wrapper-1 > .tab-panel-category").removeClass("active"), 
        $("#tab-product-wrapper-1 > #" + e).addClass("active");
    });
}

function tabActiveCategory2() {
    $("ul#category-mega-nav-2 li a").on("click", function() {
        $(this).parents("ul#category-mega-nav-2").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $("#tab-product-wrapper-2 > .tab-panel-category").removeClass("active"), 
        $("#tab-product-wrapper-2 > #" + e).addClass("active");
    });
}

function tabActiveCategory3() {
    $("ul#category-mega-nav-3 li a").on("click", function() {
        $(this).parents("ul#category-mega-nav-3").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $("#tab-product-wrapper-3 > .tab-panel-category").removeClass("active"), 
        $("#tab-product-wrapper-3 > #" + e).addClass("active");
    });
}

function tabActiveCategory4() {
    $("ul#category-mega-nav-4 li a").on("click", function() {
        $(this).parents("ul#category-mega-nav-4").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $("#tab-product-wrapper-4 > .tab-panel-category").removeClass("active"), 
        $("#tab-product-wrapper-4 > #" + e).addClass("active");
    });
}

function tabActiveCategory5() {
    $("ul#category-mega-nav-5 li a").on("click", function() {
        $(this).parents("ul#category-mega-nav-5").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $("#tab-product-wrapper-5 > .tab-panel-category").removeClass("active"), 
        $("#tab-product-wrapper-5 > #" + e).addClass("active"), productSwiperOriginInit();
    });
}

function multiRowProductToday() {
    new Swiper("#product-today-slider", {
        slidesPerView: 4,
        slidesPerColumn: 2,
        spaceBetween: 10,
        // pagination: {
        //     el: ".swiper-pagination-product-today",
        //     clickable: !0
        // },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 1,
                slidesPerColumn: 2
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2
            },
            992: {
                slidesPerView: 3,
                slidesPerColumn: 2
            },
            1200: {
                slidesPerView: 4,
                slidesPerColumn: 2
            }
        }
    });
}

function tabActiveNewsVanillaJS() {
    $("ul#news-navigation li a").on("click", function() {
        $(this).parents("ul").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        $(".tab-panel-news").removeClass("active"), $("#" + e).addClass("active"), newsSwiper();
    });
}

function newsSwiper() {
    new Swiper("#news-swiper-1", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-1",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-2", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-2",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-3", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-3",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-4", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-4",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-5", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-5",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-6", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-6",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    }), new Swiper("#news-swiper-7", {
        paginationClickable: !0,
        direction: "horizontal",
        spaceBetween: 30,
        slidesPerView: 4,
        navigation: {
            nextEl: ".button-next-news",
            prevEl: ".button-prev-news"
        },
        pagination: {
            el: ".swiper-pagination-news-7",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 10
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1200: {
                slidesPerView: 4,
                spaceBetween: 40
            }
        }
    });
}

function triggerMobileNews() {
    $(".select-news-mobile-options").click(function() {
        $(this).toggleClass("open"), $(".options", this).toggleClass("open");
    }), $(".options li").click(function() {
        var e = $(this).text(), i = $(this).attr("data-value");
        $(".default-select-options span").text(e), $(".select-news-mobile-options").attr("data-selected-value", i);
    });
}

function displayNewsSelectOption() {
    $("#newsMobileSelectedOption li").on("click", function() {
        var e = $(this).attr("data-value-selected");
        console.log(e), $(".tab-panel-news").removeClass("active"), $("#" + e).addClass("active");
    });
}

function mapLocation() {
    var e = new Swiper("#map-showroom-navigation", {
        slidesPerView: "auto",
        spaceBetween: 0,
        freeMode: !0,
        watchSlidesVisibility: !0,
        watchSlidesProgress: !0,
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 1,
                virtualTranslate: !1,
                freeMode: !1,
                centeredSlides: !1,
                draggable: !0,
                simulateTouch: !0
            },
            768: {
                slidesPerView: "auto",
                virtualTranslate: !0,
                loop: !1,
                draggable: !1
            }
        },
        virtualTranslate: !0,
        slideToClickedSlide: !0,
        autoHeight: !0
    });
    new Swiper("#map-showroom-address", {
        spaceBetween: 0,
        navigation: {
            nextEl: ".button-next-map",
            prevEl: ".button-prev-map"
        },
        thumbs: {
            effect: "fade",
            crossFade: "true",
            swiper: e
        }
    });
}

function triggerMobileFooterSelect() {
    $(".footer-mobile-contact-options").click(function() {
        $(this).toggleClass("open"), $(".options", this).toggleClass("open");
    }), $(".options li").click(function() {
        var e = $(this).text(), i = $(this).attr("data-value");
        $(".default-select-options span").text(e), $(".footer-mobile-contact-options").attr("data-selected-value", i);
    });
}

function displayFooterSelectOption() {
    $("#footerMobileSelectedOption li").on("click", function() {
        var e = $(this).attr("data-value-selected");
        console.log(e), $(".mb-option").removeClass("active-selected"), $("#" + e).addClass("active-selected");
    });
}

function tabShowRoomActive() {
    $("nav.top-nav-showroom ul li a").on("click", function() {
        $(this).parents("nav.top-nav-showroom ul").find("li").removeClass("active"), $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        console.log(e), $(".tab-content-showroom > .tab-panel").removeClass("active"), $(".tab-content-showroom > ." + e).addClass("active");
    });
}

function productDetailSwiperThumbnail() {
    var e = new Swiper(".swiper-product-thumbs", {
        spaceBetween: 20,
        freeMode: !0,
        slidesPerView: 4,
        watchSlidesVisibility: !0,
        watchSlidesProgress: !0,
        breakpoints: {
            768: {
                slidesPerView: 3
            }
        }
    });
    new Swiper(".swiper-product-top", {
        spaceBetween: 10,
        navigation: {
            nextEl: ".product-detail-button-next",
            prevEl: ".product-detail-button-prev"
        },
        thumbs: {
            swiper: e
        }
    });
}

function productInformationShowMore() {
    var e = document.getElementById("show-more-information"), i = document.getElementById("article-information");
    e.onclick = function() {
        "open" == i.className ? (i.className = "", e.innerHTML = "Đọc thêm") : (i.className = "open", 
        e.innerHTML = "Thu gọn");
    };
}

function tabProductDetailActive() {
    $(".product-specification ul.nav-tab li a").on("click", function() {
        $(this).parents(".product-specification ul.nav-tab").find("li").removeClass("active"), 
        $(this).parents("li").addClass("active");
        var e = $(this).attr("data-type");
        $(".tab-content-product-detail > .tab-panel-product-detail").removeClass("active"), 
        $(".tab-content-product-detail > ." + e).addClass("active"), productSwiperOriginInit();
    });
}

function swiperOtherProduct() {
    new Swiper(".swiper-other-product-inclue", {
        lazy: !0,
        preloadImages: !1,
        watchSlidesVisibility: !0,
        direction: "horizontal",
        slidesPerColumn: 1,
        observer: !0,
        observeParents: !0,
        observeSlideChildren: !0,
        simulateTouch: !0,
        navigation: {
            nextEl: ".button-next-product",
            prevEl: ".button-prev-product"
        },
        pagination: {
            el: ".swiper-pagination-other-product",
            type: "bullets"
        },
        breakpointsInverse: !0,
        breakpoints: {
            0: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5
            },
            576: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            768: {
                slidesPerView: 2,
                slidesPerColumn: 2,
                spaceBetween: 5,
                centeredSlides: !1
            },
            992: {
                slidesPerView: 3,
                spaceBetween: 5,
                centeredSlides: !1
            },
            1200: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 3,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            },
            1600: {
                touchEventsTarget: ".figure",
                simulateTouch: !0,
                draggable: !0,
                slidesPerView: 4,
                grabCursor: !0,
                spaceBetween: 0,
                centeredSlides: !1
            }
        }
    });
}

function otherProductSidebar() {
    new Swiper(".swiper-prodcut-detail-sidebar", {
        direction: "vertical",
        slidesPerView: 4,
        autoplay: {
            delay: 1500
        },
        speed: 700,
        loop: !0,
        breakpoints: {
            1200: {
                direction: "horizontal",
                spaceBetween: 10,
                slidesPerView: 2
            },
            576: {
                direction: "horizontal",
                spaceBetween: 10,
                slidesPerView: 1
            }
        }
    });
}

function prodcutInputQuantityIncreament() {
    $(".btn-number").click(function(e) {
        e.preventDefault();
        var i = $(this).attr("data-field"), t = $(this).attr("data-type"), s = $("input[name='" + i + "']"), n = parseInt(s.val());
        isNaN(n) ? s.val(0) : "minus" == t ? (n > s.attr("min") && s.val(n - 1).change(), 
        parseInt(s.val()) == s.attr("min") && $(this).attr("disabled", !0)) : "plus" == t && (n < s.attr("max") && s.val(n + 1).change(), 
        parseInt(s.val()) == s.attr("max") && $(this).attr("disabled", !0));
    }), $(".product-details-quantity").change(function() {
        var e = parseInt($(this).attr("min")), i = parseInt($(this).attr("max")), t = parseInt($(this).val()), s = $(this).attr("name");
        t >= e ? $(".btn-number[data-type='minus'][data-field='" + s + "']").removeAttr("disabled") : $(this).val($(this).data("oldValue")), 
        t <= i ? $(".btn-number[data-type='plus'][data-field='" + s + "']").removeAttr("disabled") : $(this).val($(this).data("oldValue"));
    });
}

document.addEventListener("DOMContentLoaded", function(e) {
    //asyncProductDiscount();
}), document.addEventListener("DOMContentLoaded", function(e) {
    newsSideToggle(), slideToggle(), hotlineSelectOption(), headerSelectLocation(), 
    hamburgerLaptopActive(), hamburgerMobileActive(), mobileHomeslide(), mobileNav(), 
    productRecentlyInit(), swiperDiscountInit(), tabActiveProductDiscount(), productSwiperOriginInit(), 
    tabActiveCategory1(), tabActiveCategory2(), tabActiveCategory3(), tabActiveCategory4(), 
    tabActiveCategory5(), multiRowProductToday(), tabActiveNewsVanillaJS(), newsSwiper(), 
    triggerMobileNews(), displayNewsSelectOption(), mapLocation(), triggerMobileFooterSelect(), 
    displayFooterSelectOption(), tabShowRoomActive(), prodcutInputQuantityIncreament(), 
    productDetailSwiperThumbnail(), productInformationShowMore(), tabProductDetailActive(), 
    swiperOtherProduct(), otherProductSidebar();
}), $(window).resize(function() {
    var e = $("#social-network").width();
    $("#social-network").html('<div class="fb-page" data-href="https://www.facebook.com/kingsportvietnam/" data-width="' + e + '" data-height="250" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/kingsportvietnam/"><a href="https://www.facebook.com/kingsportvietnam/">Facebook</a></blockquote></div></div>'), 
    FB.XFBML.parse();
}), function(e, i) {
    i(function() {
        i(".ripple").on("click", function(t) {
            t.preventDefault();
            var s = i("<div/>"), n = i(this).offset(), r = t.pageX - n.left, a = t.pageY - n.top;
            s.addClass("ripple-effect");
            var l = i(".ripple-effect");
            l.css("height", i(this).height()), l.css("width", i(this).height()), s.css({
                top: a - l.height() / 2,
                left: r - l.width() / 2,
                background: i(this).data("ripple-color")
            }).appendTo(i(this)), e.setTimeout(function() {
                s.remove();
            }, 2e3);
        });
    });
}(window, jQuery);
//# sourceMappingURL=main.min.js.map