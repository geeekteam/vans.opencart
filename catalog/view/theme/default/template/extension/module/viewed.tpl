<?php if (count($products) > 4) :?>
    <h2 class="site-h3-tt text-center line-tt"><span><?=$heading_title;?></span></h2>
    <div class="prod-items-carousel owl-carousel">
      <?php foreach ($products as $product): ?>
        <div class="prod-item">
            <a href="<?php echo $product['href']; ?>">
                <div class="prod-img">
                    <?php foreach($product['options'] as $option):?>
                        <?php if($option['option_id'] == 14):?>
                            <?php if (!empty(($option['value']))):?>
                                <span class="prod-discount"><?=$option['value'];?></span>
                            <?php endif;?>
                        <?php endif;?>
                    <?php endforeach;?>
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                </div>
                <div class="prod-info">
                    <span class="prod-name">
                      <?php echo $product['name']; ?>
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
                        <?php foreach($product['options'] as $option):?>
                            <?php if($option['option_id'] == 13): ?>
                                <?php foreach($option['product_option_value'] as $sizes):?>
                                    <span><?php echo($sizes['name']);?></span>
                                <?php endforeach;?>
                            <?php endif;?>
                        <?php endforeach;?>
                    </div>
                </div>
            </a>
        </div>
        <?php endforeach;?>
    </div>
<?php endif;?>