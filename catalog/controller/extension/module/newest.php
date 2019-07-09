<?php
class ControllerExtensionModuleNewest extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/newest');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getNewestProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if( (int)$result['price'] == 0 ) {
	                $price = 'Liên hệ';
	            }

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$percent = is_numeric($special) && is_numeric($price) ? (round(($special - $price) / $price , 2)) * 100 : 0;

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'name'  => $result['name'],
					'hot'  			=> $result['is_featured'],
					'thumb'       => $image,
					'gift'        => trim(strip_tags(html_entity_decode($result['gift'], ENT_QUOTES, 'UTF-8'))),
					'description' => utf8_substr(trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
                    'percent'     =>    "(". (round(($result['special'] - $result['price']) / $result['price'] , 2)) * 100 . "%)",
					'tax'         => $tax,
					'rating'      => $rating,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

            $data['readmore'] = $this->url->link('product/newest');
			return $this->load->view('extension/module/newest', $data);
		}
	}
}
