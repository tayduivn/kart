<?php
class ControllerWebPhone extends Controller {

    public function update() {
        $phone = $this->request->post['phone'];
        
        $json = array(
            'phone' => $phone,
            'success' => true
        );
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function insurance() {
        $phone = $this->request->post['phone'];
        
        $json = array(
            'phone' => $phone,
            'success' => true
        );
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
