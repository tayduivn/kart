<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        
        $this->load->model('setting/module');
        $setting_info = $this->model_setting_module->getModulesByCode('recently_viewed');
        $data['recently_viewed'] = $this->load->controller('extension/module/recently_viewed', $setting_info);
        
        $setting_info = $this->model_setting_module->getModulesByCode('special');
        $data['special'] = $this->load->controller('extension/module/special', $setting_info);
        
        $setting_info = $this->model_setting_module->getModulesByCode('bestseller');
        $data['bestseller'] = $this->load->controller('extension/module/bestseller', $setting_info);
        
        $data['newest'] = $this->load->controller('extension/module/newest', $setting_info);
        
        $data['blog'] = $this->load->controller('common/blog');
        
        $data['branch'] = $this->load->controller('common/branch');
        
        $data['home_video'] = $this->load->controller('common/home_video');

        $data['home_banner'] = $this->load->controller('common/home_banner');

        $data['mobile_home_banner'] = $this->load->controller('common/mobile_home_banner');

        $data['mobile_home_menu'] = $this->load->controller('common/mobile_home_menu');

        $data['block'] = $this->load->controller('common/block');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
