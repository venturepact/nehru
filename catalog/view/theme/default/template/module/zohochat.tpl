<?php
// -------------------------------
// Zoho Sliding Chat for OpenCart 
// By Best-Byte
// www.best-byte.com
// -------------------------------
?>
<?php if ($slide) { ?>
<?php if ($position) { ?>
<div id="slidingchat_container" style="bottom: 0px; left: 25px; position: fixed; width: 243px; z-index: 999999;">
<?php } else { ?>
<div id="slidingchat_container" style="bottom: 0px; right: 25px; position: fixed; width: 243px; z-index: 999999;">
<?php } ?>
<div id="slidingchat_trigger1" style="cursor: pointer; background: url('catalog/view/theme/default/image/callout.png') no-repeat; height: 119px; z-index: 999999;"></div>
<div id="slidingchat_trigger2" style="cursor: pointer; background: url('catalog/view/theme/default/image/window1.png') no-repeat; height: 40px; width: 243px; z-index: 999999;">
<div id="slidingchat_status" style="color: #3D2C2C; text-transform: capitalize; font-family: Arial, Helvetica, sans-serif; font-size: 12px; padding: 12px; font-weight: bold; z-index: 999999;">
<?php echo $header; ?>
</div> 
</div> 
<div id="slidingchat_inner" style="border: 1px solid #ddd; background: #fff; height:420px; width:241px;">
<!--<iframe style="overflow:hidden;width:100%;height:100%;" frameborder="0" border="0" src="<?php echo html_entity_decode($code); ?>"></iframe>--><?php echo html_entity_decode($code); ?>
</div>
</div>
<script type="text/javascript">
 		// When the DOM is ready, initialize the scripts.
		jQuery(function( $ ){
 
 $(document).ready(function(){
//   $('#slidingchat_inner').hide(); 
 $('#slidingchat_inner').slideUp(3500);
			$('#slidingchat_trigger1').click(
				function( event ){
					// Prevent the default event.
					event.preventDefault();

					// Toggle the slide based on its current
					// visibility.
					if ($('#slidingchat_inner').is( ":visible" )){
 
						// Hide - slide up.
						$('#slidingchat_inner').slideUp( 300, function(){ 
            $('#slidingchat_inner').show(); 
						$('#slidingchat_trigger1').show();
						$('#slidingchat_trigger2').css({'background':'url(catalog/view/theme/default/image/window1.png) no-repeat'});
						 } );
 
					} else {
 
						// Show - slide down.
						$('#slidingchat_inner').slideDown( 300, function(){ 
						$('#slidingchat_trigger1').hide();
						$('#slidingchat_trigger2').css({'background':'url(catalog/view/theme/default/image/window2.png) no-repeat'});
						 } );
 
					}
				}
			);
			
			$('#slidingchat_trigger2').click(
				function( event ){
					// Prevent the default event.
					event.preventDefault();
 
					// Toggle the slide based on its current
					// visibility.
					if ($('#slidingchat_inner').is( ":visible" )){
 
						// Hide - slide up.
						$('#slidingchat_inner').slideUp( 300, function(){ 
						$('#slidingchat_trigger1').show() } );
 
					} else {
 
						// Show - slide down.
						$('#slidingchat_inner').slideDown( 300, function(){ 
						$('#slidingchat_trigger1').hide() } );
 
					}
				}
			);
	});
});
</script>
<?php } else { ?>
<?php if ($position) { ?>
<div id="popup_container" style="bottom: 0px; left: 25px; position: fixed; width: 220px; z-index: 999999;">
<?php } else { ?>
<div id="popup_container" style="bottom: 0px; right: 25px; position: fixed; width: 220px; z-index: 999999;">
<?php } ?>
<a onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('<?php echo html_entity_decode($code); ?>','_blank','toolbar=0, scrollbars=0, location=0, status=1, menubar=0, left=250, top=250, width=500, height=500, resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;">
<div style="cursor:pointer; background:url('catalog/view/theme/default/image/callout.png') no-repeat; height:112px; z-index: 999999;">
</div>
</a>
</div>
<?php } ?>