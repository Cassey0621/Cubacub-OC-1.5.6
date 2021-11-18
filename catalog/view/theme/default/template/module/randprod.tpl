<div class="box">
	<div class="box-heading" style="border: 0;background: none; font-size: 20px"><?php echo $heading_title; ?></div>
	<div class="box-content" style="padding: 10px 0;">
		<div class="product-grid randprod">
			<?php foreach ($products as $product) : ?>
			<div>
				<?php if ($product['thumb']) : ?>
				<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/></a></div>
				<?php endif; ?>
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

				<div class="price">
					<?php if (!$product['special']) { ?>
					<?php echo $product['price']; ?>
					<?php } else { ?>
					<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
					<?php } ?>
				</div>

				<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>

			</div>
			<?php endforeach;?>
		</div>


	</div>
</div>
