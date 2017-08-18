<?php

$last_elem = end($breadcrumbs);
$special_price = (int)str_replace(' ', '', str_replace(('.00 р.'), '', $special));
$default_price = (int)str_replace(' ', '', str_replace(('.00 р.'), '', $price));
$economy_sum = $default_price - $special_price;

echo $header;
?>
<div class="service-icons-wrapp">
    <div class="container">
        <div class="service-icon-flex">
            <div class="service-icon-item">
                <div class="service-icon-inner">
                    <svg class="icon icon-airplane">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                             xlink:href="/image/svg/sprite_svg.svg#airplane-icon"></use>
                    </svg>
                </div>
                <div class="service-icon-info">
                    <span class="service-icon-name">Бесплатная доставка</span>
                    <span class="service-icon-text">При заказе от 3000 руб.</span>
                </div>
            </div>

            <div class="service-icon-item">
                <div class="service-icon-inner">
                    <svg class="icon icon-refresh">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                             xlink:href="/image/svg/sprite_svg.svg#refresh-icon"></use>
                    </svg>
                </div>
                <div class="service-icon-info">
                    <span class="service-icon-name">Возврат 365 дней</span>
                    <span class="service-icon-text">Если возникнут проблемы</span>
                </div>
            </div>

            <div class="service-icon-item">
                <div class="service-icon-inner">
                    <svg class="icon icon-shield">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                             xlink:href="/image/svg/sprite_svg.svg#shield-icon"></use>
                    </svg>
                </div>
                <div class="service-icon-info">
                    <span class="service-icon-name">Гарантия 60 дней</span>
                    <span class="service-icon-text">Пару слов о гарантии</span>
                </div>
            </div>

            <div class="service-icon-item">
                <div class="service-icon-inner">
                    <svg class="icon icon-support">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                             xlink:href="/image/svg/sprite_svg.svg#support-icon"></use>
                    </svg>
                </div>
                <div class="service-icon-info">
                    <span class="service-icon-name">Работаем 24 часа</span>
                    <span class="service-icon-text">Принимаем заказы 24/7</span>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="middle">
    <div class="container">

        <ul class="bread-crumbs">
            <?php $i = 0; foreach ($breadcrumbs as $breadcrumb): ?>
                <?php if ($i == 0):?>
                    <li><a href="/">Главная</a></li>
                <?php elseif ($last_elem !== $breadcrumb): ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php elseif ($last_elem == $breadcrumb): ?>
                    <li><?php echo $breadcrumb['text']; ?></li>
                <?php endif;?>
            <?php $i++; endforeach;?>
        </ul>
        <div class="card-wrapper group">
            <form class="card-info">
                <input type="hidden" name="product_id" value="<?=$product_id; ?>">
                <div class="card-info-offer">
                    <b>Распродажа</b> Только до <span class="js-future-date">...</span>
                </div>
                <div class="card-price-wrapp">
                    <div class="card-price-inner">
                        <?php if ($price): ?>
                            <?php if ($special): ?>
                                <span class="js-special-price card-price"><?=str_replace('.00 р.', '', $special); ?> руб.</span>
                                <del class="card-old-price"><?=str_replace('.00 р.', '', $price); ?> руб.</del>
                            <?php else: ?>
                                <span class="js-price card-price"><?=str_replace('.00 р.', '', $price); ?> руб.</span>
                            <?php endif; ?>
                            <?php endif; ?>
                        <?php foreach($options as $option):?>
                            <?php if($option['option_id'] == 14): ?>
                                <?php if (!empty(($option['value']))):?>
                                    <span class="card-discount-price"><?php echo($option['value']);?></span>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                    </div>
                    <span class="card-price-hint">Вы экономите: <?=$economy_sum; ?> РУБ.</span>
                </div>

                <div class="form-group-size">
                    <span class="form-label-min">Размер (RUS)</span>
                    <div class="prod-size">
                        <?php foreach($options as $option):?>
                            <?php if($option['option_id'] == 13): ?>
                                <?php $j = 1; foreach($option['product_option_value'] as $sizes): ;?>
                                    <div class="form-group-input-size">
                                        <input class="js-size" type="radio" name="<?=$option['product_option_id']?>" value="<?=$sizes['product_option_value_id']?>" data-size="<?php echo $sizes['name']; ?>" id="mSize<?=$j;?>">
                                        <label class="js-size-label" for="mSize<?=$j;?>"><?php echo($sizes['name']);?></label>
                                    </div>
                                <?php $j++; endforeach;?>
                            <?php endif;?>
                        <?php endforeach;?>
                    </div>
                </div>
                <a href="#" class="js-btn-buy btn btn-lg btn-max">КУПИТЬ</a>
                <ul class="card-info-service">
                    <li>
                        <i class="icon icon-card"></i>
                        <span>ОПЛАТА ПОСЛЕ ПРИМЕРКИ</span>
                    </li>
                    <li>
                        <i class="icon icon-shoes"></i>
                        <span>ДОСТАВИМ 2 ПАРЫ НА ВЫБОР</span>
                    </li>
                </ul>
            </form>

            <div class="card-img-column">
                <div class="card-head">
                    <h1 class="site-h2-tt main-titile js-title"><?=$heading_title;?></h1>
                    <span class="card-nal">
                      <i class="icon icon-check"></i>
                      <span>в наличии</span>
                    </span>
                </div>

                <div class="owl-slider-thumb-wrapp">
                    <div class="owl-slider-main owl-carousel">
                        <div><img src="<?php echo $thumb; ?>" alt=""></div>
                        <?php foreach ($images as $image) : ?>
                            <div><img src="<?php echo $image['thumb']; ?>" alt=""></div>
                        <?php endforeach;?>
                    </div>

                    <div class="owl-thumbs owl-carousel">
                        <div><img class="js-item-image" src="<?php echo $thumb; ?>" alt=""></div>
                        <?php foreach ($images as $image) : ?>
                            <div><img src="<?php echo $image['thumb']; ?>" alt=""></div>
                        <?php endforeach;?>
                    </div>
                </div>
            </div>
        </div>


        <div class="two-column-wrapp group">
            <div class="aside-column hidden-devices">
                <div class="aside-nav-banner hidden-devices">
                    <?=$column_right;?>
                </div>
            </div>
            <div class="main-column">
                <div class="section">
                    <ul class="tabs">
                        <li class="current">ОПИСАНИЕ</li>
                        <li>ОТЗЫВЫ</li>
                        <li>Как выбрать размер?</li>
                        <li>Доставка и оплата</li>
                    </ul>
                    <div class="box visible">
                        <?=$description;?>
                    </div>
                    <div class="box">
                        <div class="reviews-carousel owl-carousel">
                            <?php $i = 0; shuffle($custom_reviews['text']); foreach ($custom_reviews['text'] as $review): ?>
                            <div class="review">
                                <div class="review__photo-wrapper">
                                    <img class="review__photo" src="/image/<?=$review['image'];?>" alt="">
                                </div>
                                <div class="review__text">
                                    <?=htmlspecialchars_decode($review['description']);?>
                                </div>
                            </div>
                            <?php $i++; if($i == 4) break; endforeach; ?>
                        </div>
                    </div>
                    <div class="box">
                        <p><b>Old Skool Lite</b> - это полностью обновлённая модель классических кед Vans для
                            скейтбординга, выполненная с применением самых современных технологий для максимального
                            комфорта, повышенной гибкости и минимального веса модели. Верх из плотного канваса,
                            классическая белая полоса по бокам, дополнительная стелька в области пятки, стельки
                            UltraCush Lite для полного комфорта стопы. В модели Old Skool Lite облегчённый вес и
                            максимальный комфорт сочетаются с классической эстетикой оригинальных Old Skool. В данной
                            модели используется универсальная размерная шкала, соответствующая мужской. Для выбора
                            женского размера необходимо воспользоваться таблицей соответствия размеров.</p>
                        <p>Верх из плотного канваса, классическая белая полоса по бокам, дополнительная стелька в
                            области пятки, стельки UltraCush Lite для полного комфорта стопы. В модели Old Skool Lite
                            облегчённый вес. В данной модели используется универсальная размерная шкала, соответствующая
                            мужской.</p>
                    </div>
                    <div class="box">
                        <p><b>Old Skool Lite</b> - это полностью обновлённая модель классических кед Vans для
                            скейтбординга, выполненная с применением самых современных технологий для максимального
                            комфорта, повышенной гибкости и минимального веса модели. Верх из плотного канваса,
                            классическая белая полоса по бокам, дополнительная стелька в области пятки, стельки
                            UltraCush Lite для полного комфорта стопы. В модели Old Skool Lite облегчённый вес и
                            максимальный комфорт сочетаются с классической эстетикой оригинальных Old Skool. В данной
                            модели используется универсальная размерная шкала, соответствующая мужской. Для выбора
                            женского размера необходимо воспользоваться таблицей соответствия размеров.</p>
                        <p>Верх из плотного канваса, классическая белая полоса по бокам, дополнительная стелька в
                            области пятки, стельки UltraCush Lite для полного комфорта стопы. В модели Old Skool Lite
                            облегчённый вес. В данной модели используется универсальная размерная шкала, соответствующая
                            мужской.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="prod-wrapp">
            <?=$content_bottom;?>
        </div>
        <div class="prod-wrapp">
            <h2 class="site-h3-tt text-center line-tt"><span>Похожие товары</span></h2>
            <div class="prod-similar-items">
                <?php foreach ($products as $product): ?>
                    <div class="prod-item-wrapper">
                        <div class="prod-item">
                            <a href="<?=$product['href'];?>">
                                <div class="prod-img">
                                    <?php foreach($product['my_options'] as $option):?>
                                        <?php if($option['option_id'] == 14):?>
                                            <?php if (!empty(($option['value']))):?>
                                                <span class="prod-discount"><?=$option['value'];?></span>
                                            <?php endif;?>
                                        <?php endif;?>
                                    <?php endforeach;?>
                                    <img src="<?=$product['thumb'];?>" alt="">
                                </div>
                                <div class="prod-info">
                                    <span class="prod-name">
                                        <span><?=$product['name'];?></span>
                                    </span>
                                    <div class="prod-price">
                                        <?php if ($product['special']): ?>
                                            <del class="prod-old-price"><?=str_replace('.0000', '',$product['price']);?> руб.</del>
                                            <span class="prod-price"><?=str_replace('.00 р.', '', $product['special']);?> руб.</span>
                                        <?php else: ?>
                                            <span class="prod-price"><?=str_replace('.00 р.', '', $product['price']);?> руб.</span>
                                        <?php endif; ?>
                                    </div>
                                    <div class="prod-size">
                                        <?php foreach($options as $option):?>
                                            <?php if($option['option_id'] == 13): ?>
                                                <?php foreach(($option['product_option_value']) as $sizes):?>
                                                    <span><?php echo($sizes['name']);?></span>
                                                <?php endforeach;?>
                                            <?php endif;?>
                                        <?php endforeach;?>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

        <?=$column_left;?>

    </div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });

    $(document).ready(function () {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var vals = hashpart[1].split('-');
            for (i = 0; i < vals.length; i++) {
                $('#product').find('select option[value="' + vals[i] + '"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="' + vals[i] + '"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>
<?php echo $footer; ?>
