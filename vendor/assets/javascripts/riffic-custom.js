jQuery(document).ready(function($) {
    $('.collection-content').css('display', 'block');

    var onMouseOutOpacity = 0.67; // initial opacity
    $('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({ // onhover styles
        mouseOutOpacity:   onMouseOutOpacity,
        mouseOverOpacity:  1.0,
        fadeSpeed:         'fast',
        exemptionSelector: '.selected'
    });
    
    var gallery = $('#thumbs').galleriffic({ // initialization of Galleriffic plugin
        delay:                     2500,
        numThumbs:                 12,
        preloadAhead:              8,
        enableTopPager:            false,
        enableBottomPager:         true,
        imageContainerSel:         '#slideshow',
        controlsContainerSel:      '#controls',
        //captionContainerSel:       '#caption',
        loadingContainerSel:       '#loading',
        renderSSControls:          true,
        renderNavControls:         true,
        playLinkText:              '',
        pauseLinkText:             '',
        prevLinkText:              '',
        nextLinkText:              '',
        nextPageLinkText:          'Next &rsaquo;',
        prevPageLinkText:          '&lsaquo; Prev',
        enableHistory:             false,
        autoStart:                 false,
        syncTransitions:           false,
        defaultTransitionDuration: 400,
        onSlideChange:             function(prevIndex, nextIndex) {
            this.find('ul.thumbs').children()
                .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
                .eq(nextIndex).fadeTo('fast', 1.0);
        },
        onPageTransitionOut:       function(callback) {
            this.fadeTo('fast', 0.0, callback);
        },
        onPageTransitionIn:        function() {
            var prevPageLink = this.find('a.prev').css('visibility', 'hidden');
            var nextPageLink = this.find('a.next').css('visibility', 'hidden');

            if (this.displayedPage > 0)
                prevPageLink.css('visibility', 'visible');

            var lastPage = this.getNumPages() - 1;
            if (this.displayedPage < lastPage)
                nextPageLink.css('visibility', 'visible');

            this.fadeTo('fast', 1.0);
        }
    });

    gallery.find('a.prev').click(function(e) { // other event handlers - Prev/Next links
        gallery.previousPage();
        e.preventDefault();
    });

    gallery.find('a.next').click(function(e) {
        gallery.nextPage();
        e.preventDefault();
    });


});