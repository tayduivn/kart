<?php
class ControllerWebStore extends Controller {

    public function index() {
        $this->load->language('web/branch');

        // Menu
        $this->load->model('web/branch');

        $this->load->model('tool/image');

        $data['branches'] = array();

        $branches = $this->model_web_branch->getBranches(0);

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $area = array();

        foreach ($branches as $branch) {
            if(!isset($area[$branch['area']])) {
                $area[$branch['area']] = array();
            }

            $results = $this->model_web_branch->getBranchImages($branch['branch_id']);

            $images = array();

            foreach ($results as $result) {
                $images[] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_popup_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_popup_height')),
                    'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_additional_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_additional_height'))
                );
            }

            if ($branch['image']) {
                $image = $this->model_tool_image->resize($branch['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_category_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_category_height'));
            } else {
                $image = '';
            }

            $area[$branch['area']][] = array(
                'title'     => $branch['title'],
                'description'  => $branch['description'],
                'phone'     => $branch['phone'],
                'address'     => isset($branch['address']) ? $branch['address'] : '',
                'thumb' => $image,
                'parking'  => $branch['parking'],
                'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id']),
                'images'   => $images
            );
        }

        $data['branches'] = $area;

        $data['tabs'] = array(
            0 => $this->language->get('text_south'),
            1 => $this->language->get('text_middle'),
            2 => $this->language->get('text_north'),
        );

        $this->document->setTitle($this->language->get('meta_title'));
        $this->document->setDescription($this->language->get('meta_description'));
        $this->document->setKeywords($this->language->get('meta_keywords'));
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
}
