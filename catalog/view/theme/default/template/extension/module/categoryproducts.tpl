<div class="prod-wrapp prodFromCat" id="goDown">
    <h2 class="js-category-name site-h3-tt text-center">
        <?=$heading_title;?>
    </h2>
    <div class="prod-items prodList" data-category="<?=$heading_title;?>">
        <?php $count = 0;
        foreach($products as $product):
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

<?php if($maxPage > 1) : ?>
<div class="js-show-more" data-category="<?=$heading_title;?>" data-max-page="3" data-url="/"></div>

<div id="fountainG" style="display: none;">
    <div id="fountainG_1" class="fountainG"></div>
    <div id="fountainG_2" class="fountainG"></div>
    <div id="fountainG_3" class="fountainG"></div>
    <div id="fountainG_4" class="fountainG"></div>
    <div id="fountainG_5" class="fountainG"></div>
    <div id="fountainG_6" class="fountainG"></div>
    <div id="fountainG_7" class="fountainG"></div>
    <div id="fountainG_8" class="fountainG"></div>
</div>

<style type="text/css">
    #fountainG{
        position:relative;
        width:114px;
        height:14px;
        margin:auto;
    }

    .fountainG{
        position:absolute;
        top:0;
        background-color:rgb(0,0,0);
        width:14px;
        height:14px;
        animation-name:bounce_fountainG;
        -o-animation-name:bounce_fountainG;
        -ms-animation-name:bounce_fountainG;
        -webkit-animation-name:bounce_fountainG;
        -moz-animation-name:bounce_fountainG;
        animation-duration:1.5s;
        -o-animation-duration:1.5s;
        -ms-animation-duration:1.5s;
        -webkit-animation-duration:1.5s;
        -moz-animation-duration:1.5s;
        animation-iteration-count:infinite;
        -o-animation-iteration-count:infinite;
        -ms-animation-iteration-count:infinite;
        -webkit-animation-iteration-count:infinite;
        -moz-animation-iteration-count:infinite;
        animation-direction:normal;
        -o-animation-direction:normal;
        -ms-animation-direction:normal;
        -webkit-animation-direction:normal;
        -moz-animation-direction:normal;
        transform:scale(.3);
        -o-transform:scale(.3);
        -ms-transform:scale(.3);
        -webkit-transform:scale(.3);
        -moz-transform:scale(.3);
        border-radius:9px;
        -o-border-radius:9px;
        -ms-border-radius:9px;
        -webkit-border-radius:9px;
        -moz-border-radius:9px;
    }

    #fountainG_1{
        left:0;
        animation-delay:0.6s;
        -o-animation-delay:0.6s;
        -ms-animation-delay:0.6s;
        -webkit-animation-delay:0.6s;
        -moz-animation-delay:0.6s;
    }

    #fountainG_2{
        left:14px;
        animation-delay:0.75s;
        -o-animation-delay:0.75s;
        -ms-animation-delay:0.75s;
        -webkit-animation-delay:0.75s;
        -moz-animation-delay:0.75s;
    }

    #fountainG_3{
        left:28px;
        animation-delay:0.9s;
        -o-animation-delay:0.9s;
        -ms-animation-delay:0.9s;
        -webkit-animation-delay:0.9s;
        -moz-animation-delay:0.9s;
    }

    #fountainG_4{
        left:43px;
        animation-delay:1.05s;
        -o-animation-delay:1.05s;
        -ms-animation-delay:1.05s;
        -webkit-animation-delay:1.05s;
        -moz-animation-delay:1.05s;
    }

    #fountainG_5{
        left:57px;
        animation-delay:1.2s;
        -o-animation-delay:1.2s;
        -ms-animation-delay:1.2s;
        -webkit-animation-delay:1.2s;
        -moz-animation-delay:1.2s;
    }

    #fountainG_6{
        left:71px;
        animation-delay:1.35s;
        -o-animation-delay:1.35s;
        -ms-animation-delay:1.35s;
        -webkit-animation-delay:1.35s;
        -moz-animation-delay:1.35s;
    }

    #fountainG_7{
        left:85px;
        animation-delay:1.5s;
        -o-animation-delay:1.5s;
        -ms-animation-delay:1.5s;
        -webkit-animation-delay:1.5s;
        -moz-animation-delay:1.5s;
    }

    #fountainG_8{
        left:100px;
        animation-delay:1.64s;
        -o-animation-delay:1.64s;
        -ms-animation-delay:1.64s;
        -webkit-animation-delay:1.64s;
        -moz-animation-delay:1.64s;
    }



    @keyframes bounce_fountainG{
        0%{
            transform:scale(1);
            background-color:rgb(0,0,0);
        }

        100%{
            transform:scale(.3);
            background-color:rgb(255,255,255);
        }
    }

    @-o-keyframes bounce_fountainG{
        0%{
            -o-transform:scale(1);
            background-color:rgb(0,0,0);
        }

        100%{
            -o-transform:scale(.3);
            background-color:rgb(255,255,255);
        }
    }

    @-ms-keyframes bounce_fountainG{
        0%{
            -ms-transform:scale(1);
            background-color:rgb(0,0,0);
        }

        100%{
            -ms-transform:scale(.3);
            background-color:rgb(255,255,255);
        }
    }

    @-webkit-keyframes bounce_fountainG{
        0%{
            -webkit-transform:scale(1);
            background-color:rgb(0,0,0);
        }

        100%{
            -webkit-transform:scale(.3);
            background-color:rgb(255,255,255);
        }
    }

    @-moz-keyframes bounce_fountainG{
        0%{
            -moz-transform:scale(1);
            background-color:rgb(0,0,0);
        }

        100%{
            -moz-transform:scale(.3);
            background-color:rgb(255,255,255);
        }
    }
</style>

<?php endif; ?>