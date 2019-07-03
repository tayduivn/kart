<?php
class ControllerWebVideoCategory extends Controller {
	public function index() {
	   
		$this->load->language('web/video_category');

		// Menu

		$this->load->model('web/video');
        
        $this->load->model('web/video_category');
        
        $this->load->model('tool/image');
        
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
        
        $category_id = isset($this->request->get['video_category_id']) ? $this->request->get['video_category_id'] : 0;
        
        $category_info = $this->model_web_video_category->getCategory($category_id);
        
        if ($category_info) { 
            $data['breadcrumbs'][] = array(
				'text' => $category_info['title'],
				'href' => $this->url->link('web/video_category', '?video_category_id=' . $this->request->get['video_category_id'])
    		);
                
                
            $filter_data = array(
    			'video_category_id' => $category_id
    		);
    
    		$results = $this->model_web_video->getVideos($filter_data);

    		$data['featured_video'] = [];


            
            foreach ($results as $result) {
                    if(!empty($result['featured_video'])) {
                        $data['featured_video'] = array(
                            'title'  => $result['title'],
                            'thumb'  => '/image/' . $result['image'],
                            'date'   => $result['date_added'],
                            'href'   => $this->url->link('web/video', 'video_id=' . $result['video_id']),
                            'link_ref'   => $result['link_ref'],
                            'featured_video'   => $result['featured_video'],
                            'url' => html_entity_decode($result['url'], ENT_QUOTES, 'UTF-8')
                        );
                    }else {
                        $data['videos'][] = array(
                            'title'  => $result['title'],
                            'thumb'  => '/image/' . $result['image'],
                            'date'   => $result['date_added'],
                            'href'   => $this->url->link('web/video', 'video_id=' . $result['video_id']),
                            'link_ref'   => empty($result['link_ref']),
                            'featured_video'   => $result['featured_video'],
                            'url' => html_entity_decode($result['url'], ENT_QUOTES, 'UTF-8')
                        );
                    }
    		}

            if( empty($data['featured_video']) && count($data['videos']) != 0 ) {
                $data['featured_video'] = $data['videos'][0];
            }

            $this->document->setTitle($category_info['meta_title']);
    		$this->document->setDescription($category_info['meta_description']);
    		$this->document->setKeywords($category_info['meta_keyword']);
    		$this->document->addLink($this->url->link('web/video_category', 'video_category_id=' . $this->request->get['video_category_id']), 'canonical');
    		
    		$data['heading_title'] = $category_info['title'];
            
            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
        
            $data['video_category_id'] = (int)$this->request->get['video_category_id'];
    		$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
                
            
            $data['column_left'] = $this->load->controller('common/column_left');
    		$data['column_right'] = $this->load->controller('common/column_right');
    		$data['content_top'] = $this->load->controller('common/content_top');
    		$data['content_bottom'] = $this->load->controller('common/content_bottom');
    		$data['footer'] = $this->load->controller('common/footer');
    		$data['header'] = $this->load->controller('common/header');
            
            $data['video_menu'] = $this->load->controller('common/video_menu');
            
            $this->response->setOutput($this->load->view('web/video_category', $data));
        }else {

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('category_video_title'),
                'href' => '#'
            );

            $results = $this->model_web_video->getVideos(array());

            $data['featured_video'] = [];

            foreach ($results as $result) {
                if(!empty($result['featured_video'])) {
                    $data['featured_video'] = array(
                        'title'  => $result['title'],
                        'thumb'  => '/image/' . $result['image'],
                        'date'   => $result['date_added'],
                        'href'   => $this->url->link('web/video', 'video_id=' . $result['video_id']),
                        'link_ref'   => $result['link_ref'],
                        'featured_video'   => $result['featured_video'],
                        'url' => html_entity_decode($result['url'], ENT_QUOTES, 'UTF-8')
                    );
                }else {
                    $data['videos'][] = array(
                        'title'  => $result['title'],
                        'thumb'  => '/image/' . $result['image'],
                        'date'   => $result['date_added'],
                        'href'   => $this->url->link('web/video', 'video_id=' . $result['video_id']),
                        'link_ref'   => $result['link_ref'],
                        'featured_video'   => $result['featured_video'],
                        'url' => html_entity_decode($result['url'], ENT_QUOTES, 'UTF-8')
                    );
                }
            }

            if( empty($data['featured_video']) && count($data['videos']) != 0 ) {
                $data['featured_video'] = $data['videos'][0];
            }

            $this->document->setTitle($this->language->get('category_video_meta_title'));
            $this->document->setDescription($this->language->get('category_video_meta_description'));
            $this->document->setKeywords($this->language->get('category_video_meta_keyword'));
            $this->document->addLink($this->url->link('web/video_category'), 'canonical');

            $data['heading_title'] = $this->language->get('category_video_title');

            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));

//            $data['blog_category_id'] = (int)$this->request->get['blog_category_id'];

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $data['video_menu'] = $this->load->controller('common/video_menu');

            $this->response->setOutput($this->load->view('web/video_category', $data));
        }
        
	}
}
