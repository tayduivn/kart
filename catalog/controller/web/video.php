<?php
class ControllerWebVideo extends Controller {

    public function index() {

        $this->load->language('web/video');

        $this->load->model('tool/image');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if (isset($this->request->get['video_id'])) {
            $video_id = (int)$this->request->get['video_id'];
        } else {
            $video_id = 0;
        }

        $this->load->model('web/video');

        $video_info = $this->model_web_video->getVideo($video_id);

        if ($video_info) {
            $data['breadcrumbs'][] = array(
                'text' => $video_info['title'],
                'href' => $this->url->link('web/video', '&video_id=' . $this->request->get['video_id'])
            );

            $videos = $this->model_web_video->getVideos([
                'video_category_id' => $video_info['video_category_id'],
                'limit' => 3,
                'start' => 0
            ]);

            $data['videos'] = array();

            foreach ($videos as $result) {

                // if ($result['image']) {
                //     $image = $this->model_tool_image->resize($result['image'], 300, 180);
                // } else {
                //     $image = $this->model_tool_image->resize('placeholder.png', 300, 180);
                // }

                $data['videos'][] = array(
                    'title'  => $result['title'],
                    'thumb'  => '/image/' . $result['image'],
                    'youtube'  => $result['youtube'],
                    'date'   => $result['date_added'],
                    'href'   => $this->url->link('web/video', 'video_id=' . $result['video_id'])
                );

            }

            $this->model_web_video->updateViewed($this->request->get['video_id']);

            $this->document->setTitle($video_info['meta_title']);
            $this->document->setDescription($video_info['meta_description']);
            $this->document->setKeywords($video_info['meta_keyword']);
            $this->document->addLink($this->url->link('web/video', 'video_id=' . $this->request->get['video_id']), 'canonical');

            $data['heading_title'] = $video_info['title'];

            $data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));

            $data['video_id'] = (int)$this->request->get['video_id'];
            $data['description'] = html_entity_decode($video_info['description'], ENT_QUOTES, 'UTF-8');
            $data['url'] = html_entity_decode($video_info['url'], ENT_QUOTES, 'UTF-8');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $data['video_menu'] = $this->load->controller('common/video_menu');

            $this->response->setOutput($this->load->view('web/video', $data));
        }


    }
}
