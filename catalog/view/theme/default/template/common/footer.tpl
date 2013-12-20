</div>
</div>  
        </div>
 <!--Footer Section -->   
 <div style="clear:both;"></div> 
        <div id="footer_outer_listpage">
            <div id="footer_wrapper" >
                <div class="number_outer">
                    <ul class="footer_nav">
                        <li>Help 1-234-456-6789</li>
                        <li><a href="#">Email Us</a></li>
                    </ul>
                </div>
                <div class="footer_nav_outer">
                    <ul class="footer_nav">
                        <?php foreach ($informations as $information) { ?>
      					<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
     					<?php } ?>
                         <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                    </ul>
                </div>        
                <div class="footer_icon_outer">
                    <div class="small_outer"><a href="#"><img src="image/data/fb-icon.png" alt="Facebook" border="0" /></a></div>
                    <div class="small_outer"><a href="#"><img src="image/data/tweeter_icon.png" alt="Facebook" border="0" /></a></div>
                    <div class="small_outer"><a href="#"><img src="image/data/linked_icon.png" alt="Facebook" border="0" /></a></div>
                    <div class="small_outer"><a href="#"><img src="image/data/youtube_icon.png" alt="Facebook" border="0" /></a></div>
                    <div class="small_outer"><a href="#"><img src="image/data/google_icon.png" alt="Facebook" border="0" /></a></div>
                </div> 
            </div>
        </div>
        <!--Footer Section end-->       
    </div>
</div>
</body>
</html>
