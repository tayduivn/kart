<?php
class ControllerWebPhone extends Controller {

    public function update() {
        $phone = $this->request->post['phone'];
        $type = $this->request->post['type'];

        $this->load->model('web/newsletter');

        $this->model_web_newsletter->save($phone, $type);
        
        $json = array(
            'phone' => $phone,
            'success' => true
        );
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function insurance() {
        $phone = $this->request->post['phone'];
        $type = $this->request->post['type'];

        $this->load->model('web/newsletter');

        $this->model_web_newsletter->save($phone, $type);

        $json = array(
            'phone' => $phone,
            'success' => true
        );
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
