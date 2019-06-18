<?php
class ControllerCommonBlog extends Controller {
	public function index() { 
		$this->load->language('common/blog');

		// Menu
		$this->load->model('web/category');

		$this->load->model('web/blog');

		$data['categories'] = array();
        
        $filter = array(
            'is_home' => 1
        );

		$categories = $this->model_web_category->getCategories($filter);
        
		foreach ($categories as $category) {
			
		}
		return $this->load->view('common/blog', $data);
	}
}
