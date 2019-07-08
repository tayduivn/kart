<?php
class ModelWebPrize extends Model {

	public function addPrize($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "prize SET sort_order = '" . (int)$data['sort_order'] . "', category_id = '" . (int)$data['category_id'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$prize_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "prize SET image = '" . $this->db->escape($data['image']) . "' WHERE prize_id = '" . (int)$prize_id . "'");
        }

		foreach ($data['prize_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "prize_description SET prize_id = '" . (int)$prize_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', intro = '" . $this->db->escape($value['intro']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['prize_store'])) {
			foreach ($data['prize_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "prize_to_store SET prize_id = '" . (int)$prize_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['prize_seo_url'])) {
			foreach ($data['prize_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'prize_id=" . (int)$prize_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['prize_layout'])) {
			foreach ($data['prize_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "prize_to_layout SET prize_id = '" . (int)$prize_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('prize');

		return $prize_id;
	}

	public function editPrize($prize_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "prize SET sort_order = '" . (int)$data['sort_order'] . "', category_id = '" . (int)$data['category_id'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE prize_id = '" . (int)$prize_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "prize SET image = '" . $this->db->escape($data['image']) . "' WHERE prize_id = '" . (int)$prize_id . "'");
        }

		$this->db->query("DELETE FROM " . DB_PREFIX . "prize_description WHERE prize_id = '" . (int)$prize_id . "'");

		foreach ($data['prize_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "prize_description SET prize_id = '" . (int)$prize_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', intro = '" . $this->db->escape($value['intro']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "prize_to_store WHERE prize_id = '" . (int)$prize_id . "'");

		if (isset($data['prize_store'])) {
			foreach ($data['prize_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "prize_to_store SET prize_id = '" . (int)$prize_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'prize_id=" . (int)$prize_id . "'");

		if (isset($data['prize_seo_url'])) {
			foreach ($data['prize_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'prize_id=" . (int)$prize_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "prize_to_layout` WHERE prize_id = '" . (int)$prize_id . "'");

		if (isset($data['prize_layout'])) {
			foreach ($data['prize_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "prize_to_layout` SET prize_id = '" . (int)$prize_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('prize');
	}

	public function deletePrize($prize_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "prize` WHERE prize_id = '" . (int)$prize_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "prize_description` WHERE prize_id = '" . (int)$prize_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "prize_to_store` WHERE prize_id = '" . (int)$prize_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "prize_to_layout` WHERE prize_id = '" . (int)$prize_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'prize_id=" . (int)$prize_id . "'");

		$this->cache->delete('prize');
	}

	public function getPrize($prize_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "prize WHERE prize_id = '" . (int)$prize_id . "'");

		return $query->row;
	}

	public function getPrizes($data = array()) {
		if ($data) {
			$sql = "SELECT id.*, i.* FROM " . DB_PREFIX . "prize i LEFT JOIN " . DB_PREFIX . "prize_description id ON (i.prize_id = id.prize_id)  WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			if ( isset($data['category']) && !empty($data['category'])  ) {
				$sql .= ' AND i.category_id = ' . (int)$data['category'];
			}

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

	public function getPrizeDescriptions($prize_id) {
		$prize_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "prize_description WHERE prize_id = '" . (int)$prize_id . "'");

		foreach ($query->rows as $result) {
			$prize_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'intro'      => $result['intro'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $prize_description_data;
	}

	public function getPrizeStores($prize_id) {
		$prize_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "prize_to_store WHERE prize_id = '" . (int)$prize_id . "'");

		foreach ($query->rows as $result) {
			$prize_store_data[] = $result['store_id'];
		}

		return $prize_store_data;
	}

	public function getPrizeSeoUrls($prize_id) {
		$prize_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'prize_id=" . (int)$prize_id . "'");

		foreach ($query->rows as $result) {
			$prize_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $prize_seo_url_data;
	}

	public function getPrizeLayouts($prize_id) {
		$prize_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "prize_to_layout WHERE prize_id = '" . (int)$prize_id . "'");

		foreach ($query->rows as $result) {
			$prize_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $prize_layout_data;
	}

	public function getTotalPrizes() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "prize");

		return $query->row['total'];
	}

	public function getTotalPrizesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "prize_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}