<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {

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

        $this->load->model('checkout/order');
        $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], 1);

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
			$data['text_message'] = sprintf('<p>Cảm ơn anh(chị) <strong>%s</strong> đã cho KingSport cơ hội được phục vụ. Quý khách đã đặt hàng thành công <strong>%s</strong> . Trước khi giao hàng nhân viên của KingSport sẽ gửi tin nhắn hoặc gọi xác nhận giao hàng cho Quý khách.</p>
		<p class="hightlight">Xin chân thành cảm ơn và trân trọng phục vụ quý khách!</p>', $customer, $payment_info);
		} else {
			$data['text_message'] = sprintf('<p>Cảm ơn anh(chị) <strong>%s</strong> đã cho KingSport cơ hội được phục vụ. Quý khách đã đặt hàng thành công <strong>%s</strong> . Trước khi giao hàng nhân viên của KingSport sẽ gửi tin nhắn hoặc gọi xác nhận giao hàng cho Quý khách.</p>
		<p class="hightlight">Xin chân thành cảm ơn và trân trọng phục vụ Quý khách!</p>', $customer, $payment_info);
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
}