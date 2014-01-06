<!-- 
 * @package InviteReferrals
 * @version 0.2.1
 -->

<?php if(!empty($invitereferrals_enable)){?>
<?php 
$t = time(); $bid = $invitereferrals_username; $secKey = $invitereferrals_password; 
$setUserEmail = $invitereferrals_email;// the user email id
/* Optional parameters if passing email id as well */
$fname = $invitereferrals_fname;//first name of customer
$lname = $invitereferrals_lname;//last name of customer
?>
<div id='invtrflfloatbtn'></div>
<script>	
var invite_referrals = window.invite_referrals || {}; (function() { 
	invite_referrals.auth = { 
  	bid_e : '<?php print strtoupper(md5($secKey.'|'.$bid.'|'.$t.'|'.$setUserEmail));?>',
	bid : '<?php print $bid;?>', email : '<?php print $setUserEmail;?>',
	t : '<?php print $t;?>', 
	userParams : {'fname' : '<?php print $fname;?>',
	'lname' : '<?php print $lname;?>'} };	
var script = document.createElement('script');script.async = true;
script.src = 'http://' + 'cdn.invitereferrals.com/js/invite-referrals-1.0.js';
var entry = document.getElementsByTagName('script')[0];entry.parentNode.insertBefore(script, entry); })();
</script>
<?php } ?>