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

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vans-old-skool')): ?>
                            <li><a class="active-link">Кеды Vans Old School</a></li>
                        <?php else: ?>
                            <li><a href="/vans-old-skool">Кеды Vans Old School</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vans-slip-on')): ?>
                            <li><a class="active-link">Vans Slip-On</a></li>
                        <?php else: ?>
                            <li><a href="/vans-slip-on">Vans Slip-On</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vans-authentic')): ?>
                            <li><a class="active-link">Vans Authentic</a></li>
                        <?php else: ?>
                            <li><a href="/vans-authentic">Vans Authentic</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vans-era')): ?>
                            <li><a class="active-link">Vans Era</a></li>
                        <?php else: ?>
                            <li><a href="/vans-era">Vans Era</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vans-sk8-hi')): ?>
                            <li><a class="active-link">Vans SK8-HI</a></li>
                        <?php else: ?>
                            <li><a href="/vans-sk8-hi">Vans SK8-HI</a></li>
                        <?php endif; ?>
                    </ul>
                    <ul class="aside-nav-second">
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vysokie-kedy')): ?>
                            <li><a class="active-link">Высокие кеды</a></li>
                        <?php else: ?>
                            <li><a href="/vysokie-kedy">Высокие кеды</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'kedy')): ?>
                            <li><a class="active-link">Кеды</a></li>
                        <?php else: ?>
                            <li><a href="/kedy">Кеды</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'krossovki')): ?>
                            <li><a class="active-link">Кроссовки</a></li>
                        <?php else: ?>
                            <li><a href="/krossovki">Кроссовки</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'detskie-kedy')): ?>
                            <li><a class="active-link">Детские кеды</a></li>
                        <?php else: ?>
                            <li><a href="/detskie-kedy">Детские кеды</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'futbolki')): ?>
                            <li><a class="active-link">Футболки</a></li>
                        <?php else: ?>
                            <li><a href="/futbolki">Футболки</a></li>
                        <?php endif; ?>

                        <?php if (strpos($_SERVER['REQUEST_URI'], 'golovnye-ubory')): ?>
                            <li><a class="active-link">Головные уборы</a></li>
                        <?php else: ?>
                            <li><a href="/golovnye-ubory">Головные уборы</a></li>
                        <?php endif; ?>
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
                                            <?php
                                                $discount_price = intval(str_replace('.00р.', '', (str_replace(' ', '', $product['special']))));
                                                $old_price = intval(str_replace('.00р.', '', (str_replace(' ', '', $product['price']))))
                                            ?>
                                            <?php if($product['special']): ?>
                                                <span class="prod-discount"><?=intval(100-($discount_price*100)/$old_price);?>%</span>
                                            <?php endif; ?>
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

<div class="container">
    <?=$description_bottom; ?>
</div>



<?//=$content_bottom;?>

<?php echo $footer; ?>
