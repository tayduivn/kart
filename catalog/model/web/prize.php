<?php
class ModelWebPrize extends Model {

	public function getPrizes($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "prize i LEFT JOIN " . DB_PREFIX . "prize_description id ON (i.prize_id = id.prize_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";
            
			$sort_data = array(
				'id.title',
				'i.sort_order'
			);

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
			$prize_data = $this->cache->get('prize.' . (int)$this->config->get('config_language_id'));

			if (!$prize_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "prize i LEFT JOIN " . DB_PREFIX . "prize_description id ON (i.prize_id = id.prize_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$prize_data = $query->rows;

				$this->cache->set('prize.' . (int)$this->config->get('config_language_id'), $prize_data);
			}

			return $prize_data;
		}
	}
    
}