<?php
class ControllerWebBlog extends Controller {
    
	public function index() {
	       
		$this->load->language('web/blog');
        
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
        
        if (isset($this->request->get['blog_id'])) {
			$blog_id = (int)$this->request->get['blog_id'];
		} else {
			$blog_id = 0;
		}
        
        $this->load->model('web/blog');

		$blog_info = $this->model_web_blog->getBlog($blog_id);
        
        if ($blog_info) {
            
            $data['breadcrumbs'][] = array(
				'text' => $blog_info['title'],
				'href' => $this->url->link('web/blog', '&blog_id=' . $this->request->get['blog_id'])
			);
            
            $this->document->setTitle($blog_info['meta_title']);
			$this->document->setDescription($blog_info['meta_description']);
			$this->document->setKeywords($blog_info['meta_keyword']);
			$this->document->addLink($this->url->link('web/blog', 'blog_id=' . $this->request->get['blog_id']), 'canonical');
			
			$data['heading_title'] = $blog_info['title'];
            
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
        
            $data['blog_id'] = (int)$this->request->get['blog_id'];
			$data['description'] = html_entity_decode($blog_info['description'], ENT_QUOTES, 'UTF-8');

            $data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
            
            $data['blog_menu'] = $this->load->controller('common/blog_menu');

			$this->response->setOutput($this->load->view('web/blog', $data));
        }

		
	}
}
