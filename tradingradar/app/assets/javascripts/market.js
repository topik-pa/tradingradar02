$(document).ready(function () {
    if ($('.market').length) {

        var $wrapper = $('.search-by-first-letter');
        var $table = $('.js-table');
        
        $('.search-by-first-letter a').click(function(event) {
            
            event.preventDefault();  

            $wrapper.find('.current').removeClass('current');
            $(this).addClass('current');

            var url = $(this).attr('href');
            url += '&ajax=1';

            
            $table.addClass('loading');
            $table.find('table').html('');

            $.ajax({
                url: url,
                data: 'text/xml',
                type: 'get',
                success: function (data) {
                    $table.html(data);
                    $table.removeClass('loading');
                    $table.addClass('loaded');
                },
                error: function () {
                    console.error('Unable to perform request');
                    $table.addClass('error');
                }
            });
        });
	}
});