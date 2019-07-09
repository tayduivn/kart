<?php
class ControllerWebLanding extends Controller {
    
	public function index() {
	       
		$this->load->language('web/landing');
        
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
        
        if (isset($this->request->get['landing_id'])) {
			$landing_id = (int)$this->request->get['landing_id'];
		} else {
			$landing_id = 0;
		}
        
        $this->load->model('web/landing');

		$landing_info = $this->model_web_landing->getLanding($landing_id);
        
        if ($landing_info) {
            
            $data['breadcrumbs'][] = array(
				'text' => $landing_info['title'],
				'href' => $this->url->link('web/landing', '&landing_id=' . $this->request->get['landing_id'])
			);
            
            $this->document->setTitle($landing_info['meta_title']);
			$this->document->setDescription($landing_info['meta_description']);
			$this->document->setKeywords($landing_info['meta_keyword']);
			$this->document->addLink($this->url->link('web/landing', 'landing_id=' . $this->request->get['landing_id']), 'canonical');
			
			$data['heading_title'] = $landing_info['title'];
            
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
        
            $data['landing_id'] = (int)$this->request->get['landing_id'];
			$data['description'] = html_entity_decode($landing_info['description'], ENT_QUOTES, 'UTF-8');

            $data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('web/landing', $data));
        }

		
	}
}
