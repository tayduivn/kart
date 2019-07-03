<?php
class ControllerCommonHomeBanner extends Controller {
    public function index() {
        $this->load->language('common/home_banner');

        // Menu

        $this->load->model('tool/image');

        $this->load->model('design/banner');

        $banners = $this->model_design_banner->getBanner('6');

        $data['banners'] = array();

        foreach ($banners as $banner) {
            if (is_file(DIR_IMAGE . $banner['image'])) {
                $data['banners'][] = array(
                    'title' => $banner['title'],
                    'link'  => $banner['link'],
                    'image' => $this->model_tool_image->resize($banner['image'], 339, 229)
                );
            }
        }

        return $this->load->view('common/home_banner', $data);
    }
}
