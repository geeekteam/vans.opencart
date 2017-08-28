$('.reviews-carousel').owlCarousel({
    loop: true,
    nav: true,
    dots: false,
    autoplay: false,
    mouseDrag: false,
    items: 2,
    responsive: {
        0: {
            items: 1
        },
        480: {
            items: 2
        }
    }
});

function futureDate() {
    var dateSpan = $('.js-future-date'),
        futureDate = new Date(),
        options = {
            month: 'long',
            day: 'numeric'
        };
    futureDate.setDate(futureDate.getDate() + 2);
    futureDate = futureDate.toLocaleString("ru", options);
    dateSpan.html(futureDate + '!').css('display', 'inline-block');
}


function scrollToTop() {
    var scrollButton = $('.js-scroll-top');

    scrollButton.hide();

    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 700) {
                scrollButton.fadeIn("slow");
            } else {
                scrollButton.fadeOut("slow");
            }
        })
    });

    scrollButton.click(function () {
        $("html, body").animate({scrollTop: 0}, "slow");
        return false;
    });
}

var page = 1;
var loadPage = false;

$(function () {
    var currentState = history.state;
    for (const key in currentState) {
        if (currentState[key] && currentState[key].contentProducts) {
            $('.prodList[data-category="' + key + '"]').html('');
            $('.prodList[data-category="' + key + '"]').append(currentState[key].contentProducts);
            page = currentState[key].page;
        }
    }
    var $showMore = $('.js-show-more');
    if ($showMore.length) {

        $showMore.each(function () {
            var $newShowMore = $(this);
            var maxPage = $newShowMore.data('max-page');
            var url = $newShowMore.data('max-url');
            var category = $newShowMore.data('category');
            $(document).on('scroll', function () {

                if (maxPage > page && $(this).scrollTop() >= $newShowMore.position().top - 700 && !loadPage) {
                    loadPage = true;
                    $('#fountainG').show();
                    page++;

                    $.ajax({
                        url: url,
                        data: {page: page},
                        success: function (data) {
                            $(data).find('.prodList[data-category="' + category + '"] .prod-item-wrapper[data-category="' + category + '"]').each(function () {
                                $('.prodList[data-category="' + category + '"]').append(this);

                            });

                            var state = {};

                            state[category] = {
                                contentProducts: $('.prodList[data-category="' + category + '"]').html(),
                                page: page
                            };

                            history.replaceState(state, location.href, location.href);

                            loadPage = false;
                            $('#fountainG').hide();
                        }
                    })

                }
            });
        })
    }

    $('.goBack').on('click', function () {
        if (history.length > 2) {
            window.history.go(-1);
            return false;
        }
    });

});


scrollToTop();
futureDate();

function validatePhone(phoneNumber) {
    var phoneNumberPattern = /((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{8,10}/;
    return phoneNumberPattern.test(phoneNumber);
}

var $sendForm = $('.js-send-form'),
    $thanks = $('.js-thanks'),
    $thanksModal = $('.thanks-modal'),
    $closeThanksBtn = $('.js-close-thanks');

/*$sendForm.each(function () {
    var $this = $(this);
    if ($this.data('form-type') === 'main-banner') {
        $this.submit(function (t) {
            t.preventDefault();
            var $cphone = $this.find('.js-phone'),
                $cname = 'Заказ товара от: ' + $this.find('.js-name').val(),
                $title = $this.find('.js-title').val(),
                $price = $this.find('.js-price').val(),
                $size = $this.find('.js-size[type=radio]:checked').attr('data-size'),
                $productId = $this.find('.js-product-id').val(),
                $button = $this.find('.js-btn');
            if (validatePhone($cphone.val()) == true) {
                $cphone.removeAttr('style');
                var order = 'cphone=' + $cphone.val() + '&iname=' + $cname + '&ititle=' + $title + '&iprice=' + $price + '&ipriceTotal=' + $price + '&prid=' + $productId + '&isize=' + $size;
                $.ajax({
                    url: 'index.php?route=checkout/cart/addorder',
                    type: 'post',
                    data: order,
                    dataType: 'json',
                    beforeSend: function () {
                        $button.text('Отправка...');
                    },
                    complete: function () {
                        $button.text('Купить');
                    },
                    success: function (json) {
                        if (json['error']) {
                            if (json['error']['phone']) {
                                $cphone.css('border', '1px solid red');
                            }
                        }
                        $cphone.removeAttr('style');
                        $this.addClass('hidden');
                        $thanks.addClass('active');
                    }
                });
            } else {
                $cphone.css('border', '1px solid red');
            }
        })
    }

    if ($this.data('form-type') === 'modal-call') {
        $this.submit(function (t) {
            t.preventDefault();
            var $cphone = $this.find('.js-phone'),
                $cname = 'Заказ звонка от: ' + $this.find('.js-name').val(),
                $button = $this.find('.js-btn');
            if (validatePhone($cphone.val()) == true) {
                $cphone.removeAttr('style');
                var order = 'cphone=' + $cphone.val() + '&iname=' + $cname;
                $.ajax({
                    url: 'index.php?route=checkout/cart/addorder',
                    type: 'post',
                    data: order,
                    dataType: 'json',
                    beforeSend: function () {
                        $button.text('Отправка...');
                    },
                    complete: function () {
                        $button.text('Оформить');
                    },
                    success: function (json) {
                        if (json['error']) {
                            if (json['error']['phone']) {
                                $cphone.css('border', '1px solid red');
                            }
                        }
                        $cphone.removeAttr('style');
                        $.magnificPopup.close();
                        $.magnificPopup.open({
                            items: {
                                src: '#thanksModal',
                                type: 'inline'
                            }
                        })
                    }
                });
            } else {
                $cphone.css('border', '1px solid red');
            }
        })
    }
});*/


$closeThanksBtn.click(function () {
    $thanks.removeClass('active');
    $sendForm.removeClass('hidden');
});

// function buy() {
    /*var $buyButton = $('.js-btn-buy');
    $buyButton.click(function () {
        var $cart = $('.cart-modal'),
            $cartTable = $cart.find('.prod-cart-table'),
            $cartProduct = $cartTable.find('.prod-cart-row').first(),
            $image = $('.js-item-image'),
            $name = $('.js-title'),
            $size = $('.js-size[type=radio]:checked').attr('data-size'),
            $specialPrice = $('.js-special-price'),
            $price = $('.js-price');
        console.log($name.html());
        console.log();
        console.log($image.attr('src'));
        console.log();
        console.log($size);
        console.log();
        console.log($specialPrice.html());
        console.log();
        console.log($price.html());
        console.log();
        console.log($cartTable);
        console.log();
        console.log($cartProduct);

        $cartProduct.clone().appendTo($cartTable);

        var $lastCartProduct = $cartTable.find('.prod-cart-row').last(),
            $lastCartProductImage = $lastCartProduct.find('.js-cart-image').attr('src'),
            $lastCartProductName = $lastCartProduct.find('.js-cart-name').html(),
            $lastCartProductPrice = $lastCartProduct.find('.')
            ;
        console.log();
        console.log($lastCartProduct);


    })*/
// }

var getCartAddedNewProduct = function($product_id, callback) {
    $.post('/?route=checkout/checkout/single', {product_id: $product_id}, function(response) {
        callback(response);
    });
};

$('.js-btn-buy').click(function(e) {
    e.preventDefault();

    var $buyBtn = $(this),
        $form = $buyBtn.closest('form');

    var data = {
        option: {}
    };

    $.each($form.serializeArray(), function(key, input) {
        if(input.name === 'product_id') data[input.name] = input.value;
        else data['option'][input.name] = input.value;
    });

    $.post('/?route=checkout/cart/add', data, function(response) {
        // Error
        if(response.error !== undefined) {

        }

        // Success
        if(response.success !== undefined) {
            getCartAddedNewProduct(data.product_id, function(productIncart) {
                var product = productIncart.product;


            });
        }
    });
});

$(document).on('submit', '.jq-send-form', function(e) {
    e.preventDefault();

    var $form = $(this),
        tempData = {},
        data = [];

    $.each($form.serializeArray(), function(key, input) {
        tempData[input.name] = input.value;
    });

    data.push(tempData);

    addOrder(data, function(response) {
        console.log(response);
    });
});

$(document).on('submit', '.jqs-send-form', function(e) {
    e.preventDefault();

    var $form = $(this),
        tempData = {},
        data = [];

    $.each($form.serializeArray(), function(key, input) {
        if(input.name.indexOf('][') > -1) {
            var slitedInput = input.name.split('][');
            tempData[slitedInput[1].replace(']', '')] = input.value;
        }

    });

    data.push(tempData);

    console.log(data);

    /*addOrder(data, function(response) {
        console.log(response);
    });*/
});

function addOrder(data, callback) {
    $.ajax({
        url: 'index.php?route=checkout/confirm/addFromMain',
        type: 'post',
        data: data,
        dataType: 'json',
        success: function (response) {
            callback(response);
        }
    });

}