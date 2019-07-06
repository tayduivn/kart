<?php
class ControllerWebContact extends Controller {

    public function index() {
        $this->load->language('web/contact');

        // Menu
        $this->load->model('web/branch');

        $this->load->model('tool/image');

        $data['branches'] = array();

        // $branch_categories = $this->model_web_branch_category->getCategories([
        //     'sort' => 'sort_order',
        //     'order' => 'ASC'
        // ]);

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('contact_meta_title'),
            'href' => $this->url->link('web/store')
        );

        $branches = $this->model_web_branch->getBranches([]);


        $data['branches'] = array();
        foreach ($branches as $branch) {

        	// $qrCode = sprintf("BEGIN:VCARD VERSION:2.1 N: FN: ORG: TITLE: %s TEL;WORK;VOICE: %s TEL;HOME;VOICE: ADR;WORK;PREF:;; %s EMAIL: %s END:VCARD", $branch['title'], $branch['phone'], $branch['email'], $branch['address']);

            $codeContents  = 'BEGIN:VCARD'."\n"; 
            $codeContents .= 'VERSION:3.0'."\n";
            $codeContents .= 'FN:'.$branch['title']."\n"; 
            $codeContents .= 'TITLE:'.$branch['title']."\n"; 
            $codeContents .= 'TEL;WORK;VOICE:'.$branch['phone']."\n"; 
            $codeContents .= 'EMAIL:'.$branch['email']."\n"; 
            $codeContents .= 'END:VCARD'; 

            $data['branches'][] = array(
                'title'     => $branch['title'],
                'description'  => $branch['description'],
                'phone'     => $branch['phone'],
                'lat'     => $branch['lat'],
                'lng'     => $branch['lng'],
                'address'     => isset($branch['address']) ? $branch['address'] : '',
                'parking'  => $branch['parking'],
                'qrCode'  => urlencode($codeContents),
                'href'     => $this->url->link('web/branch', '&branch_id=' . $branch['branch_id']),
            );
        }

        $this->document->setTitle($this->language->get('contact_meta_title'));
        $this->document->setDescription($this->language->get('contact_meta_description'));
        $this->document->setKeywords($this->language->get('contact_meta_keywords'));
        $this->document->addLink($this->url->link('web/contact'), 'canonical');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['heading_title'] = $this->language->get('heading_title');

        $this->response->setOutput($this->load->view('web/contact', $data));
    }

    
}
