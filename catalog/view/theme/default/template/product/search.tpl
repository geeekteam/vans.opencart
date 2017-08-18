<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

<div class="search">
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
                                            <del class="prod-old-price"><?=str_replace('.0000', '', $product['price']);?>руб.</del>
                                        <?php else: ?>
                                            <span class="prod-price"><?=str_replace('.0000', '', $product['price']);?><span>руб.</span></span>
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

<?=$footer;?>