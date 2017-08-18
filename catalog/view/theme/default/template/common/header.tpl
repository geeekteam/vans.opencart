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
            <form action="#" class="js-send-form" data-form-type="modal-call">
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

    <div id="cartModal" class="cart-modal mfp-hide">
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


            <div class="prod-cart-table">
                <div class="prod-cart-row">
                    <div class="prod-cart-col t-col-1">
                        <span class="prod-cart-img"><img src="/image/prod1.jpg" alt=""></span>
                    </div>

                    <div class="prod-cart-col t-col-2">
                        <span class="prod-cart-name">
                          <span>Кеды Vans Old Skool</span>
                          <span>зеленые</span>
                        </span>
                    </div>

                    <div class="prod-cart-col t-col-3">
                        <div class="prod-cart-select-wrapp">
                            <span class="prod-cart-label-select">Размер</span>
                            <select name="" id="">
                                <option value="">41</option>
                                <option value="">42</option>
                                <option value="">43</option>
                                <option value="">44</option>
                                <option value="">45</option>
                            </select>
                        </div>
                    </div>

                    <div class="prod-cart-col t-col-4">
                        <div class="prod-cart-select-wrapp">
                            <span class="prod-cart-label-select">Количество</span>
                            <select name="" id="">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                            </select>
                        </div>
                    </div>

                    <div class="prod-cart-col t-col-5">
                        <span class="prod-cart-price">2 590 руб.</span>
                    </div>

                    <div class="prod-cart-col t-col-6">
                        <a href="#" class="icon icon-close"></a>
                    </div>
                </div>

                <div class="prod-cart-row">
                    <div class="prod-cart-col t-col-1">
                        <span class="prod-cart-img"><img class="js-cart-image" src="" alt=""></span>
                    </div>

                    <div class="prod-cart-col t-col-2">
                        <span class="prod-cart-name">
                          <span class="js-cart-name"></span>
                        </span>
                    </div>

                    <div class="prod-cart-col t-col-3">
                        <div class="prod-cart-select-wrapp">
                            <span class="prod-cart-label-select">Размер</span>
                            <select name="" id="">
                                <option value="">41</option>
                                <option value="">42</option>
                                <option value="">43</option>
                                <option value="">44</option>
                                <option value="">45</option>
                            </select>
                        </div>
                    </div>

                    <div class="prod-cart-col t-col-4">
                        <div class="prod-cart-select-wrapp">
                            <span class="prod-cart-label-select">Количество</span>
                            <select name="" id="">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                            </select>
                        </div>
                    </div>

                    <div class="prod-cart-col t-col-5">
                        <span class="prod-cart-price js-cart-price"></span>
                    </div>

                    <div class="prod-cart-col t-col-6">
                        <a href="#" class="icon icon-close"></a>
                    </div>
                </div>
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
                    <span class="prod-cart-price">4 580 руб.</span>
                </div>
            </div>
        </div>

        <div class="modal-contacts-form">
            <form action="#">
                <div class="form-group form-group-icon">
                    <i class="icon icon-inp-user"></i>
                    <input type="text" placeholder="Ваше имя" id="input-name">
                </div>
                <div class="form-group form-group-icon">
                    <i class="icon icon-inp-phone"></i>
                    <input type="text" placeholder="Ваш телефон" id="input-phone" class="mask-phone">
                </div>
                <button class="btn" type="submit">ОФОРМИТЬ</button>
            </form>
        </div>
    </div>

    <div id="thanksModal" class="call-modal mfp-hide">
        <div class="modal-contacts-form">
            <h3>Спасибо!</h3>
            <p>Наш менеджер сейчас Вам перезвонит</p>
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
                <div class="head-cart">
                    <a href="#cartModal" class="head-cart-link open-modal">
                        <svg class="icon icon-bag">
                            <use xlink:href="/image/svg/sprite_svg.svg#icon-bag"></use>
                        </svg>
                        <span class="head-cart-value">2</span>
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