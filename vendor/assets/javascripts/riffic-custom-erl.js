jQuery(document).ready(function($) {
    $('.collection-content').css('display', 'block');

    
    var gallery = $('#thumbs').galleriffic({ // initialization of Galleriffic plugin
        delay:                     2500,
        numThumbs:                 1,
        preloadAhead:              6,
        enableTopPager:            false,
        enableBottomPager:         true,
        imageContainerSel:         '#slideshow',
        controlsContainerSel:      '#controls',
        captionContainerSel:       '#caption',
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
        defaultTransitionDuration: 200,

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