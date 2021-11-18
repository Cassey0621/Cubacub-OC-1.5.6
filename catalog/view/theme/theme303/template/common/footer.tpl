<div class="clear"></div></div></div></div><div class="clear"></div></section>
<footer>
	<div class="footer_block">
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="span2">
				<h3><?php echo $text_information; ?></h3>
				<ul>
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
				</ul>
			</div>
			<?php } ?>
			<div class="span2">
				<h3><?php echo $text_service; ?></h3>
				<ul>
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
				<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				</ul>
			</div>
			<div class="span2">
				<h3><?php echo $text_extra; ?></h3>
				<ul>
				<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>
			<div class="span3">
				<h3><?php echo $text_account; ?></h3>
				<ul>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
				</ul>
			</div>
			
			<div class="span3">
				<h3><?php echo $text_support; ?></h3>
				<ul class= "contacts">
					<?php if ($telephone) { ?>					
					<p><?php echo $telephone; ?></p>
					<?php } ?>
				</ul>
				<ul class="social">						
					<li><a href="https://www.facebook.com/pages/B.L.%20Cubacub%20Lumber%20&%20Hardware/245939988814775/" target="_blank" class="tooltip-2" title="<?php echo $text_fb; ?>"><i class=" icon-facebook"></i></a></li>
					<li><a href="https://www.instagram.com/explore/locations/245939988814775/bl-cubacub-lumber-hardware/" target="_blank" class="tooltip-2" title="<?php echo $text_twi; ?>"><i class=" icon-instagram"></i></a></li>
				</ul>				
			</div>
			
		</div>
		
	</div>
	</div>
	
	<div>
		<div id="powered">
			<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->				
		</div>
	</div>
</footer>
<script type="text/javascript" 	src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/livesearch.js"></script>
</div>
</div>
</div>
</body></html>