<?php
class ControllerCheckoutConfirm extends Controller {
	public function index() {
		$redirect = '';

		if ($this->cart->hasShipping()) {
			// Validate if shipping address has been set.
			if (!isset($this->session->data['shipping_address'])) {
				$redirect = $this->url->link('checkout/checkout', '', true);
			}

			// Validate if shipping method has been set.
//			if (!isset($this->session->data['shipping_method'])) {
//				$redirect = $this->url->link('checkout/checkout', '', true);
//			}
		} else {
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
		}

		// Validate if payment address has been set.
		if (!isset($this->session->data['payment_address'])) {
			$redirect = $this->url->link('checkout/checkout', '', true);
		}

		// Validate if payment method has been set.
//		if (!isset($this->session->data['payment_method'])) {
//			$redirect = $this->url->link('checkout/checkout', '', true);
//		}

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$redirect = $this->url->link('checkout/cart');
		}

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$redirect = $this->url->link('checkout/cart');

				break;
			}
		}

		if (!$redirect) {
			$order_data = array();

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->session->data['total_data'] = $total_data;

			$this->load->model('setting/extension');

			$sort_order = array();

			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get('total_' . $value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get('total_' . $result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);

			$order_data['totals'] = $totals;

			$this->load->language('checkout/checkout');

			$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
			$order_data['store_id'] = $this->config->get('config_store_id');
			$order_data['store_name'] = $this->config->get('config_name');

			if ($order_data['store_id']) {
				$order_data['store_url'] = $this->config->get('config_url');
			} else {
				if ($this->request->server['HTTPS']) {
					$order_data['store_url'] = HTTPS_SERVER;
				} else {
					$order_data['store_url'] = HTTP_SERVER;
				}
			}
			
			$this->load->model('account/customer');

			if ($this->customer->isLogged()) {
				$customer_info = $this->model_account_customer->getCustomer($this->customer->getId());

				$order_data['customer_id'] = $this->customer->getId();
				$order_data['customer_group_id'] = $customer_info['customer_group_id'];
				$order_data['firstname'] = $customer_info['firstname'];
				$order_data['lastname'] = $customer_info['lastname'];
				$order_data['email'] = $customer_info['email'];
				$order_data['telephone'] = $customer_info['telephone'];
				$order_data['custom_field'] = json_decode($customer_info['custom_field'], true);
			} elseif (isset($this->session->data['guest'])) {
				$order_data['customer_id'] = 0;
				$order_data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
				$order_data['firstname'] = $this->session->data['guest']['firstname'];
				$order_data['lastname'] = $this->session->data['guest']['lastname'];
				$order_data['email'] = $this->session->data['guest']['email'];
				$order_data['telephone'] = $this->session->data['guest']['telephone'];
				$order_data['custom_field'] = $this->session->data['guest']['custom_field'];
			}

			$order_data['payment_firstname'] = $this->session->data['payment_address']['firstname'];
			$order_data['payment_lastname'] = $this->session->data['payment_address']['lastname'];
			$order_data['payment_company'] = $this->session->data['payment_address']['company'];
			$order_data['payment_address_1'] = $this->session->data['payment_address']['address_1'];
			$order_data['payment_address_2'] = $this->session->data['payment_address']['address_2'];
			$order_data['payment_city'] = $this->session->data['payment_address']['city'];
			$order_data['payment_postcode'] = $this->session->data['payment_address']['postcode'];
			$order_data['payment_zone'] = $this->session->data['payment_address']['zone'];
			$order_data['payment_zone_id'] = $this->session->data['payment_address']['zone_id'];
			$order_data['payment_country'] = $this->session->data['payment_address']['country'];
			$order_data['payment_country_id'] = $this->session->data['payment_address']['country_id'];
			$order_data['payment_address_format'] = $this->session->data['payment_address']['address_format'];
			$order_data['payment_custom_field'] = (isset($this->session->data['payment_address']['custom_field']) ? $this->session->data['payment_address']['custom_field'] : array());

			if (isset($this->session->data['payment_method']['title'])) {
				$order_data['payment_method'] = $this->session->data['payment_method']['title'];
			} else {
                $method = $this->session->data['payment_method_kingsport'];
                $payment_method = '';
                if($method == 'home') {
                    $payment_method = 'COD';
                }
                if($method == 'alepay') {
                    $payment_method = 'Trả góp Online qua Alepay';
                }
                if($method == 'alepay_qt') {
                    $payment_method = 'Thanh toán Online thẻ Quốc tế qua Alepay';
                }
                if($method == 'nganluong') {
                    $payment_method = 'Thanh toán thẻ nội địa qua Ngân lượng';
                }
				$order_data['payment_method'] = $payment_method;
			}

			if (isset($this->session->data['payment_method']['code'])) {
				$order_data['payment_code'] = $this->session->data['payment_method']['code'];
			} else {
                $method = $this->session->data['payment_method_kingsport'];
				$order_data['payment_code'] = $method;
			}

			if ($this->cart->hasShipping()) {
				$order_data['shipping_firstname'] = $this->session->data['shipping_address']['firstname'];
				$order_data['shipping_lastname'] = $this->session->data['shipping_address']['lastname'];
				$order_data['shipping_company'] = $this->session->data['shipping_address']['company'];
				$order_data['shipping_address_1'] = $this->session->data['shipping_address']['address_1'];
				$order_data['shipping_address_2'] = $this->session->data['shipping_address']['address_2'];
				$order_data['shipping_city'] = $this->session->data['shipping_address']['city'];
				$order_data['shipping_postcode'] = $this->session->data['shipping_address']['postcode'];
				$order_data['shipping_zone'] = $this->session->data['shipping_address']['zone'];
				$order_data['shipping_zone_id'] = $this->session->data['shipping_address']['zone_id'];
				$order_data['shipping_country'] = $this->session->data['shipping_address']['country'];
				$order_data['shipping_country_id'] = $this->session->data['shipping_address']['country_id'];
				$order_data['shipping_address_format'] = $this->session->data['shipping_address']['address_format'];
				$order_data['shipping_custom_field'] = (isset($this->session->data['shipping_address']['custom_field']) ? $this->session->data['shipping_address']['custom_field'] : array());

				if (isset($this->session->data['shipping_method']['title'])) {
					$order_data['shipping_method'] = $this->session->data['shipping_method']['title'];
				} else {
					$order_data['shipping_method'] = '';
				}

				if (isset($this->session->data['shipping_method']['code'])) {
					$order_data['shipping_code'] = $this->session->data['shipping_method']['code'];
				} else {
					$order_data['shipping_code'] = '';
				}
			} else {
				$order_data['shipping_firstname'] = '';
				$order_data['shipping_lastname'] = '';
				$order_data['shipping_company'] = '';
				$order_data['shipping_address_1'] = '';
				$order_data['shipping_address_2'] = '';
				$order_data['shipping_city'] = '';
				$order_data['shipping_postcode'] = '';
				$order_data['shipping_zone'] = '';
				$order_data['shipping_zone_id'] = '';
				$order_data['shipping_country'] = '';
				$order_data['shipping_country_id'] = '';
				$order_data['shipping_address_format'] = '';
				$order_data['shipping_custom_field'] = array();
				$order_data['shipping_method'] = '';
				$order_data['shipping_code'] = '';
			}

			$order_data['products'] = array();
			$this->load->model('tool/image');

			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'product_option_id'       => $option['product_option_id'],
						'product_option_value_id' => $option['product_option_value_id'],
						'option_id'               => $option['option_id'],
						'option_value_id'         => $option['option_value_id'],
						'name'                    => $option['name'],
						'value'                   => $option['value'],
						'type'                    => $option['type']
					);
				}

				$order_data['products'][] = array(
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'thumb'     => $image,
					'model'      => $product['model'],
					'option'     => $option_data,
					'download'   => $product['download'],
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $product['price'],
					'total'      => $product['total'],
					'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
					'reward'     => $product['reward']
				);
			}

			// Gift Voucher
			$order_data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$order_data['vouchers'][] = array(
						'description'      => $voucher['description'],
						'code'             => token(10),
						'to_name'          => $voucher['to_name'],
						'to_email'         => $voucher['to_email'],
						'from_name'        => $voucher['from_name'],
						'from_email'       => $voucher['from_email'],
						'voucher_theme_id' => $voucher['voucher_theme_id'],
						'message'          => $voucher['message'],
						'amount'           => $voucher['amount']
					);
				}
			}

			$order_data['comment'] = isset($this->session->data['comment']) ? $this->session->data['comment']: '';
			$order_data['total'] = $total_data['total'];

			if (isset($this->request->cookie['tracking'])) {
				$order_data['tracking'] = $this->request->cookie['tracking'];

				$subtotal = $this->cart->getSubTotal();

				// Affiliate
				$affiliate_info = $this->model_account_customer->getAffiliateByTracking($this->request->cookie['tracking']);

				if ($affiliate_info) {
					$order_data['affiliate_id'] = $affiliate_info['customer_id'];
					$order_data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
				} else {
					$order_data['affiliate_id'] = 0;
					$order_data['commission'] = 0;
				}

				// Marketing
				$this->load->model('checkout/marketing');

				$marketing_info = $this->model_checkout_marketing->getMarketingByCode($this->request->cookie['tracking']);

				if ($marketing_info) {
					$order_data['marketing_id'] = $marketing_info['marketing_id'];
				} else {
					$order_data['marketing_id'] = 0;
				}
			} else {
				$order_data['affiliate_id'] = 0;
				$order_data['commission'] = 0;
				$order_data['marketing_id'] = 0;
				$order_data['tracking'] = '';
			}

			$order_data['language_id'] = $this->config->get('config_language_id');
			$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
			$order_data['currency_code'] = $this->session->data['currency'];
			$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);
			$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

			if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
			} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
				$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
			} else {
				$order_data['forwarded_ip'] = '';
			}

			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
			} else {
				$order_data['user_agent'] = '';
			}

			if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
				$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
			} else {
				$order_data['accept_language'] = '';
			}

			$this->load->model('checkout/order');

			$this->session->data['order_id'] = $this->model_checkout_order->addOrder($order_data);

			$this->load->model('tool/upload');

			$data['products'] = array();

			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}

				$data['products'][] = array(
					'cart_id'    => $product['cart_id'],
					'product_id' => $product['product_id'],
					'name'       => $product['name'],
					'thumb'       => $image,
					'model'      => $product['model'],
					'option'     => $option_data,
					'recurring'  => $recurring,
					'quantity'   => $product['quantity'],
					'subtract'   => $product['subtract'],
					'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
					'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']),
					'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}

			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $voucher) {
					$data['vouchers'][] = array(
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency'])
					);
				}
			}

			$data['totals'] = array();

			foreach ($order_data['totals'] as $total) {
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);

				$data['totals_text'] = $this->currency->format($total['value'], $this->session->data['currency']);
			}

			//$data['payment'] = $this->load->controller('extension/payment/' . $this->session->data['payment_method']['code']);

		} else {
			$data['redirect'] = $redirect;
		}

		$data['button_back'] = 'Trở lại';

		$data['order'] = $order_data;

		$data['method'] = $this->session->data['payment_method_kingsport'];

		$this->response->setOutput($this->load->view('checkout/confirm', $data));
	}

	public function finish() {
        $json = array();

        $method = $this->session->data['payment_method_kingsport'];

        if($this->session->data['payment_method_kingsport'] == 'home') {
            $json['redirect'] = $this->url->link('checkout/success');
        }else
            if($this->session->data['payment_method_kingsport'] == 'alepay') {
            $result = $this->alepay();
            if(isset($result->checkoutUrl)) {
                $json['redirect'] = $result->checkoutUrl;
            }else {
                $json['error'] = $result->errorDescription;
            }

        }else if($this->session->data['payment_method_kingsport'] == 'nganluong') {
             $json['redirect'] = $this->nganluong();

        }else if($this->session->data['payment_method_kingsport'] == 'alepay_qt') {
            $result = $this->alepay_qt();
            if(isset($result->checkoutUrl)) {
                $json['redirect'] = $result->checkoutUrl;
            }else {
                $json['error'] = $result->errorDescription;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function alepay() {

		$this->load->model('account/customer');

        if ($this->customer->isLogged()) {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
            $firstname = $customer_info['firstname'];
            $lastname = $customer_info['lastname'];
            $email = $customer_info['email'];
            $telephone = $customer_info['telephone'];
        } elseif (isset($this->session->data['guest'])) {
            $firstname = $this->session->data['guest']['firstname'];
            $lastname = $this->session->data['guest']['lastname'];
            $email = $this->session->data['guest']['email'];
            $telephone = $this->session->data['guest']['telephone'];
        }

        $product_desc = '';
        $nums = 0;
        foreach ($this->cart->getProducts() as $product) {
            $product_desc .= $product['model'] . "-" . $product['name'] . ":" . $product['quantity'] . 'x' . $this->currency->format($product['price'], $this->session->data['currency']) . '=' . $this->currency->format($product['total'], $this->session->data['currency']) . "\n";
            $nums += $product['quantity'];
        }

        $total_data = $this->session->data['total_data'];

        $price = (int)$total_data['total']['value'] ;

        $buyerAddress = !empty($this->session->data['payment_address']['address_1']) ? $this->session->data['payment_address']['address_1'] : $this->session->data['shipping_address']['address_1'];
        $buyerCity = !empty($this->session->data['payment_address']['city']) ? $this->session->data['payment_address']['city'] : $this->session->data['shipping_address']['city'];
        $buyerCountry = !empty($this->session->data['payment_address']['country']) ? $this->session->data['payment_address']['country'] : $this->session->data['shipping_address']['country'];


        
        $alepay = new Alepay( $this->alepay_config() );
        $data = array();

        $data['cancelUrl'] = $this->url->link('checkout/failure');
        $data['amount'] = intval(preg_replace('@\D+@', '', $price));
        $data['orderCode'] = $this->session->data['order_id'];
        $data['currency'] = 'VND';
        $data['orderDescription'] = $product_desc;
        $data['totalItem'] = intval($nums);
        $data['checkoutType'] = 3; // Thanh toán trả góp + nội địa + quốc tế
        $data['buyerName'] = trim($firstname . $lastname);
        $data['buyerEmail'] = trim($email);
        $data['buyerPhone'] = trim($telephone);
        $data['buyerAddress'] = trim($buyerAddress);
        $data['buyerCity'] = trim($buyerCity);
        $data['buyerCountry'] = trim($buyerCountry);
//        $data['month'] = 3;
        $data['paymentHours'] = 48; //48 tiếng :  Thời gian cho phép thanh toán (tính bằng giờ)


        foreach ($data as $k => $v) {
            if (empty($v)) {
                $alepay->return_json("NOK", "Bắt buộc phải nhập/chọn tham số [ " . $k . " ]");
                die();
            }
        }
        $data['allowDomestic'] = true;


        $result = $alepay->sendOrderToAlepay($data); // Khởi tạo

        return $result;
    }

    public function alepay_qt() {

		$this->load->model('account/customer');
		
        if ($this->customer->isLogged()) {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
            $firstname = $customer_info['firstname'];
            $lastname = $customer_info['lastname'];
            $email = $customer_info['email'];
            $telephone = $customer_info['telephone'];
        } elseif (isset($this->session->data['guest'])) {
            $firstname = $this->session->data['guest']['firstname'];
            $lastname = $this->session->data['guest']['lastname'];
            $email = $this->session->data['guest']['email'];
            $telephone = $this->session->data['guest']['telephone'];
        }

        $product_desc = '';
        $nums = 0;
        foreach ($this->cart->getProducts() as $product) {
            $product_desc .= $product['model'] . "-" . $product['name'] . ":" . $product['quantity'] . 'x' . $this->currency->format($product['price'], $this->session->data['currency']) . '=' . $this->currency->format($product['total'], $this->session->data['currency']) . "\n";
            $nums += $product['quantity'];
        }

        $total_data = $this->session->data['total_data'];
        $first_charge = $this->session->data['comment_price'];

        $price = !empty($first_charge) ? $first_charge : (int)$total_data['total']['value'] ;

        $buyerAddress = !empty($this->session->data['payment_address']['address_1']) ? $this->session->data['payment_address']['address_1'] : $this->session->data['shipping_address']['address_1'];
        $buyerCity = !empty($this->session->data['payment_address']['city']) ? $this->session->data['payment_address']['city'] : $this->session->data['shipping_address']['city'];
        $buyerCountry = !empty($this->session->data['payment_address']['country']) ? $this->session->data['payment_address']['country'] : $this->session->data['shipping_address']['country'];

        

        $alepay = new Alepay( $this->alepay_config() );
        $data = array();

        $data['cancelUrl'] = $this->url->link('checkout/failure');
        $data['amount'] = intval(preg_replace('@\D+@', '', $price));
        $data['orderCode'] = $this->session->data['order_id'];
        $data['currency'] = 'VND';
        $data['orderDescription'] = $product_desc;
        if(!empty($first_charge)) {
            $data['orderDescription'] = $product_desc . "Trả trước:" . $this->currency->format($first_charge, $this->session->data['currency']);
        }
        $data['totalItem'] = intval($nums);
        $data['checkoutType'] = 1; // Thanh toán trả góp + nội địa + quốc tế
        $data['buyerName'] = trim($firstname . $lastname);
        $data['buyerEmail'] = trim($email);
        $data['buyerPhone'] = trim($telephone);
        $data['buyerAddress'] = $buyerAddress;
        $data['buyerCity'] = trim($buyerCity);
        $data['buyerCountry'] = trim($buyerCountry);
//        $data['month'] = 3;
        $data['paymentHours'] = 48; //48 tiếng :  Thời gian cho phép thanh toán (tính bằng giờ)


        foreach ($data as $k => $v) {
            if (empty($v)) {
                $alepay->return_json("NOK", "Bắt buộc phải nhập/chọn tham số [ " . $k . " ]");
                die();
            }
        }
        $data['allowDomestic'] = true;


        $result = $alepay->sendOrderToAlepay($data); // Khởi tạo

        return $result;
    }

    public function nganluong() {

    	$this->load->model('account/customer');
    	
        if ($this->customer->isLogged()) {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
            $firstname = $customer_info['firstname'];
            $lastname = $customer_info['lastname'];
            $email = $customer_info['email'];
            $telephone = $customer_info['telephone'];
        } elseif (isset($this->session->data['guest'])) {
            $firstname = $this->session->data['guest']['firstname'];
            $lastname = $this->session->data['guest']['lastname'];
            $email = $this->session->data['guest']['email'];
            $telephone = $this->session->data['guest']['telephone'];
        }

        $product_desc = '';
        foreach ($this->cart->getProducts() as $product) {
            $product_desc .= $product['model'] . "-" . $product['name'] . ":" . $product['quantity'] . 'x' . $this->currency->format($product['price'], $this->session->data['currency']) . '=' . $this->currency->format($product['total'], $this->session->data['currency']) . "\n";
        }

        $total_data = $this->session->data['total_data'];
        $first_charge = $this->session->data['comment_price'];

        //Mã đơn hàng
        $order_code= $this->session->data['order_id'];
        //Khai báo url trả về
        $return_url= $this->url->link('checkout/success_nl');
        // Link nut hủy đơn hàng
        $cancel_url= $this->url->link('checkout/failure');
        //Giá của cả giỏ hàng

        $price = !empty($first_charge) ? $first_charge : (int)$total_data['total']['value'] ;

        //Thông tin giao dịch
        $buyer_info = $firstname . " ".$lastname . " - ".$telephone . " - " . $email;
        $transaction_info= $buyer_info;
        $currency= "vnd";
        $quantity=1;
        $tax=0;
        $discount=0;
        $fee_cal=0;
        $fee_shipping=0;
        $order_description="Thông tin đơn hàng: " . $product_desc;
        if($first_charge) {
            $order_description="Thông tin đơn hàng: " . $product_desc . "Trả trước:" . $this->currency->format($first_charge, $this->session->data['currency']);
        }
        $buyer_info = $firstname . " ".$lastname . " - ".$telephone . " - " . $email;
        $affiliate_code="";

        //Khai báo đối tượng của lớp NL_Checkout
        $nl= new NL_Checkout();

        $config = $this->nganluong_config();

        $receiver = $config['receiver'];
        $nl->nganluong_url = $config['url'];
        $nl->merchant_site_code = $config['merchant_code'];
        $nl->secure_pass = $config['secure_pass'];

        //Tạo link thanh toán đến nganluong.vn
        $url= $nl->buildCheckoutUrlExpand($return_url, $receiver, $transaction_info, $order_code, $price, $currency, $quantity, $tax, $discount , $fee_cal,    $fee_shipping, $order_description, $buyer_info , $affiliate_code);
        //$url= $nl->buildCheckoutUrl($return_url, $receiver, $transaction_info, $order_code, $price);

        return $url .='&cancel_url='. $cancel_url;
    }


    //config
    private function nganluong_config() {
        $isTest = $this->config->get('config_env_test');
        $url = 'https://www.nganluong.vn/checkout.php';
        if($isTest) {
            $url = 'https://sandbox.nganluong.vn:8088/nl35/checkout.php';
        }
    	return array(
    		'receiver' => $this->config->get('config_ngluong_receiver'),
    		'merchant_code' => $this->config->get('config_ngluong_merchant_code'),
    		'url' => $url,
    		'secure_pass' => $this->config->get('config_ngluong_secure_pass'),
    	);
    }


    private function alepay_config() {
        $isTest = $this->config->get('config_env_test');
    	return  array(
            "apiKey" => $this->config->get('config_alepay_api_key'),
            "encryptKey" => $this->config->get('config_alepay_encrypt_key'),
            "checksumKey" => $this->config->get('config_alepay_checksum_key'),
            "callbackUrl" => $this->url->link('checkout/success_alepay'),
            "env" => $isTest ? "test" : 'live',
        );
    }



}
