<?php
class ControllerCommonBranch extends Controller {
	public function index() {
		$this->load->language('web/branch');

		// Menu
		$this->load->model('web/branch');

		$data['branches'] = array();

		$branches = $this->model_web_branch->getBranches(0);
        
        
        
        $area = array();

		foreach ($branches as $branch) {
			if(!isset($area[$branch['area']])) {
			 $area[$branch['area']] = array();
			}
            
			$area[$branch['area']][] = array(
				'title'     => $branch['title'],
                'description'  => $branch['description'],
                'phone'     => $branch['phone'],
                'address'     => $branch['address'],
                'parking'  => $branch['parking'],
				'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id'])
			);
		}
        
        $data['branches'] = $area;
        
        
        
        $data['tabs'] = array(
            0 => $this->language->get('text_south'),
            1 => $this->language->get('text_middle'),
            2 => $this->language->get('text_north'),
        );
        
        $data['heading_title'] = $this->language->get('heading_title');
        
		return $this->load->view('common/branch', $data);
	}
}
