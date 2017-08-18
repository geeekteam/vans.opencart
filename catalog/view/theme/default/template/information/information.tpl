<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

<div id="middle">
    <div class="darken-prtn-wrapp">
        <div class="container">
            <div class="inner-head">
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
            </div>
            <div class="row">
                <div id="content" class="<?php echo $class; ?>">
                    <?php echo $description; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
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


    <div class="about-text-wrapper group">
        <div class="about-text-column">
            <p><img src="/image/about-img.jpg" alt=""></p>
        </div>
        <div class="about-text-column">
            <h3 class="site-h4-tt">Куда обратиться, чтобы <b>купить кеды Vans?</b></h3>
            <p>Данный бренд отличается высокой популярностью. Его выбирают звезды кино и эстрады, что сделало стильные
                кеды невероятно популярными среди жителей всей планеты. Хотите внести разнообразия в собственный образ?
                Желаете быть в тренде постоянно? Поверьте, Converse созданы для вас!</p>
            <p>Но где приобрести кеды Конверс? Официальный интернет-магазин – лучшее решение! Мы предлагаем широкий
                ассортимент моделей, которые уже в наличии на нашем складе. Вы получаете разумную экономию, огромный
                выбор и оперативную доставку по всей России!</p>
        </div>
    </div>

    <div class="about-text-wrapper group">
        <div class="about-text-column">
            <p>Вы яркая личность, стремящаяся всегда выглядеть стильно? Значит, универсальные Converse – лучшее
                дополнение вашего образа. Ведь кеды уже давно стали не просто защитой для ног, а неотъемлемой частью
                имиджа: яркие и современные, невероятно удобные и не теряющие актуальности! Конверсы отличаются своей
                дерзостью и аутентичностью. Ни один производитель не сумел повторить успех данной марки! Хотите
                выделяться из серой массы? Обращайтесь! К нам только что поступила новая коллекция обуви!</p>
            <h4 class="site-h6-tt"><b>Ванс кеды:</b> экскурс в историю</h4>
            <p>Данный бренд появился в 1908 году в городке Молден (Массачусетс, Соединенные Штаты Америки). Основателем
                компании является М. Конверс, чьим именем, собственно, и стал называться бренд. Но в те годы мало кто
                думал о том, чтобы купить кеды Конверс, официальный сайт бренда найти – ведь фирма занималась
                производством семейной продукции.</p>
        </div>
        <div class="about-text-column">
            <p>Данный бренд отличается высокой популярностью. Его выбирают звезды кино и эстрады, что сделало стильные
                кеды невероятно популярными среди жителей всей планеты. Хотите внести разнообразия в собственный образ?
                Желаете быть в тренде постоянно? Поверьте, Converse созданы для вас! Но где приобрести кеды Конверс?
                Официальный интернет-магазин – лучшее решение! Мы предлагаем широкий ассортимент моделей, которые уже в
                наличии на нашем складе. Вы получаете разумную экономию, огромный выбор и оперативную доставку по всей
                России!</p>
            <h4 class="site-h6-tt">Куда обратиться, чтобы <b>купить кеды Vans?</b></h4>
            <p>В 1936 году бренд удивляет общественность новым хитом, ставшим настоящим фирменным знаком компании –
                смайл на кедах! Автором этого творения стал знаменитый теннисист Д. Персел. Благодаря ему теперь все
                ищут для покупки кед Converse дисконт (в Москве и других городах мира).</p>
        </div>
    </div>
</div>
</div><!-- #middle-->


<div class="page-buffer"></div>
</div><!-- #wrapper -->


<?php echo $footer; ?>