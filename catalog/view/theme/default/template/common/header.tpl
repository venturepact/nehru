<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/style.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="main_outer" >
    <div id="top_outer"></div>
    <div id="mid_outer">
        <div id="wrapper">
        	<p>&nbsp;</p>
        	<div class="middle_container">
                <div id="banner">
                <div id="logo_outer">
               <?php if ($logo) { ?>
  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  <?php } ?>
                </div>
                <div id="right_border"></div>
                <div id="nav_outer">
                <ul class="head_nav">
                <?php if ($categories) { ?>
                	<?php foreach ($categories as $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?>
                    <?php 
                        	// sub categories
                        	if ($category['children']) { ?>
                            <span class="arrow_position" ><img src="image/data/red_arrow.png" alt="" /></span> 
                            <?php
                            }
                            ?>
                    		</a>
                    	<?php 
                        	// sub categories
                        	if ($category['children']) { ?>
                            <div>
                                <?php for ($i = 0; $i < count($category['children']);) { ?>
                                 <ul class="sub_nav">
                                  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                  <?php for (; $i < $j; $i++) { ?>
                                  <?php if (isset($category['children'][$i])) { ?>
                                  <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                  <?php } ?>
                                  <?php } ?>
                                </ul>
                                <?php } ?>
                              </div>
                              <?php } 
                              // end of subcategories
                              ?>
                    </li>
                <?php
                		
                	}
                }
                ?></ul>
                </div>
                <div id="nav_outer_right">
                    <ul class="right_head_nav">                    
                         <li><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
                         <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                         <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                         <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                         <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                     </ul> 
                </div>
                </div>                
                <!--Text Section -->             
                <div id="main_content">
             