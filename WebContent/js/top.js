 window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
    var $element = matchMedia("screen and (min-width: 786px)").matches ? document.getElementById("scrollTopBtn") : document.getElementById("scrollTopBtnMob");
    $element.style.display = (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) ? 'block' : 'none';
    }
    
    function topFunction() {
        $('html,body').animate({ scrollTop: 0 }, 500);
    }