function triggerScrollEvent(){
    var h = $(".kingsport-header-all").height();
    if($(window).scrollTop() > h){
        $("body").addClass('fixed');
        
    }
    else{
        $("body").removeClass('fixed');   
        
    }
}
jQuery(document).ready(function($) {
    triggerScrollEvent();
});

jQuery(window).scroll(function(){
    triggerScrollEvent();
});