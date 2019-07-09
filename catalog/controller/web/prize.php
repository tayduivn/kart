<?php
class ControllerWebPrize extends Controller {

    public function index() {
        $this->load->language('web/prize');

        // Menu
        $this->load->model('web/prize');

        $this->load->model('tool/image');

        $data['prizes'] = array();

        $results = $this->model_web_prize->getPrizes();

        foreach($results as $result) {

            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], 419, 344);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 419, 344);
            }

            $data['prizes'][] = array(
                'title'  => $result['title'],
                'thumb'  => $image,
                'intro'  => trim(strip_tags(html_entity_decode($result['intro'], ENT_QUOTES, 'UTF-8')))
            );
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('prize_meta_title'),
            'href' => $this->url->link('web/prize')
        );

        $this->document->setTitle($this->language->get('prize_meta_title'));
        $this->document->setDescription($this->language->get('prize_meta_description'));
        $this->document->setKeywords($this->language->get('prize_meta_keywords'));
        $this->document->addLink($this->url->link('web/prize'), 'canonical');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->response->setOutput($this->load->view('web/prize', $data));
    }

}
