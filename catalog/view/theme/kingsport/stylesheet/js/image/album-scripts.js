jQuery(document).ready(function ($) {
    var $container_isotope = $('#album_container');
    var iso;
    var initShow = 7; //number of images loaded on init & onclick load more button
     var counter = initShow; //counter for load more button
    $container_isotope.append('<div class="preloader"><i class="fa fa-cog fa-spin"></i></div>');
    $container_isotope.imagesLoaded(function ($images, $proper, $broken) {
        $container_isotope.isotope({
            itemSelector: '.album-item',
            percentPosition: true,
            masonry: {
                columnWidth: '.grid-sizer'
            }
        });
        $container_isotope.isotope('layout');
        $container_isotope.find('.preloader i').css('display', 'none');
        $container_isotope.children('.preloader').css('opacity', 0).delay(900).fadeOut();


        //****************************
          // Isotope Load more button
          //****************************
          
         
          iso = $container_isotope.data('isotope'); // get Isotope instance

          loadMore(initShow); //execute function onload

          //append load more button
          $container_isotope.after('<div class="product-title-wrapper"><div class="row"><div class="col-12"><div class="view-more" id="view-more"><a class="btn-load-more" href="#">Xem thêm</a></div></div></div></div>');

          //when load more button clicked
          $(".btn-load-more").click(function() {
            if ($('#filters').data('clicked')) {
              //when filter button clicked, set initial value for counter
              counter = initShow;
              j$('#filters').data('clicked', false);
            } else {
              counter = counter;
            };

            counter = counter + initShow;

            loadMore(counter);
            return false;
          });



    });
    function loadMore(toShow) {
        $container_isotope.find(".hide").removeClass("hide");

        var hiddenElems = iso.filteredItems.slice(toShow, iso.filteredItems.length).map(function(item) {
          return item.element;
        });
        $(hiddenElems).addClass('hide');
        $container_isotope.isotope('layout');

        //when no more to load, hide show more button
        if (hiddenElems.length == 0) {
          $(".view-more").hide();
        } 
        else {
          $(".view-more").show();
        };

    }

          


  

















});