<?php
class ControllerWebCategory extends Controller {
	public function index() {
	   
		$this->load->language('web/blog_category');

		// Menu

		$this->load->model('web/blog');
        
        $this->load->model('web/category');
        
        $this->load->model('tool/image');
        
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
        
        $category_id = isset($this->request->get['blog_category_id']) ? $this->request->get['blog_category_id'] : 0;
        
        $category_info = $this->model_web_category->getCategory($category_id);
        
        if ($category_info) { 
            $data['breadcrumbs'][] = array(
				'text' => $category_info['title'],
				'href' => $this->url->link('web/category', '?blog_category_id=' . $this->request->get['blog_category_id'])
    		);
                
                
            $filter_data = array(
    			'filter_category_id' => $category_id
    		);
    
    		$results = $this->model_web_blog->getBlogs($filter_data);
            
            foreach ($results as $result) {
    				
                    if ($result['image']) {
    					$image = $this->model_tool_image->resize($result['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
    				} else {
    					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
    				}
                    
    				$data['blogs'][] = array(
    					'title'  => $result['title'],
                        'thumb'  => $image,
                        'intro'  => $result['intro'],
                        'date'   => $result['date_added'],
                        'href'   => $this->url->link('web/blog', 'blog_id=' . $result['blog_id'])
    				);
                    
    		}
            
            $this->document->setTitle($category_info['meta_title']);
    		$this->document->setDescription($category_info['meta_description']);
    		$this->document->setKeywords($category_info['meta_keyword']);
    		$this->document->addLink($this->url->link('web/category', 'blog_category_id=' . $this->request->get['blog_category_id']), 'canonical');
    		
    		$data['heading_title'] = $category_info['title'];
            
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
        
            $data['blog_category_id'] = (int)$this->request->get['blog_category_id'];
    		$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
                
            
            $data['column_left'] = $this->load->controller('common/column_left');
    		$data['column_right'] = $this->load->controller('common/column_right');
    		$data['content_top'] = $this->load->controller('common/content_top');
    		$data['content_bottom'] = $this->load->controller('common/content_bottom');
    		$data['footer'] = $this->load->controller('common/footer');
    		$data['header'] = $this->load->controller('common/header');
            
            $data['blog_menu'] = $this->load->controller('common/blog_menu');
            
            $this->response->setOutput($this->load->view('web/category', $data));
        }
        
	}
}
