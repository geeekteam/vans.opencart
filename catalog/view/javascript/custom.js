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

$closeThanksBtn.click(function () {
    $thanks.removeClass('active');
    $sendForm.removeClass('hidden');
});

var getCartAddedNewProduct = function($product_id, callback) {
    $.post('/?route=checkout/checkout/single', {product_id: $product_id}, function(response) {
        callback(response);
    });
};

var $basketCountProducts = $('.js-basket-count-products'),
    productsCountInCart = $('#cartModal').find('.js-prod-cart-item').length;

$(document).on('click', '.js-btn-buy', function (e) {
    e.preventDefault();

    var $buyBtn = $(this),
        $form = $buyBtn.closest('form'),
        $itemsCount = $('.head-cart-value');

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
                $('#cartModal').find('#cart').load('?route=common/header/info .js-prod-cart-item');
                setTimeout(function () {
                    $.magnificPopup.open({
                        items: {
                            src: '#cartModal'
                        },
                        callbacks: {
                            beforeOpen: function () {
                                var itemsCount = $('#cartModal').find('.js-prod-cart-item').length;
                                $itemsCount.html(itemsCount);
                            }
                        }
                    });
                    jcf.replaceAll();
                    totalPrice();
                    if ($('.head-cart').hasClass('hidden'))
                        $('.head-cart').removeClass('hidden');
                }, 250)
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

$(document).on('submit', '.jqs-send-form', function (e) {
    e.preventDefault();
    var $form = $(this),
        data = {products: {}},
        $phone = $form.find('#input-phone');

    productSize();
    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');
        $.each($form.serializeArray(), function (index, input) {
            if (input.name.indexOf('products[') > -1) {
                var slitedInput = input.name.split(']['),
                    productId = slitedInput[0].replace('products[', ''),
                    fieldName = slitedInput[1].replace(']', '');

                if (data.products[productId] === undefined)
                    data.products[productId] = {};

                data.products[productId][fieldName] = input.value;
            } else {
                data[input.name] = input.value;
            }
        });

        addOrder(data, function (response) {
            // console.log(response);
        });

        $.magnificPopup.close({
            items: {
                src: '#cartModal'
            }
        });
        $.magnificPopup.open({
            items: {
                src: '#thanksModal'
            }
        });
        clearForm();
    } else {
        $phone.css('border', '1px solid red');
    }
});

$(document).on('submit', '.jqs-send-main-form', function (e) {
    e.preventDefault();
    var $form = $(this),
        data = {products: {}},
        $phone = $form.find('#input-phone');
    productSize();
    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');
        $.each($form.serializeArray(), function (index, input) {
            if (input.name.indexOf('products[') > -1) {
                var slitedInput = input.name.split(']['),
                    productId = slitedInput[0].replace('products[', ''),
                    fieldName = slitedInput[1].replace(']', '');

                if (data.products[productId] === undefined)
                    data.products[productId] = {};

                data.products[productId][fieldName] = input.value;
            } else {
                data[input.name] = input.value;
            }
        });

        addOrder(data, function (response) {
            console.log(response);
        });

        console.log(data);

        $form.addClass('hidden');
        $('.js-thanks').css('display','block');
        clearForm();
    } else {
        $phone.css('border', '1px solid red');
    }
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

$(document).on('submit', '.jqs-feedback-form', function (e) {
    e.preventDefault();
    var $form = $(this),
        data = {},
        $name = $form.find('#input-name'),
        $phone = $form.find('#input-phone');

    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');

        data['firstname'] = $name.val();
        data['telephone'] = $phone.val();

        sendFeedback(data, function (response) {
            // console.log(response);
        });

        $.magnificPopup.close({
            items: {
                src: '#feedback'
            }
        });
        $.magnificPopup.open({
            items: {
                src: '#thanksModal'
            }
        });

        clearFeedbackForm();
    } else {
        $phone.css('border', '1px solid red');
    }
});

function sendFeedback(data, callback) {
    var $form = $('.jqs-feeback-form');
    $.ajax({
        url: 'index.php?route=checkout/confirm/sendFeedback',
        type: 'post',
        data: data,
        dataType: 'json',
        success: function (response) {
            callback(response);
        }
    });
}

function clearForm() {
    var $form = $('#cartModal');

    $form.find('.js-prod-cart-item').each(function () {
        var cart_id = $(this).attr('data-cart-id');
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + cart_id,
            dataType: 'json',
            success: function () {
                $basketCountProducts.html(0);
            }
        });
        $form.find('input').val('');
        $(this).remove();
        if (!$('.head-cart').hasClass('hidden'))
            $('.head-cart').addClass('hidden');
    });
}

$(document).on('click', '.js-close-thanks', function () {
    var $form = $('.jqs-send-main-form'),
        $thanks = $('.js-thanks');

    $thanks.css('display', 'none');
    $form.find('input').val('');
    $form.find('.jcf-radio').removeClass('jcf-checked');
    $form.find('.jcf-radio').addClass('jcf-unchecked');
    $form.find('.jq-product-size-label').removeClass('jcf-label-active');
    $form.removeClass('hidden');
});

function productSize() {
    var $form = $('#cartModal'),
        $items = $form.find('.js-prod-cart-item');
    $items.each(function () {
        var currentSize = $(this).find('.js-select-size .jcf-select-text span').html(),
            inputSize = $(this).find('.js-hidden-input-product-size'),
            giveSome = $(this).find('.js-give-some .jcf-label-active').html(),
            inputGiveSome = $(this).find('.js-hidden-input-give-some');
        inputSize.val(currentSize);
        inputGiveSome.val(giveSome);
    });
}

function totalPrice() {
    var $form = $('#cartModal'),
        $items = $form.find('.js-prod-cart-item'),
        $totalPriceSpan = $form.find('.total-price'),
        $totalPriceInput = $form.find('.total-price-input'),
        totalPrice = 0;

    $items.each(function () {
        var price = parseInt($(this).find('.prod-cart-price').html()),
            count = parseInt($(this).find('.prod-cart-count').val());
        totalPrice += price*count;
    });
    $totalPriceSpan.html(totalPrice + ' руб.');
    $totalPriceInput.val(totalPrice);
}

function removeItem(item) {
    var cart_id = item.attr('data-cart-id'),
        itemsCount = $('#cartModal').find('.js-prod-cart-item').length;
    if (itemsCount > 1) {
            item.remove();
            $.ajax({
                url: 'index.php?route=checkout/cart/remove',
                type: 'post',
                data: 'key=' + cart_id,
                dataType: 'json',
                success: function () {
                    $basketCountProducts.html(itemsCount - 1);
                }
            });
        // Удалить товар из списка и закрыть корзину, если товар единственный
    } else if (itemsCount === 1) {
        $.magnificPopup.close({
            items: {
                src: '#cartModal'
            }
        });
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + cart_id,
            dataType: 'json',
            success: function () {
                $basketCountProducts.html(itemsCount - 1);
                item.remove();
                if (!$('.head-cart').hasClass('hidden'))
                    $('.head-cart').addClass('hidden');
            }
        });
    }
}

function totalPrice() {
    var $form = $('#cartModal'),
        $items = $form.find('.js-prod-cart-item'),
        $totalPriceSpan = $form.find('.js-total-price'),
        $totalPriceInput = $form.find('.js-total-price-input'),
        totalPrice = 0;
    $items.each(function () {
        var price = parseInt($(this).find('.js-item-price').html()),
            count = parseInt($(this).find('.js-item-count').val());
        totalPrice += price;
    });
    $totalPriceSpan.html(totalPrice + ' руб.');
    $totalPriceInput.val(totalPrice);
}

function itemPrice(item) {
    var count = item.find('.js-item-count').val(),
        priceSpan = item.find('.js-item-price'),
        price = item.find('.js-hidden-input-item-price').val(),
        totalPrice = 0;
    totalPrice += count * price;
    priceSpan.html(totalPrice + ' руб. ')
}

$(document).on('click', '.js-remove-item', function () {
    var $item = $(this).closest('.js-prod-cart-item');
    itemPrice($item);
    removeItem($item);
    totalPrice();
});


$('.prod-cart-count').on('focusout', function () {
    var $item = $(this).closest('.js-prod-cart-item');
    itemPrice($item);
    totalPrice();
});

$('.head-cart-link').on('click', function () {
    totalPrice();
});

/*function customerValues() {
    var $form = $('#cartModal'),
        $customerName = $form.find('#input-name'),
        $customerPhone = $form.find('#input-phone');
    $customerName.on('focusout', function () {
        $(this).value($(this.val()))
    });
    $customerPhone.on('focusout', function () {
        $(this).value($(this.val()))
    });
}*/

// customerValues();