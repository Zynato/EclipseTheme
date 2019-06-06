$('document').ready(function() {
    function matchHeights() {
        $('.category-description').matchHeight();
        $('.category-info').matchHeight();
    }

    $(window).on('action:ajaxify.end', function(ev, data) {
        var url = data.url;

        if(!/^admin\//.test(data.url) && !/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            matchHeights();
        }
    });

    matchHeights();
});