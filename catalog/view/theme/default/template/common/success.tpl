<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id='nehru_success'>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumbs_outer">
    <ul class="breadcrumbs">
      <?php   
    foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if($breadcrumb['separator']) echo '<li><span>>></span></li>'; ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  
    <div class="buttons"> <?php echo $text_message; ?>
      <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>

  <?php echo $content_bottom; ?></div>  </div>
<?php echo $footer; ?>