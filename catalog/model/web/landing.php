<?php
class ModelWebLanding extends Model {

	public function getLandings($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "landing i LEFT JOIN " . DB_PREFIX . "landing_description id ON (i.landing_id = id.landing_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.sort_order'
			);

			if (isset($data['category_id'])) {
			    $sql .= "AND i.category_id =" . (int)$data['category_id'];
            }

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY id.title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$landing_data = $this->cache->get('landing.' . (int)$this->config->get('config_language_id'));

			if (!$landing_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing i LEFT JOIN " . DB_PREFIX . "landing_description id ON (i.landing_id = id.landing_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$landing_data = $query->rows;

				$this->cache->set('landing.' . (int)$this->config->get('config_language_id'), $landing_data);
			}

			return $landing_data;
		}
	}
    
    
    public function getLanding($landing_id) {
		$landing_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing i LEFT JOIN " . DB_PREFIX . "landing_description id ON (i.landing_id = id.landing_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i.landing_id = '" . (int)$landing_id . "'");

		return $query->row;
	}
    
}