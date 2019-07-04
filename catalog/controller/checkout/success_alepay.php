<?php
class ControllerCheckoutSuccessAlepay extends Controller {

	public function index() {

		$data = [];
		
		$config = $this->alepay_config();

		$encryptKey = $config['encryptKey'];

		if (isset($_REQUEST['data']) && isset($_REQUEST['checksum'])) {

		    $alepay = new Alepay($config);
		    $utils = new AlepayUtils();
		    $result = $utils->decryptCallbackData($_REQUEST['data'], $encryptKey);

		    $obj_data = json_decode($result);

		    //lay thong tin thanh toan
            $info = json_decode($alepay->getTransactionInfo($obj_data->data));

		    if ($obj_data->errorCode === '155') { // thanh toan tra gop Xử lý khi giao dịch chờ xác nhận
                // 
                $data['alert'] = "Trả góp Thành Công! Bạn nên xác nhận phía Ngân Hàng để Hoàn Thành thủ tục Giao Dịch";

            } else if ($obj_data->errorCode === '000') {

				$data['alert'] = "Giao dịch Thành Công! Mã đơn hàng: " . $info->orderCode;

            }
            else{

                 $data['alert'] =  "Giao dịch Thất Bại! Liên lạc Kingsport để biết thêm chi tiết. Mã đơn hàng: " . $info->orderCode;

            }

            

            $this->load->model('checkout/order');

            $this->model_checkout_order->updateOrderAfterPayment($info->orderCode, $info);
            $this->model_checkout_order->addOrderHistory($info->orderCode, 1);

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



	private function alepay_config() {
    	return  array(
            "apiKey" => "iOAQ0PO6pcsSvpQ1zfxtlaEWGk32xX", //Là key dùng để xác định tài khoản nào đang được sử dụng.
            "encryptKey" => "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC49HDk1rIVwvIBjHi48lS4w71vkiNbQdYWFK2PadIG/eHJAO3PWp3oWBJ5nnNwwD1CkuFLNUrewQ5gO+cV26a5EZQQ3tK6hlb43HbYN1jPOVpJ81Y2Xwx0Z/0NR61InoUPWfteljeQMX3Drn45Iqen5pCU3Oco40WoTKuvFXYLSwIDAQAB", //Là key dùng để mã hóa dữ liệu truyền tới Alepay.
            "checksumKey" => "QfDodb44QpuI4sScXlOS6cVMV4tq45", //Là key dùng để tạo checksum data.
            "callbackUrl" => $this->url->link('checkout/success_alepay'),
            "env" => "test",
        );
    }

}