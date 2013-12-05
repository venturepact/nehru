<?php echo $header; ?>
<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/fractionslider.css" type="text/css" />
<script src="catalog/view/javascript/jquery.min.js" type="text/javascript" /></script>
<script src="catalog/view/javascript/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="catalog/view/javascript/main.js" type="text/javascript" charset="utf-8"></script>
<script src="catalog/view/javascript/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>
<script>
$(document).ready(function(){
	
	$('.test').click(function(){
		
		$('.sub_nav1').slideToggle(500);
					
	});
	
});
</script>
<style>
#content{width:100% !important;}
</style>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><div id="slider_outer">
                    <div class="slider-wrapper">
                        <div class="responisve-container">
                            <div class="slider">
                                <div class="fs_loader"></div>
                                <div class="slide">
                                    <p class="claim light-green large_text_size" 			
                                    data-position="30,30" data-in="top" data-step="1" data-out="top" data-ease-in="easeOutBounce" data-delay="">fashion<br> redefined </p>
                                    <p class="teaser turky "		
                                    data-position="165,365" data-in="left" data-step="2" data-delay="" data-out="none">
                                    The stylish rich in design royal look.<br/> Best of the ethnic cotton fabric</p>
                                    <p class="teaser turky  "		
                                    data-position="210,365" data-in="left" data-step="3" data-delay="" data-out="none">
                                    <a href="#" class="white_button z_set" >shop now!</a></p>
                                    
                                    <img src="image/data/banner.png" data-position="20,330" data-in="topLeft" data-delay="" data-out="" class="bg_img">
                                    
                                    <p class="claim turky large_text_size "			
                                    data-position="80,400" data-in="top" data-step="4" data-out="top" data-ease-in="easeOutBounce" data-delay="">winter<br/> 2014 </p>
                                    <p class="teaser turky text_style "		
                                    data-position="212,740," data-in="left" data-step="5" data-delay="" data-out="none">collection</p>
                                    <p class="teaser turky "		
                                    data-position="165,845" data-in="left" data-step="6" data-delay="" data-out="none">
                                    <a href="#" class="white_button" >view collection!</a></p>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                <!--Text Section -->
                <div class="large_text">
                	taking the tradition ahead 
                </div>
                <div class="text_border"><img src="image/data/text_border.png" alt="border" /></div>
                <div class="small_text">
                You have access to a wide variety of resources that will help you make the most of your Adobe software. Some of these resources are installed on your computer during the setup process; additional helpful samples and documents are included on the installation or content. 
                </div>
                <!--Text Section End -->
                </div>
<?php echo $footer; ?>