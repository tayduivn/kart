<?php
class ControllerCommonMobileHomeBanner extends Controller {
    public function index() {
        $this->load->language('common/mobile_home_banner');

        // Menu

        $this->load->model('tool/image');

        $this->load->model('design/banner');

        $banners = $this->model_design_banner->getBanner(10);

        $data['banners'] = array();

        foreach ($banners as $banner) {
            if (is_file(DIR_IMAGE . $banner['image'])) {
                $data['banners'][] = array(
                    'title' => $banner['title'],
                    'link'  => $banner['link'],
                    'image' => $this->model_tool_image->resize($banner['image'], 640, 420)
                );
            }
        }

        return $this->load->view('common/mobile_home_banner', $data);
    }
}
