<?php
class ControllerCommonVideoMenu extends Controller {
	public function index() {
		$this->load->language('common/video_menu');

		// Menu
		$this->load->model('web/video_category');

		$data['categories'] = array();
        
        $filter_data = array(
                'sort' => 'i.sort_order',
                'order' => 'desc'
    		);

		$categories = $this->model_web_video_category->getCategories($filter_data);

		foreach ($categories as $category) {
			// Level 1
			$data['categories'][] = array(
				'title'     => $category['title'],
				'href'     => $this->url->link('web/video_category', '&video_category_id=' . $category['video_category_id'])
			);
		}

		return $this->load->view('common/video_menu', $data);
	}
}
