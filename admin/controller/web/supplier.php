<?php
class ControllerWebSupplier extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('web/supplier');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('web/supplier');

		$this->getList();
	}
	
}
