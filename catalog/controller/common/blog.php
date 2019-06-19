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
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], 408, 408);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', 408, 408);
                }

                $category['blogs'][] = array(
                    'thumb'  => $image,
                    'title'  => $result['title'],
                    'intro'  => $result['intro'],
                );
            }

            $data['blogs'][] = $category;
		}

		return $this->load->view('common/blog', $data);
	}
}
