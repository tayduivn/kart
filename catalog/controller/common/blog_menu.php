<?php
class ControllerCommonBlogMenu extends Controller {
	public function index() {
		$this->load->language('common/blog_menu');

		// Menu
		$this->load->model('web/category');

		$data['categories'] = array();
        
        $filter_data = array(
                'sort' => 'i.sort_order',
                'order' => 'desc'
    		);

		$categories = $this->model_web_category->getCategories($filter_data);

		foreach ($categories as $category) {
			// Level 1
			$data['categories'][] = array(
				'title'     => $category['title'],
				'href'     => $this->url->link('web/category', '&blog_category_id=' . $category['category_id'])
			);
		}
		return $this->load->view('common/blog_menu', $data);
	}
}
