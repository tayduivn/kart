function triggerScrollEvent(){
    var h = $(".kingsport-header-all").height();
    if($(window).scrollTop() > h){
        $("body").addClass('fixed');
        $(".home-page .laptop-navigation-all").removeClass('active');
        
    }
    else{
        $("body").removeClass('fixed');
        $(".home-page .laptop-navigation-all").addClass('active'); 
        
    }
}
jQuery(document).ready(function($) {
    triggerScrollEvent();
});

jQuery(window).scroll(function(){
    triggerScrollEvent();
});