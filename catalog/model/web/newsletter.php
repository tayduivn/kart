<?php
class ModelWebNewsletter extends Model {

    public function save($phone, $type) {
        $query = "INSERT INTO " . DB_PREFIX . "newsletter SET number = '" . $phone . "', type = '" . $type . "'";
        $rs = $this->db->query($query);
        return $rs;
    }

}