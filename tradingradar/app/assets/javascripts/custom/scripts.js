var TRADINGRADAR = (function () {
    var _pageData = {};
    var $inputElem, $mainContainer;

    return {

        init: function () {
            $inputElem = $('#pagedata');
            $mainContainer = $('.page');
            if ($inputElem.length > 0) {
                _pageData.isin = $inputElem.data('isin');
                _pageData.controller = $inputElem.data('controller');
            }
        },

        getPageData: function () {
            return _pageData;
        },

        addValueToTheHiddenInput: function () {
            var $select = $mainContainer.find('#follow_stock_newsletter_isin');
            if($select.length) {
                $hiddenInput = $('input[name="follow_stock_newsletter[stock]"]');
                $('body').on('change', $select, function() {
                    var $options = $(this).find("option:selected");
                    value = '';
                    $hiddenInput.val(value);
                    $options.each(function() {                        
                        if($(this).val() !== '') {
                            value += $(this).text();
                        }
                    });
                    $hiddenInput.val(value);
                });
            } 
        },

        loadSources: function () {
            
            var sourcesPromise = new Promise(function (resolve, reject) {
                var isin = TRADINGRADAR.getPageData().isin;
                
                var $destinations = $mainContainer.find('.pr-section');
                var count = 0;

                $destinations.each(function (index, elem) {
                    var datasource = $(elem).data().source;
                    var url = '/press_release/' + datasource + '?isin=' + isin;

                    //var currentSource = $(this).parents('.ext-source').attr('id');
                    var $currentAnchor = $('.anchors').find('.anchor[data-refers="' + datasource + '"]');
                    //var $target = $(this);

                    $.ajax({
                        url: url,
                        data: 'text/html',
                        type: 'get',
                        success: function (data) {
                            var externalContent = $(data).html();
                            $(elem).append(externalContent);
                            $(elem).addClass('loaded');
                            $currentAnchor.removeClass('loading');
                            $currentAnchor.addClass('ready');
                        },
                        error: function () {
                            console.error('Unable to perform request');
                            $(elem).addClass('error');
                            $currentAnchor.removeClass('loading');
                            $currentAnchor.addClass('error');
                        },
                        complete: function () {
                            count++;
                            if (count == $destinations.length) {
                                resolve();
                            }
                        }
                    });
                });

            }).then(function () {
                //Then another task...
                TRADINGRADAR.changeRootUrls();
            }).catch(function (err) {
                console.error(err);
            });
        },


        changeRootUrls: function() {
            $mainContainer.find('.pr-section').each(function() {
                var originalRootUrl = $(this).find('input[name="url-swap"]').val();
                var links = $(this).find('a');
                links.each(function() {
                    var originalHref = $(this).attr('href');
                    var newHref = originalRootUrl + originalHref;
                    $(this).attr('href', newHref);
                    $(this).attr('target', '_blank');
                });
            });
        },


        initScrollTo: function() {
            $mainContainer.find('[data-scrollTo]').click(function(e) {
                e.preventDefault();                
                var hash = '#'+this.dataset.scrollto;
                $('html, body').animate({
                    scrollTop: ( $(hash).offset().top - 110 )
                  }, 800, function(){               
                    window.location.hash = hash;
                  });
            });
        },


        privacy: function () {

            checkCookie('cookiePrivacyAccepted');

            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires="+d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }
            
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for(var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                        c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                        return c.substring(name.length, c.length);
                    }
                }
                return "";
            }
            
            
            function checkCookie(cname) {
                var name = getCookie(cname);
                if (name === "") {
                    $mainContainer.find('#modalPrivacy').modal({});
                }
            }    
            
            $mainContainer.find('#accept-cookie-policy').click(function(e) {
                e.preventDefault();
                setCookie('cookiePrivacyAccepted','true', 90);
                $mainContainer.find('#modalPrivacy').modal('hide');
            });
        },


        transformValue: function() {
            $mainContainer.find('.transform').each(function() {

                var type = $(this)[0].dataset.type;
                var classValue;

                switch (type) {
                    case 'resistance':
                        var price = $(this)[0].dataset.price;
                        var resistance = $(this)[0].dataset.resistance;                            
                        var result = ((resistance - price)/(price/100)).toFixed(2);
                        classValue = Math.sign(result)===1 ? "emph" : "emph strong";
                        var $otherStuff = $('<span>(&euro; ' + resistance + ')</span>');
                        $(this).html(result + '&percnt;&nbsp;').addClass(classValue);  
                        $(this).parent().append($otherStuff);                      
                    break;
                    case 'rating':
                        var rating = $(this)[0].dataset.rating;
                        var max = $(this)[0].dataset.max;

                        if(isNaN(rating) ) {
                            switch (rating[0]) {
                                case 'A':
                                    rating = 5;
                                    break;
                                case 'B':
                                    rating = 4;
                                    break;
                                case 'C':
                                    rating = 3;
                                    break;
                                case 'D':
                                    rating = 2;
                                    break;
                                case 'E':
                                    rating = 1;
                                    break;
                            
                                default:
                                    break;
                            }
                        }

                        if(max == 5 || max == 4) rating--;

                        var $image = $('<img>', { 
                            src : "https://s3.eu-west-3.amazonaws.com/tradingradar/icons/rank-fta" + rating + ".gif", 
                            width : 24, 
                            height : 24
                        });
                        $(this).html('&nbsp;/' + max);
                        $(this).prepend($image);
                                         
                    break;
                
                    default:
                        break;
                }



            });
        },  

    };

}());



$(document).ready(function () {

    TRADINGRADAR.init();

    TRADINGRADAR.addValueToTheHiddenInput();

    TRADINGRADAR.initScrollTo();

    TRADINGRADAR.privacy();

});
