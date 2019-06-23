<?php
class ControllerCommonHomeVideo extends Controller {
	public function index() { 
		$this->load->language('common/home_video');

		// Menu

		$this->load->model('web/video');

		$data['videos'] = array();

        $filter = array(
            'is_home' => 1
        );

		$data['videos'] = $this->model_web_video->getVideos($filter);

		return $this->load->view('common/home_video', $data);
	}
}
