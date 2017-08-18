<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

<div id="middle">
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
            <h1 class="site-h2-tt main-titile"><?=$heading_title;?></h1>
        </div>

        <div class="banner-info">
            <div class="banner-info-img hidden-devices">
                <img src="<?php echo $thumb;?>" alt="">
            </div>
            <div class="banner-text">
                <?=$description;?>
            </div>
        </div>


        <div class="two-column-wrapp">
            <div class="aside-column">
                <div class="aside-nav">
                    <ul class="aside-nav-first">
                        <li><a href="/vans-old-skool">Кеды Vans Old School</a></li>
                        <li><a href="/vans-slip-on">Vans Slip-On</a></li>
                        <li><a href="/vans-authentic">Vans Authentic</a></li>
                        <li><a href="/vans-era">Vans Era</a></li>
                        <li><a href="/vans-sk8-hi">Vans SK8-HI</a></li>
                    </ul>
                    <ul class="aside-nav-second">
                        <li><a href="/vysokie-kedy">Высокие кеды</a></li>
                        <li><a href="/kedy">Кеды</a></li>
                        <li><a href="/krossovki">Кроссовки</a></li>
                        <li><a href="/detskie-kedy">Детские кеды</a></li>
                        <li><a href="/futbolki">Футболки</a></li>
                        <li><a href="/golovnye-ubory">Головные уборы</a></li>
                    </ul>
                </div>

                <div class="aside-nav-banner hidden-devices">
                    <a href="#"><img src="../image/aside-banner-1.jpg" alt=""></a>
                </div>
            </div>

            <div class="main-column">
                <div class="prod-wrapp prodFromCat" id="goDown">
                    <h2 class="site-h3-tt text-center"><?=$heading_title;?></h2>
                    <div class="prod-items">
                        <?php $count = 0;
                        foreach ($products as $product):
                        $count++; ?>
                            <div class="prod-item-wrapper item" data-category="<?=$heading_title;?>">
                                <div class="prod-item">
                                    <a href="<?=$product['href'];?>">
                                        <div class="prod-img">
                                            <?php foreach($product['options'] as $option):?>
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
                                                <?php if($product['special']): ?>
                                                    <span class="prod-price"><?=str_replace('.00 р.', '', $product['special']);?><span>руб.</span></span>
                                                    <del class="prod-old-price"><?=str_replace('.00 р.', '', $product['price']);?>руб.</del>
                                                <?php else: ?>
                                                    <span class="prod-price"><?=str_replace('.00 р.', '', $product['price']);?><span>руб.</span></span>
                                                <?php endif; ?>
                                            </div>
                                            <div class="prod-size">
                                                <?php foreach($product['options'] as $option):?>
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
            </div>
        </div>
    </div>
</div>

<?=$content_bottom;?>

<?php echo $footer; ?>
