jQuery(document).ready(function($) {
    $('body').addClass('js');

    var $menu = $('nav'),
        $menulink = $('#menu'),
        $wrap = $('.wrap');

    $menulink.click(function() {
        $menulink.toggleClass('active');
        $wrap.toggleClass('active');
        return false;
    });
});