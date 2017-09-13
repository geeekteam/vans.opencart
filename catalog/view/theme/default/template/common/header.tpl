<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
</head>

<link href="/catalog/view/theme/default/stylesheet/main.css" rel="stylesheet">
<link href="/catalog/view/theme/default/stylesheet/custom.css" rel="stylesheet">

<script src="/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/owl.carousel.min.js" type="text/javascript" defer></script>
<script src="/catalog/view/javascript/magnific-popup.min.js" type="text/javascript" defer></script>
<script src="/catalog/view/javascript/jcf.min.js" type="text/javascript" defer></script>
<script src="/catalog/view/javascript/zoomsl-3.0.min.js" type="text/javascript" defer></script>
<script src="/catalog/view/javascript/main.js" type="text/javascript" defer></script>
<script src="/catalog/view/javascript/custom.js" type="text/javascript" defer></script>

<body>

<div id="wrapper">

    <div id="callModal" class="call-modal mfp-hide">
        <div class="modal-contacts-form">
            <form action="#" class="jqs-feedback-form" data-form-type="modal-call">
                <div class="form-group form-group-icon">
                    <i class="icon icon-inp-user"></i>
                    <input type="text" placeholder="Ваше имя" class="js-name" id="input-name">
                </div>
                <div class="form-group form-group-icon">
                    <i class="icon icon-inp-phone"></i>
                    <input type="text" placeholder="Ваш телефон" id="input-phone" class="mask-phone js-phone">
                </div>
                <button class="btn js-btn" type="submit">ОФОРМИТЬ</button>
            </form>
        </div>
    </div>

    <form action="#" id="cartModal" class="cart-modal mfp-hide jqs-send-form">
        <div class="cart-modal-inner">
            <div class="service-icon-flex">
                <div class="service-icon-item">
                    <div class="service-icon-inner">
                        <svg class="icon icon-airplane">
                            <use xlink:href="/image/svg/sprite_svg.svg#airplane-icon"></use>
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
                            <use xlink:href="/image/svg/sprite_svg.svg#refresh-icon"></use>
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
                            <use xlink:href="/image/svg/sprite_svg.svg#shield-icon"></use>
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
                            <use xlink:href="/image/svg/sprite_svg.svg#support-icon"></use>
                        </svg>
                    </div>
                    <div class="service-icon-info">
                        <span class="service-icon-name">Работаем 24 часа</span>
                        <span class="service-icon-text">Принимаем заказы 24/7</span>
                    </div>
                </div>
            </div>


            <div class="prod-cart-table" id="cart">
                <?php foreach($cart as $cartItem) : ?>
                    <div class="prod-cart-row js-prod-cart-item" data-cart-id="<?=$cartItem['cart_id']?>">
                        <input class="js-product-id" type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_id]" value="<?=$cartItem['product_id']; ?>">
                        <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_name]" value="<?=$cartItem['name']; ?>">
                        <input class="js-hidden-input-item-price" type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_price]" value="<?=$cartItem['price']; ?>">
                        <input type="hidden" class="js-hidden-input-product-size" name="products[<?=$cartItem['product_id']; ?>][product_size]">
                        <input type="hidden" class="js-hidden-input-give-some" name="products[<?=$cartItem['product_id']; ?>][give_some]">
                        <input type="hidden" class="js-hidden-input-product-quantity" value="<?=$product_quantity;?>">
                        <input type="hidden" class="js-total-price-input" name="total_price" value="">
                        <?php foreach($cartItem['option'] as $option) : ?>
                            <?php if($option['option_id'] == 13) : ?>
                                <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_comment]" value="Размер: <?=$option['value']; ?>">
                            <?php endif; ?>
                        <?php endforeach; ?>
                        <div class="prod-cart-col t-col-1">
                            <span class="prod-cart-img"><img src="/image/<?=$cartItem['image']; ?>" alt=""></span>
                        </div>

                        <div class="prod-cart-col t-col-2">
                            <span class="prod-cart-name">
                              <span><?=$cartItem['name']; ?></span>
                            </span>
                        </div>

                        <div class="prod-cart-col t-col-3">
                            <div class="prod-cart-select-wrapp">
                                <span class="prod-cart-label-select">Размер</span>
                                <select name="" id="">
                                    <?php foreach($cartItem['options'] as $option) : ?>
                                        <?php if($option['option_id'] == 13) : ?>
                                            <?php foreach($option['product_option_value'] as $optionValue) : ?>
                                            <?php $selectedOption = ($optionValue['product_option_value_id'] ==  $cartItem['option'][0]['product_option_value_id']) ? 'selected' : '';?>
                                                <option value="<?=$optionValue['product_option_value_id']; ?>" <?=$selectedOption;?>><?=$optionValue['name']; ?> </option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>

                        <div class="prod-cart-col t-col-4">
                            <div class="prod-cart-select-wrapp">
                                <span class="prod-cart-label-select">Количество</span>
                                <input class="prod-cart-input prod-cart-count js-item-count" type="text" name="products[<?=$cartItem['product_id']; ?>][product_quantity]" value="<?=$cartItem['quantity'];?>">
                            </div>
                        </div>

                        <div class="prod-cart-col t-col-5">
                            <span class="prod-cart-price js-item-price"><?=$cartItem['total'];?> руб.</span>
                        </div>

                        <div class="prod-cart-col t-col-6">
                            <a href="#" class="icon icon-close js-remove-item"></a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>

            <div class="prod-cart-table-summ">
                <div class="cart-table-del">
                    <b>Доставка:</b>
                    <span class="cart-table-del-item">
                        <input type="radio" checked id="rad1" name="delrad">
                        <label for="rad1">по Москве</label>
                    </span>
                    <span class="cart-table-del-item">
                        <input type="radio" id="rad2" name="delrad">
                        <label for="rad2">по России (+390 руб.)</label>
                    </span>
                </div>
                <div class="cart-table-summ-value">
                    <span>Итого:</span>
                    <span class="prod-cart-price total-price js-total-price"></span>
                </div>
            </div>
        </div>

        <div class="modal-contacts-form">
            <div class="form-group form-group-icon">
                <i class="icon icon-inp-user"></i>
                <input type="text" placeholder="Ваше имя" id="input-name" name="firstname" value="">
            </div>
            <div class="form-group form-group-icon">
                <i class="icon icon-inp-phone"></i>
                <input type="text" placeholder="Ваш телефон" id="input-phone" class="mask-phone" name="telephone" value="">
            </div>
            <button class="btn" type="submit">ОФОРМИТЬ</button>
        </div>
    </form>

    <div id="thanksModal" class="call-modal mfp-hide">
        <div class="modal-contacts-form">
            <h3>Спасибо!</h3>
            <p>Приветливый менеджер свяжется с Вами в ближайшее время</p>
        </div>
    </div>

    <!-- header -->
    <header id="header" class="header">
        <div class="header-panel">
            <div class="container group">
                <div class="head-work hidden-mobile">
                    <span>Ежедневно</span>
                    <svg class="icon icon-time">
                        <use xlink:href="/image/svg/sprite_svg.svg#clock-icon"></use>
                    </svg>
                    <span>10:00 - 21:00</span>
                </div>
                <ul class="head-nav">
                    <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>

                <span class="head-del hidden-devices">Бесплатная доставка при заказе от 3 000 руб. <i>*</i></span>
            </div>
        </div>

        <div class="header-info">
            <div class="container group">
                <?php if (isset($logo)): ?>
                    <div class="logo">
                        <?php if ($_SERVER['REQUEST_URI'] == '/'): ?>
                            <span style="margin-right: 20px;">
                                <img src="<?=$logo;?>" title="<?=$name;?>" alt="<?=$name;?>">
                            </span>
                        <?php else: ?>
                            <a href="<?=$home;?>">
                                <img src="<?=$logo;?>" title="<?=$name;?>" alt="<?=$name;?>">
                            </a>
                        <?php endif; ?>
                        <span class="logo-slogan"><?=$name;?></span>
                    </div>
                <?php endif; ?>
                <?php if (count($cart)<1): ?>
                    <div class="head-cart hidden">
                <?php else: ?>
                    <div class="head-cart">
                <?php endif; ?>
                        <a href="#cartModal" class="head-cart-link open-modal">
                            <svg class="icon icon-bag">
                                <use xlink:href="/image/svg/sprite_svg.svg#icon-bag"></use>
                            </svg>
                            <span class="head-cart-value js-basket-count-products"><?=count($cart);?></span>
                        </a>
                    </div>

                <div class="head-search hidden-mobile">
                    <svg class="icon h-search">
                        <use xlink:href="/image/svg/sprite_svg.svg#search-icon"></use>
                    </svg>
                    <form action="/" method="get">
                        <input type="hidden" name="route" value="product/search">
                        <input placeholder="Поиск" name="search">
                        <button type="button"></button>
                    </form>

                </div>
                <div class="head-contacts">
                    <div class="head-phone">
                        <svg class="icon icon-phone">
                            <use xlink:href="/image/svg/sprite_svg.svg#phone-icon"></use>
                        </svg>
                        <span class="head-number"><?=$telephone;?></span>
                    </div>
                    <div class="head-order"><a href="#callModal" class="open-modal">Заказать звонок</a></div>
                </div>
            </div>
        </div>
    </header>
    <!-- end header -->