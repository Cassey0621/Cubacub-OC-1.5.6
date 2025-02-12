<?php  
// prismit - https://github.com/johndesu090
class ControllerModulerandprod extends Controller {
	protected $category_id = 0;
	protected $path = array();
	
	protected function index($setting) {
		$this->language->load('module/randprod');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$this->load->model('tool/lorigin');
		
		$this->data['products'] = array();

		$results = $this->model_tool_lorigin->getRecommendedProduct($setting['limit']);
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
							
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/randprod.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/randprod.tpl';
		} else {
			$this->template = 'default/template/module/randprod.tpl';
		}

		$this->render();
  	}
	
}
?>