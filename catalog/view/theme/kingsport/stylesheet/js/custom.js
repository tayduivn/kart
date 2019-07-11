function triggerScrollEvent(){
    var h = $(".kingsport-header-all").height() + $(".article-title").height();
    if($("body").hasClass('home-page')){
        var h = $(".kingsport-header-all").height() + $(".kingsport-home-1v3").height();    
    }
    if($(window).scrollTop() > h){
        $("body").addClass('fixed');
        $(".home-page .laptop-navigation-all").removeClass('active');
        
    }
    else{
        $("body").removeClass('fixed');
        $(".home-page .laptop-navigation-all").addClass('active'); 
        
    }
}

function productEqualHeight(){
    $(".product-discount .product-wrapper .product-figure-wrapper .swiper-slide-custom, .product-original-v3 .product-wrapper .tab-category .tab-panel-category .swipper-nested-product-1 .swiper-wrapper").each(function(index, el) {
        $(".swiper-slide .figure", this).matchHeight({
            byRow: false,
        });
    });
}

jQuery(document).ready(function($) {
    triggerScrollEvent();

    $(".breadcrumb li:last-child").addClass("active");
    $(".tab-content-showroom .tab-panel:first-child").addClass("active");

    productEqualHeight();
});

jQuery(window).scroll(function(){
    triggerScrollEvent();
});