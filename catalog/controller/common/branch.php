<?php
class ControllerCommonBranch extends Controller {
	public function index() {
		$this->load->language('web/branch');

		// Menu
		$this->load->model('web/branch');

		$this->load->model('web/branch_category');

		$data['branches'] = array();

		$branch_categories = $this->model_web_branch_category->getCategories([
		    'sort' => 'sort_order',
            'order' => 'ASC'
        ]);
        
        $area = array();
        $index = 1;
		foreach ($branch_categories as $branch_category) {

            $branches = $this->model_web_branch->getBranches([
                'branch_category_id' => $branch_category['branch_category_id']
            ]);

            $branchArr = array();
            foreach ($branches as $branch) {
                $branchArr[] = array(
                    'title'     => $branch['title'],
                    'description'  => $branch['description'],
                    'phone'     => $branch['phone'],
                    'address'     => $branch['address'],
                    'parking'  => $branch['parking'],
                    'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id'])
                );
            }

			$area[] = array(
			    'title' => $branch_category['title'],
			    'id' => $branch_category['branch_category_id'],
			    'active' => $index == 1 ? 'active':'',
                'branches' => $branchArr
            );
            $index++;
		}
        
        $data['branches'] = $area;
        
        $data['heading_title'] = $this->language->get('heading_title');
        
		return $this->load->view('common/branch', $data);
	}
}
