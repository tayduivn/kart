<?php
class ControllerWebStore extends Controller {

    public function index() {
        $this->load->language('web/branch');

        // Menu
        $this->load->model('web/branch');

        $this->load->model('web/branch_category');

        $this->load->model('tool/image');

        $data['branches'] = array();

        $branch_categories = $this->model_web_branch_category->getCategories([
            'sort' => 'sort_order',
            'order' => 'ASC'
        ]);

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('branch_meta_title'),
            'href' => $this->url->link('web/store')
        );

        $area = array();
        $index = 1;
        foreach ($branch_categories as $branch_category) {

            $branches = $this->model_web_branch->getBranches([
                'branch_category_id' => $branch_category['branch_category_id']
            ]);


            $branchArr = array();
            foreach ($branches as $branch) {

                $results = $this->model_web_branch->getBranchImages($branch['branch_id']);

                $images = array();

                foreach ($results as $result) {
                    $images[] = array(
                        'popup' => $this->model_tool_image->resize($result['image'], 900, 900),
                        'thumb' => $this->model_tool_image->resize($result['image'], 70 , 70)
                    );
                }

                if ($branch['image']) {
                    // $image = $this->model_tool_image->resize($branch['image'], 168, 154);
                    $image = '/image/' . $branch['image'];
                } 

                if(!$image) {
                    // $image = $this->model_tool_image->resize($results[0]['image'], 168, 154);
                    $image = '/image/' . $branch[0]['image'];
                }

                $branchArr[] = array(
                    'title'     => $branch['title'],
                    'description'  => $branch['description'],
                    'phone'     => $branch['phone'],
                    'lat'     => $branch['lat'],
                    'lng'     => $branch['lng'],
                    'address'     => isset($branch['address']) ? $branch['address'] : '',
                    'thumb' => $image,
                    'parking'  => $branch['parking'],
                    'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id']),
                    'images'   => $images
                );
            }

            //var_dump($branchArr); die();

            $area[] = array(
                'title' => $branch_category['title'],
                'id' => $branch_category['branch_category_id'],
                'active' => $index == 1 ? 'active':'',
                'branches' => $branchArr
            );
            $index++;
        }

        $data['branches'] = $area;

        $data['tabs'] = array(
            0 => $this->language->get('text_south'),
            1 => $this->language->get('text_middle'),
            2 => $this->language->get('text_north'),
        );

        $this->document->setTitle($this->language->get('branch_meta_title'));
        $this->document->setDescription($this->language->get('branch_meta_description'));
        $this->document->setKeywords($this->language->get('branch_meta_keywords'));
        $this->document->addLink($this->url->link('web/store'), 'canonical');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->response->setOutput($this->load->view('web/store', $data));
    }

    public function update() {
        $id = $this->request->post['id'];
        if(!$id) {
            $id = (int)$this->$this->config->get('config_default_area_id');
        }
        setcookie('customer_branch', $id, 0, '/', $this->request->server['HTTP_HOST']);
        $json = array(
            'id' => $id,
            'success' => true
        );
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function search() {
        $this->load->language('web/branch_search');

        // Menu
        $this->load->model('web/branch');

        $this->load->model('web/branch_category');

        $this->load->model('tool/image');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('branch_meta_title'),
            'href' => $this->url->link('web/store')
        );

        $data['branches'] = array();

        
        if ( isset($this->request->get['lat']) && isset($this->request->get['lng']) ) {
            $branches = $this->model_web_branch->findNearest($this->request->get['lat'], $this->request->get['lng']);
        }else {
            $branch_cate_id = isset($this->request->cookie['customer_branch']) ? (int)$this->request->cookie['customer_branch'] : 0;
            $branches = $this->model_web_branch->getBranches([
                'branch_category_id' => $branch_cate_id,
                'is_main' => true
            ]);
        }

        foreach ($branches as $branch) {

            $results = $this->model_web_branch->getBranchImages($branch['branch_id']);

            $images = array();

            foreach ($results as $result) {
                $images[] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], 900, 900),
                    'thumb' => $this->model_tool_image->resize($result['image'], 70 , 70)
                );
            }

            if ($branch['image']) {
                $image = $this->model_tool_image->resize($branch['image'], 168, 154);
            } 

            if(!$image) {
                $image = $this->model_tool_image->resize($results[0]['image'], 168, 154);
            }

            $data['branches'][] = array(
                'title'     => $branch['title'],
                'description'  => $branch['description'],
                'phone'     => $branch['phone'],
                'lat'     => $branch['lat'],
                'lng'     => $branch['lng'],
                'address'     => isset($branch['address']) ? $branch['address'] : '',
                'thumb' => $image,
                'parking'  => $branch['parking'],
                'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id']),
                'images'   => $images
            );
        }

        // var_dump($data['branches']); die();

        $this->document->setTitle($this->language->get('branch_meta_title'));
        $this->document->setDescription($this->language->get('branch_meta_description'));
        $this->document->setKeywords($this->language->get('branch_meta_keywords'));
        $this->document->addLink($this->url->link('web/store'), 'canonical');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->response->setOutput($this->load->view('web/store_search', $data));

    }
}
