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
jQuery(document).ready(function($) {
    triggerScrollEvent();
});

jQuery(window).scroll(function(){
    triggerScrollEvent();
});