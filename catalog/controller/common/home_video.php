<?php
class ControllerCommonHomeVideo extends Controller {
	public function index() { 
		$this->load->language('common/home_video');

		// Menu

		$this->load->model('web/video');

		$data['videos'] = array();

        $filter = array(
            'is_home' => 1,
            'start' => 0,
            'limit' => 5
        );

        $results = $this->model_web_video->getVideos($filter);

		$data['videos'] = array();

		foreach ($results as $result) {
			$data['videos'][] = array(
				'title' => $result['title'],
				'main' => $result['main'],
				'viewed' => $result['viewed'],
				'youtube' => str_replace("watch?v=", "embed/", $result['youtube']),
				'date_added' => $result['date_added'],
				'href'     => $this->url->link('web/video', '&video_id=' . $result['video_id'])
			);
		}

		return $this->load->view('common/home_video', $data);
	}
}
