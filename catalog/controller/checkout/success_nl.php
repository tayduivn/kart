<?php
class ControllerCheckoutSuccessNl extends Controller {

	public function index() {

		if (isset($_GET['payment_id'])) {
			// Lấy các tham số để chuyển sang Ngânlượng thanh toán:
			$config = $this->nganluong_config();

			$transaction_info =$_GET['transaction_info'];
			$order_code =$_GET['order_code'];
			$price =$_GET['price'];
			$payment_id =$_GET['payment_id'];
			$payment_type =$_GET['payment_type'];
			$error_text =$_GET['error_text'];
			$secure_code =$_GET['secure_code'];

		    //Khai báo đối tượng của lớp NL_Checkout
			$nl= new NL_Checkout();
			$nl->merchant_site_code = $config['merchant_code'];
			$nl->secure_pass = $config['secure_pass'];
			//Tạo link thanh toán đến nganluong.vn
			$checkpay= $nl->verifyPaymentUrl($transaction_info, $order_code, $price, $payment_id, $payment_type, $error_text, $secure_code);
			
		    if ($checkpay) {	
				$data['alert'] = "Giao dịch Thành Công! Mã đơn hàng: " . $order_code;
			}else{
				$data['alert'] =  "Giao dịch Thất Bại! Liên lạc Kingsport để biết thêm chi tiết. Mã đơn hàng: " . $$order_code;
			}

			$this->load->model('checkout/order');

            $this->model_checkout_order->updateOrderAfterPayment($order_code, $_GET);
            $this->model_checkout_order->addOrderHistory($order_code, 1);
			
		}


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
        $customer = $firstname . ' ' . $lastname;


        $payment_info = '';
        foreach ($this->cart->getProducts() as $product) {
        	$payment_info .= $product['quantity'] . ' ' . $product['name'] . ' ';
        }
        

		$this->load->language('checkout/success');

		if (isset($this->session->data['order_id'])) {
			$this->cart->clear();

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf('<p>Cảm ơn anh(chị) <strong>%s</strong> đã cho KingSport cơ hội được phục vụ. Anh đã đặt hàng thành công <strong>%s</strong> . Trước khi giao hàng nhân viên của KingSport sẽ gửi tin nhắn hoặc gọi xác nhận giao hàng cho anh.</p>
	<p>Xin chân thành cảm ơn và trân trọng phục vụ quý khách!</p>', $customer, $payment_info);
		} else {
			$data['text_message'] = sprintf('<p>Cảm ơn anh(chị) <strong>%s</strong> đã cho KingSport cơ hội được phục vụ. Anh đã đặt hàng thành công <strong>%s</strong> . Trước khi giao hàng nhân viên của KingSport sẽ gửi tin nhắn hoặc gọi xác nhận giao hàng cho anh.</p>
	<p>Xin chân thành cảm ơn và trân trọng phục vụ quý khách!</p>', $customer, $payment_info);
		}

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}


	private function nganluong_config() {
    	return array(
    		'receiver' => 'thducuit@gmail.com',
    		'url' => 'https://www.nganluong.vn/checkout.php',
    		'url_test' => 'https://sandbox.nganluong.vn:8088/nl35/checkout.php',
    		'merchant_code' => '47791',
    		'secure_pass' => '5ecdced2fbe828b9d89d5ec2ebfc7344',
    	);
    }

}