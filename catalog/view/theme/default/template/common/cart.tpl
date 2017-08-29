<?php foreach($cart as $cartItem) : ?>
    <div class="prod-cart-row" data-cart-id="<?=$cartItem['cart_id']?>">
        <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_id]" value="<?=$cartItem['product_id']; ?>">
        <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_name]" value="<?=$cartItem['name']; ?>">
        <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_price]" value="<?=$cartItem['price']; ?>">
        <input type="hidden" class="total-price-input" name="products[<?=$cartItem['product_id']; ?>][product_total_price]" value="">
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
                <input class="prod-cart-input prod-cart-count" type="text" name="products[<?=$cartItem['product_id']; ?>][product_quantity]" value="<?=$cartItem['quantity'];?>">
            </div>
        </div>

        <div class="prod-cart-col t-col-5">
            <span class="prod-cart-price"><?=$cartItem['total'];?> руб.</span>
        </div>

        <div class="prod-cart-col t-col-6">
            <a href="#" class="icon icon-close js-remove-item"></a>
        </div>
    </div>
<?php endforeach; ?>