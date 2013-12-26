<?php echo $header; ?>

<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table id="module" class="list">
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="sociallinks_status">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
         
          <tr>
            <td><?php echo $entry_fb;?></td>
            <td class="left"><input name="sociallinks_fb" type="text" id="sociallinks_fb" value="<?php echo $module['fb'];?>" class="colorpickercls" /></td>
          </tr>
		  <tr>
            <td><?php echo $entry_twitter;?></td>
            <td class="left"><input name="sociallinks_twitter" type="text" id="sociallinks_twitter" value="<?php echo $module['twitter'];?>"   /></td>
          </tr>
		  
		  
		  <tr>
            <td><?php echo $entry_gp;?></td>
            <td class="left"><input name="sociallinks_gp" type="text" id="sociallinks_gp" value="<?php echo $module['gp'];?>"   /></td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>

<style type="text/css">
.nocsstable td{
 border:none!important;
}
</style>
<?php echo $footer; ?>