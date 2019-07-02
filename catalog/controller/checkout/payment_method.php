<?php


class ControllerCheckoutPaymentMethod extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');

		if (isset($this->session->data['payment_address'])) {
			// Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
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

			// Payment Methods
			$method_data = array();

			$this->load->model('setting/extension');

			$results = $this->model_setting_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();

			foreach ($results as $result) {
				if ($this->config->get('payment_' . $result['code'] . '_status')) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
		}

		if (empty($this->session->data['payment_methods'])) {
			$data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['payment_methods'])) {
			$data['payment_methods'] = $this->session->data['payment_methods'];
		} else {
			$data['payment_methods'] = array();
		}

		if (isset($this->session->data['payment_method']['code'])) {
			$data['code'] = $this->session->data['payment_method']['code'];
		} else {
			$data['code'] = '';
		}

		if (isset($this->session->data['comment'])) {
			$data['comment'] = $this->session->data['comment'];
		} else {
			$data['comment'] = '';
		}

		$data['scripts'] = $this->document->getScripts();

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		if (isset($this->session->data['agree'])) {
			$data['agree'] = $this->session->data['agree'];
		} else {
			$data['agree'] = '';
		}

		$this->response->setOutput($this->load->view('checkout/payment_method', $data));
	}

	public function save() {
		$this->load->language('checkout/checkout');

		$json = array();

		// Validate if payment address has been set.
		if (!isset($this->session->data['payment_address'])) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', true);
		}

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
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
				$json['redirect'] = $this->url->link('checkout/cart');

				break;
			}
		}

		//goi alepay hoac nganluong

		// $config = $this->config_alepay();
		// $alepay = new Alepay($config);
		// $data = [];

		// $data['cancelUrl'] = $this->url->link('checkout/cancel');
		// $data['returnUrl'] = $this->url->link('checkout/cancel');
		// $data['amount'] = '1200000';
		// $data['orderCode'] = '123456';
		// $data['currency'] =  'VND';
		// $data['orderDescription'] =  'mua tra gop';
		// $data['totalItem'] =  '2';
		// $data['checkoutType'] = 2; // 0 : cho phép thanh toán bằng cả 2 cách, 1 : chỉ thanh toán thường , 2: chỉ thanh toán trả góp
		// $data['buyerName'] = 'Duc Nguyen';
		// $data['buyerEmail'] = 'thducuit@gmail.com';
		// $data['buyerPhone'] = '0932676897';
		// $data['buyerAddress'] = '10 QVT';
		// $data['buyerCity'] = 'TP. Hồ Chí Minh';
		// $data['buyerCountry'] = 'Việt Nam';
		// //$data['month'] = 0;
		// $data['paymentHours'] = 12; // 12 tiếng :  Thời gian cho phép thanh toán (tính bằng giờ)

		// $result = $alepay->sendOrderToAlepay($data); // Khởi tạo

		// var_dump($result); die();

		// if (isset($result) && !empty($result->checkoutUrl)) {
		// 	return redirect($result->checkoutUrl);
		// } else {
		// 	return back()->with("error", $result->errorDescription);
		// }



		$receiver='thducuit@gmail.com';
		//Mã đơn hàng 
		$order_code='NL_'.time();
		//Khai báo url trả về 
		$return_url= $_SERVER['HTTP_REFERER']. "/success.php";
		// Link nut hủy đơn hàng
		$cancel_url= $_SERVER['HTTP_REFERER'];	
		//Giá của cả giỏ hàng 
		$txh_name = 'Duc nguyen'; 	
		$txt_email =  'duk#gmail.com'; 	
		$txt_phone = '0932676897'; 	
		$price = 30000; 	
		//Thông tin giao dịch
		$transaction_info="Thong tin giao dich";
		$currency= "vnd";
		$quantity=1;
		$tax=0;
		$discount=0;
		$fee_cal=0;
		$fee_shipping=0;
		$order_description="Thong tin don hang: ".$order_code;
		$buyer_info=$txh_name."*|*".$txt_email."*|*".$txt_phone;
		$affiliate_code="";
	    //Khai báo đối tượng của lớp NL_Checkout
		$nl= new NL_Checkout();
		$nl->nganluong_url = 'https://www.nganluong.vn/checkout.php';
		$nl->merchant_site_code = '60154';
		$nl->secure_pass = 'choancut123';
		//Tạo link thanh toán đến nganluong.vn
		$url = $nl->buildCheckoutUrlExpand($return_url, $receiver, $transaction_info, $order_code, $price, $currency, $quantity, $tax, $discount , $fee_cal,    $fee_shipping, $order_description, $buyer_info , $affiliate_code);
		//$url= $nl->buildCheckoutUrl($return_url, $receiver, $transaction_info, $order_code, $price);
		
		var_dump($url); die();
		
		//echo $url; die;
		if ($order_code != "") {
			//một số tham số lưu ý
			//&cancel_url=http://yourdomain.com --> Link bấm nút hủy giao dịch
			//&option_payment=bank_online --> Mặc định forcus vào phương thức Ngân Hàng
			$url .='&cancel_url='. $cancel_url;
			//$url .='&option_payment=bank_online';
			
			echo '<meta http-equiv="refresh" content="0; url='.$url.'" >';
			//&lang=en --> Ngôn ngữ hiển thị google translate
		}


		// $nlcheckout= new NL_CheckOutV3('60154' , '54abf386a89d4d17900137aaedd37c69', 'thducuit@gmail.com', 'https://www.nganluong.vn/checkout.api.nganluong.post.php');
		// $total_amount= '200000';
		 
		//  $array_items[0]= array('item_name1' => 'Product name',
		// 				 'item_quantity1' => 1,
		// 				 'item_amount1' => $total_amount,
		// 				 'item_url1' => 'http://nganluong.vn/');
						 
		// $array_items=array();				 
		//  //$payment_method = $_POST['option_payment'];
		//  $bank_code = 'BIDV';
		//  $order_code ="macode_".time();
		
		//  $payment_type ='';
		//  $discount_amount =0;
		//  $order_description='';
		//  $tax_amount=0;
		//  $fee_shipping=0;
		//  $return_url = $this->url->link('checkout/cancel');
		//  $cancel_url = $this->url->link('checkout/cancel');
		
		//  $buyer_fullname = 'Nguyen Thanh DUc';
		//  $buyer_email = 'thducuit1111@gmail.com';
		//  $buyer_mobile = '0932676897';
		 
		//  $buyer_address ='';

		//  $nl_result= $nlcheckout->BankCheckout($order_code,$total_amount,$bank_code,$payment_type,$order_description,$tax_amount,
		// 										  $fee_shipping,$discount_amount,$return_url,$cancel_url,$buyer_fullname,$buyer_email,$buyer_mobile, 
		// 										  $buyer_address,$array_items) ;

		//  var_dump($nl_result); die;

//		if (!isset($this->request->post['payment_method'])) {
//			$json['error']['warning'] = $this->language->get('error_payment');
//		} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
//			$json['error']['warning'] = $this->language->get('error_payment');
//		}
//
//		if ($this->config->get('config_checkout_id')) {
//			$this->load->model('catalog/information');
//
//			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
//
//			if ($information_info && !isset($this->request->post['agree'])) {
//				$json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
//			}
//		}

		if (!$json) {
			//$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];

			//$this->session->data['comment'] = strip_tags($this->request->post['comment']);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	function config_alepay()
    {    
        $configAlepay = array(
                "apiKey" => "iOAQ0PO6pcsSvpQ1zfxtlaEWGk32xX",
                "encryptKey" => "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC49HDk1rIVwvIBjHi48lS4w71vkiNbQdYWFK2PadIG/eHJAO3PWp3oWBJ5nnNwwD1CkuFLNUrewQ5gO+cV26a5EZQQ3tK6hlb43HbYN1jPOVpJ81Y2Xwx0Z/0NR61InoUPWfteljeQMX3Drn45Iqen5pCU3Oco40WoTKuvFXYLSwIDAQAB",
                "checksumKey" => "QfDodb44QpuI4sScXlOS6cVMV4tq45",
                "callbackUrl" => $this->url->link('checkout/cart'), // Đường dẫn sẽ xử lý khi thanh toán xong.
                "env" => "test", // or live
            );
    	return $configAlepay;
	}
}
