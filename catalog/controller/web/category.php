<?php
class ControllerWebCategory extends Controller {
	public function index() {
	   
		$this->load->language('web/category');

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
    			'category_id' => $category_id
    		);
    
    		$results = $this->model_web_blog->getBlogs($filter_data);
            
            foreach ($results as $result) {
    				
                    if ($result['image']) {
    					$image = $this->model_tool_image->resize($result['image'], 419, 278);
    				} else {
    					$image = $this->model_tool_image->resize('placeholder.png', 419, 278);
    				}
                    
    				$data['blogs'][] = array(
    					'title'  => $result['title'],
                        'thumb'  => $image,
                        'intro'  => utf8_substr(trim(strip_tags(html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8'))), 0, 120) . '..',
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
        }else {

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('category_blog_title'),
                'href' => '#'
            );

            $results = $this->model_web_blog->getBlogs(array());

            foreach ($results as $result) {

                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], 419, 278);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', 419, 278);
                }

                $data['blogs'][] = array(
                    'title'  => $result['title'],
                    'thumb'  => $image,
                    'intro'  => utf8_substr(trim(strip_tags(html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8'))), 0, 120) . '..',
                    'date'   => $result['date_added'],
                    'href'   => $this->url->link('web/blog', 'blog_id=' . $result['blog_id'])
                );

            }

            $this->document->setTitle($this->language->get('category_blog_meta_title'));
            $this->document->setDescription($this->language->get('category_blog_meta_description'));
            $this->document->setKeywords($this->language->get('category_blog_meta_keyword'));
            $this->document->addLink($this->url->link('web/category'), 'canonical');

            $data['heading_title'] = $this->language->get('category_blog_title');

            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));

//            $data['blog_category_id'] = (int)$this->request->get['blog_category_id'];

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
