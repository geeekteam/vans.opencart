<?php foreach ($products as $product):?>
    <?php if ($product['product_id'] == 55):?>
        <div class="main-banner-wrapper">
            <div class="main-banner-info">
                <div class="container">
                    <h1>
                        <span>Оригинальные кеды vans</span>
                        <span>со скидкой 60% только до <span class="js-future-date">...</span></span>
                    </h1>
                    <div class="main-banner-flex">
                        <div class="main-banner-prod">
                            <img src="<?=($product['thumb']); ?>" alt="<?=($product['name']); ?>">
                            <div class="m-banner-price-wrapp">
                                <?php foreach($product['options'] as $option):?>
                                    <?php if($option['option_id'] == 14):?>
                                        <?php if (!empty(($option['value']))):?>
                                            <span class="m-banner-discount">
                                                <span><?=$option['value'];?></span>
                                            </span>
                                        <?php endif;?>
                                    <?php endif;?>
                                <?php endforeach;?>

                                <?php if($product['special']): ?>
                                    <span class="m-banner-price"><?=str_replace('.00 р.', '', $product['special']);?><span> руб.</span></span>
                                    <del class="m-banner-old-price"><?=str_replace('.00 р.', '', $product['price']);?> руб.</del>
                                <?php else: ?>
                                    <span class="m-banner-price"><?=str_replace('.00 р.', '', $product['price']);?><span> руб.</span></span>
                                <?php endif; ?>
                            </div>
                        </div>

                        <form action="/" method="post" class="main-banner-buy jqs-send-main-form" data-form-type="main-banner">
                            <?php if($product['name']): ?>
                            <span class="m-banner-prod-tt">
                                <?=$product['name'];?>
                            </span>
                            <?php endif; ?>
                            <div class="form-group form-group-icon">
                                <i class="icon icon-inp-user"></i>
                                <input id="input-name" type="text" placeholder="Ваше имя" name="firstname">
                            </div>
                            <div class="form-group form-group-icon">
                                <i class="icon icon-inp-phone"></i>
                                <input id="input-phone" type="text" placeholder="Ваш телефон" class="mask-phone" name="telephone">
                            </div>
                            <div class="form-group-size">
                                <span class="form-label-min">Размер (RUS)</span>
                                <?php foreach($product['options'] as $option):?>
                                    <?php if($option['option_id'] == 13): ?>
                                        <?php $j = 0; foreach(($option['product_option_value']) as $sizes):?>
                                            <div class="form-group-input-size">
                                                <input type="radio" name="product_size" value="<?=$sizes['product_option_value_id']?>" data-size="<?php echo $sizes['name']; ?>" id="mSize<?=$j;?>">
                                                <label class="jq-product-size-label" for="mSize<?=$j;?>"><?php echo($sizes['name']);?></label>
                                            </div>
                                        <?php $j++; endforeach;?>
                                    <?php endif;?>
                                <?php endforeach;?>
                            </div>
                            <input type="hidden" name="products[<?=$product['product_id']; ?>][product_id]" value="<?=$product['product_id']; ?>">
                            <input type="hidden" name="products[<?=$product['product_id']; ?>][product_name]" value="<?=$product['name']; ?>">
                            <input type="hidden" name="products[<?=$product['product_id']; ?>][product_price]" value="<?=$product['special']; ?>">
                            <button class="btn btn-lg btn-max" type="submit">КУПИТЬ</button>
                        </form>
                        <div class="thanks js-thanks">
                            <h3>Спасибо за покупку!</h3>
                            <p>Приветливый менеджер свяжется с Вами в ближайшее время</p>
                            <span class="js-close-thanks btn btn-lg btn-sm">Хорошо</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php endif;?>
<?php endforeach;?>