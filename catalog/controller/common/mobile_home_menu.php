<?php
class ControllerCommonMobileHomeMenu extends Controller {
    public function index() {
        $this->load->language('common/mobile_home_menu');

        // Menu
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        

        foreach ($categories as $category) {

            if ( !empty($category['icon']) ) {
                // Level 1
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'description' => htmlspecialchars_decode($category['description']),
                    'icon'      => $category['icon'],
                    'is_mobile_tag'      => $category['is_mobile_tag'],
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }

        }

        return $this->load->view('common/mobile_home_menu', $data);
    }
}
