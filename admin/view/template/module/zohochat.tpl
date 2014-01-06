<?php
// -------------------------------
// Zoho Sliding Chat for OpenCart 
// By Best-Byte
// www.best-byte.com
// -------------------------------
?>
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
        <table class="form">
         <tr> 
					<td><?php echo $entry_function; ?></td>
					<td colspan="3">  
						<?php if($zohochat_slide) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="zohochat_slide_1"><?php echo $text_slide; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="zohochat_slide_1" name="zohochat_slide" value="1" /> 
					<label for="zohochat_slide_0"><?php echo $text_popup; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="zohochat_slide_0" name="zohochat_slide" value="0" /> 
					</td> 
				</tr>        
         <tr> 
					<td><?php echo $entry_position; ?></td>
					<td colspan="3">  
						<?php if($zohochat_position) { 
						$checked1 = ' checked="checked"'; 
						$checked0 = ''; 
						} else { 
						$checked1 = ''; 
						$checked0 = ' checked="checked"'; 
						} ?> 
					<label for="zohochat_position_1"><?php echo $text_left; ?></label> 
					<input type="radio"<?php echo $checked1; ?> id="zohochat_position_1" name="zohochat_position" value="1" /> 
					<label for="zohochat_position_0"><?php echo $text_right; ?></label> 
					<input type="radio"<?php echo $checked0; ?> id="zohochat_position_0" name="zohochat_position" value="0" /> 
					</td> 
				</tr>
        <tr>
        	<td><?php echo $entry_header; ?></td>
            <td>
            <input type="text" name="zohochat_header" value="<?php echo $zohochat_header; ?>" size="34" maxlength="34" />
            </td>
        </tr>				
        <tr>
        	<td><?php echo $entry_code; ?></td>
            <td>
            <textarea name="zohochat_code" cols="150" rows="5"><?php echo $zohochat_code; ?></textarea>
            </td>
        </tr>				
        <tr><td colspan="4">&nbsp;</td></tr>          
				<tr>
					<td><?php echo $text_template; ?></td>
					<td colspan="3"> 
						<?php foreach ($templates as $template) { ?>
							<?php if ($template == $config_template) { ?>
								<span style='color: #660000; padding: 0 5px;'><b><?php echo $template; ?></b></span> 
							<?php } ?>
						<?php } ?>	
					</td>
				</tr>
				<tr><td colspan="4">&nbsp;</td></tr>       
				<tr>
					<td colspan="4">
						<span style='text-align: center;'><b><?php echo $text_settings; ?></b></span>
					</td>
				</tr>
				</table>
	     <table id="module" class="list">
			    <thead>
            <tr>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="zohochat_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="left"><select name="zohochat_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
					<input name="zohochat_module[<?php echo $module_row; ?>][position]" value="content_bottom" type="hidden">
					<input name="zohochat_module[<?php echo $module_row; ?>][sort_order]" value="10" type="hidden" />                
              <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
            </tr>
          </tbody>
          <?php $module_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
      <center><?php echo $text_moduleinfo ?></center>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';	
	html += '    <td class="left"><select name="zohochat_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <input name="zohochat_module[' + module_row + '][position]" value="content_bottom" type="hidden">';
	html += '    <td class="left"><select name="zohochat_module[' + module_row + '][status]">';
  html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '      <option value="0"><?php echo $text_disabled; ?></option>';
  html += '    </select></td>';
	html += '    <input name="zohochat_module[' + module_row + '][sort_order]" value="10" type="hidden" />';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
 
<?php echo $footer; ?>