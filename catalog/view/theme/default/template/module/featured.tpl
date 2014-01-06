<div class="product-list" id='featured'>
    <?php    
   foreach($products as $product) { ?>
  
    <div class="product">
                                <?php if ($product['thumb']) { ?>
                               
                               <a href="<?php echo $product['href']; ?>" class="product_img"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
      				<?php } ?>
                                <div class="product_details">
                                    <div class="product_title"><?php echo $product['name'];?></div>
                                    <div class="product_info">
                                    <?php if ($product['price']) { ?>
                                        <div class="price_detail">
                                            
                                            <?php if (!$product['special']) { ?>
        										<span><?php echo $product['price']; ?></span>                                        	<?php } else { ?>
                                                <span class="price-old"><?php echo $product['price']; ?></span>
                                                <span class="price-new"><?php echo $product['special']; ?></span>
        									<?php } ?>                                            
                                        </div>
                                        <?php } ?>
                                        <div class="cart_btn">  <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                                        <div class="add_detail">
                                            <!--<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>-->
                                            <!--<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
    <?php } ?>
  </div>