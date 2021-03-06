<div class="prod-wrapp">
    <div class="prod-items">
        <?php $count = 0;
        foreach($products as $product):
        $count++; ?>
        <div class="prod-item-wrapper" data-count="<?=$count;?>">
            <div class="prod-item">
                <a href="<?=$product['href'];?>">
                    <div class="prod-img">
                        <?php
/*                            echo $discount_price = intval(str_replace('.00р.', '', (str_replace(' ', '', $product['special']))));
                            echo $old_price = intval(str_replace('.00р.', '', (str_replace(' ', '', $product['price']))))
                        */?>
                        <?php /*if(isset($product['special'])): */?><!--
                            <span class="prod-discount"><?/*=intval(100-($discount_price*100)/$old_price);*/?>%</span>
                        --><?php /*endif; */?>
                        <img src="<?=$product['thumb'];?>" alt="">
                    </div>
                    <div class="prod-info">
                            <span class="prod-name">
                                <span><?=$product['name'];?></span>
                            </span>
                        <div class="prod-price">
                            <?php if($product['special']): ?>
                            <span class="prod-price"><?=str_replace('.00 р.', '', $product['special']);?>
                                <span>руб.</span></span>
                            <del class="prod-old-price"><?=str_replace('.00 р.', '', $product['price']);?>руб.</del>
                            <?php else: ?>
                            <span class="prod-price"><?=str_replace('.00 р.', '', $product['price']);?><span>руб.</span></span>
                            <?php endif; ?>
                        </div>
                        <div class="prod-size">
                            <?php foreach($product['options'] as $option):?>
                                <?php if($option['option_id'] == 13): ?>
                                    <?php foreach(array_reverse($option['product_option_value']) as $sizes):?>
                                        <span><?php echo($sizes['name']);?></span>
                                    <?php endforeach;?>
                                <?php endif;?>
                            <?php endforeach;?>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <?php endforeach;?>
    </div>
</div>