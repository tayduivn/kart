<?php
class ControllerCommonBlog extends Controller {
	public function index() { 
		$this->load->language('common/blog');

		// Menu
        $this->load->model('tool/image');

		$this->load->model('web/category');

		$this->load->model('web/blog');

		$data['categories'] = array();

		$data['blogs'] = array();

        $filter = array(
            'is_home' => 1
        );

		$categories = $this->model_web_category->getCategories($filter);
        
		foreach ($categories as $category) {
		    $filters = array(
		        'category_id' => $category['category_id'],
                'start' => 0,
                'limit' => 6
            );

            $results = $this->model_web_blog->getBlogs($filters);

            foreach ($results as $result) {
                // if ($result['image']) {
                //     $image = $this->model_tool_image->resize($result['image'], 408, 408);
                // } else {
                //     $image = $this->model_tool_image->resize('placeholder.png', 408, 408);
                // }

                $image = '/image/' . $result['image'];

                $category['blogs'][] = array(
                    'thumb'  => $image,
                    'title'  => $result['title'],
                    'intro'  => utf8_substr(trim(strip_tags(html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8'))), 0, 120) . '..',
                    'date'   => $result['date_added'],
                    'href'   => $this->url->link('web/blog', 'blog_id=' . $result['blog_id'])   
                );
            }
            
            $category['href'] = $this->url->link('web/category', '&blog_category_id=' . $category['category_id']);
            
            $data['blogs'][] = $category;

            $banners = $this->model_design_banner->getBanner(8);

            $data['banners'] = array();

            foreach ($banners as $banner) {
                if (is_file(DIR_IMAGE . $banner['image'])) {
                    $data['banners'][] = array(
                        'title' => $banner['title'],
                        'link'  => $banner['link'],
                        'image' => $this->model_tool_image->resize($banner['image'], 700, 400)
                    );
                }
            }
		}

        

		return $this->load->view('common/blog', $data);
	}
}
