<?php
class ControllerCommonProductOther extends Controller {
    public function index($setting) {
        $this->load->language('common/product_other');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['products'] = array();

        //san pham moi
        $filter_data = array(
            'sort'  => 'pd.name',
            'order' => 'ASC',
            'start' => 0,
            'limit' => 16,
            'filter_category_id'  => 66,
            'filter_sub_category' => true,
            'is_new'=> true
        );

        $results = $this->model_catalog_product->getProducts($filter_data);

        if ($results) {
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], 119, 136);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', 119, 136);
                }

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $price = false;
                }

                if ((float)$result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = $result['rating'];
                } else {
                    $rating = false;
                }

                $percent = is_numeric($special) && is_numeric($price) ? (round(($special - $price) / $price , 2)) * 100 : 0;

                $data['products'][] = array(
                    'product_id'  => $result['product_id'],
                    'thumb'       => $image,
                    'gift'        => trim(strip_tags(html_entity_decode($result['gift'], ENT_QUOTES, 'UTF-8'))),
                    'description' => utf8_substr(trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price'       => $price,
                    'special'     => $special,
                    'percent'     =>    "(". $percent . "%)",
                    'tax'         => $tax,
                    'rating'      => $rating,
                    'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            $data['readmore'] = $this->url->link('product/category', 'category_id=66');
            return $this->load->view('common/product_other', $data);
        }
    }
}
