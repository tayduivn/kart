<?php
class ControllerCommonBlock extends Controller {
	public function index() { 
		$this->load->language('common/block');

		// Menu
        $this->load->model('catalog/product');
        
		$this->load->model('web/block');
        
        $this->load->model('design/banner');
        
		$this->load->model('tool/image');

		$data['blocks'] = array();

		$blocks = $this->model_web_block->getBlocks($filter = []);
            
        foreach ($blocks as $block) {
            
            $filter_data = array(
    			'sort'  => 'pd.name',
    			'order' => 'ASC',
    			'start' => 0,
    			'limit' => 6,
                'filter_category_id'  => $block['category_id'],
                'filter_featured'=> true
    		);
        
            $featured_products = $this->model_catalog_product->getProducts($filter_data);
            
            $featuredProductsArr = array();
            
            foreach($featured_products as $product) {
                $featuredProductsArr[] = $this->createProduct($product, $block['category_id']);
            }
            
            $filter_data = array(
    			'sort'  => 'pd.name',
    			'order' => 'ASC',
    			'start' => 0,
    			'limit' => 6,
                'filter_category_id'  => $block['category_id']
    		);
            
    		$specials = $this->model_catalog_product->getProductSpecials($filter_data);
            
            $specialsArr = array();
            
            foreach($specials as $product) {
                $specialsArr[] = $this->createProduct($product, $block['category_id']);
            }
            
            $banners = $this->model_design_banner->getBanner($block['banner_id']);
            
            $bannersArr = array();
            
    		foreach ($banners as $banner) {
    			if (is_file(DIR_IMAGE . $banner['image'])) {
    				$bannersArr[] = array(
    					'title' => $banner['title'],
    					'link'  => $banner['link'],
    					'image' => $this->model_tool_image->resize($banner['image'], 278, 189)
    				);
    			}
    		}
            
            $data['blocks'][$block['block_id']] = array(
                'block' => $block,
                'feature' =>  $featuredProductsArr,
                'specials' => $specialsArr,
                'banners' => $bannersArr,
                'href'  => $this->url->link('product/category', 'path=' . $block['category_id'])
             );
            
        }

		return $this->load->view('common/block', $data);
	}
    
    public function createProduct($product, $category_id) {
        
        $this->load->model('tool/image');
        
        if ($product['image']) {
			$image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
		} else {
			$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
		}

		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
		} else {
			$price = false;
		}

		if ((float)$product['special']) {
			$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
		} else {
			$special = false;
		}

		if ($this->config->get('config_tax')) {
			$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price'], $this->session->data['currency']);
		} else {
			$tax = false;
		}

		if ($this->config->get('config_review_status')) {
			$rating = (int)$product['rating'];
		} else {
			$rating = false;
		}

		return array(
			'product_id'  => $product['product_id'],
			'thumb'       => $image,
			'name'        => $product['name'],
			'gift'        => trim(strip_tags(html_entity_decode($product['gift'], ENT_QUOTES, 'UTF-8'))),
			'description' => utf8_substr(trim(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
			'price'       => $price,
			'special'     => $special,
            'percent'     =>    "(". (round(($special - $price) / $price , 2)) * 100 . "%)",
			'tax'         => $tax,
			'minimum'     => $product['minimum'] > 0 ? $product['minimum'] : 1,
			'rating'      => $product['rating'],
			'href'        => $this->url->link('product/product', 'path=' . $category_id . '&product_id=' . $product['product_id'])
		);
    }
}
