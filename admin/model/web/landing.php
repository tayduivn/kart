<?php
class ModelWebLanding extends Model {

	public function addLanding($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "landing SET sort_order = '" . (int)$data['sort_order'] . "', category_id = '" . (int)$data['category_id'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$landing_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "landing SET image = '" . $this->db->escape($data['image']) . "' WHERE landing_id = '" . (int)$landing_id . "'");
        }

		foreach ($data['landing_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "landing_description SET landing_id = '" . (int)$landing_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', intro = '" . $this->db->escape($value['intro']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['landing_store'])) {
			foreach ($data['landing_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "landing_to_store SET landing_id = '" . (int)$landing_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['landing_seo_url'])) {
			foreach ($data['landing_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'landing_id=" . (int)$landing_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['landing_layout'])) {
			foreach ($data['landing_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "landing_to_layout SET landing_id = '" . (int)$landing_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('landing');

		return $landing_id;
	}

	public function editLanding($landing_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "landing SET sort_order = '" . (int)$data['sort_order'] . "', category_id = '" . (int)$data['category_id'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE landing_id = '" . (int)$landing_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "landing SET image = '" . $this->db->escape($data['image']) . "' WHERE landing_id = '" . (int)$landing_id . "'");
        }

		$this->db->query("DELETE FROM " . DB_PREFIX . "landing_description WHERE landing_id = '" . (int)$landing_id . "'");

		foreach ($data['landing_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "landing_description SET landing_id = '" . (int)$landing_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', intro = '" . $this->db->escape($value['intro']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "landing_to_store WHERE landing_id = '" . (int)$landing_id . "'");

		if (isset($data['landing_store'])) {
			foreach ($data['landing_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "landing_to_store SET landing_id = '" . (int)$landing_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'landing_id=" . (int)$landing_id . "'");

		if (isset($data['landing_seo_url'])) {
			foreach ($data['landing_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'landing_id=" . (int)$landing_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "landing_to_layout` WHERE landing_id = '" . (int)$landing_id . "'");

		if (isset($data['landing_layout'])) {
			foreach ($data['landing_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "landing_to_layout` SET landing_id = '" . (int)$landing_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('landing');
	}

	public function deleteLanding($landing_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "landing` WHERE landing_id = '" . (int)$landing_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "landing_description` WHERE landing_id = '" . (int)$landing_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "landing_to_store` WHERE landing_id = '" . (int)$landing_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "landing_to_layout` WHERE landing_id = '" . (int)$landing_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'landing_id=" . (int)$landing_id . "'");

		$this->cache->delete('landing');
	}

	public function getLanding($landing_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "landing WHERE landing_id = '" . (int)$landing_id . "'");

		return $query->row;
	}

	public function getLandings($data = array()) {
		if ($data) {
			$sql = "SELECT id.*, i.* FROM " . DB_PREFIX . "landing i LEFT JOIN " . DB_PREFIX . "landing_description id ON (i.landing_id = id.landing_id)  WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$landing_data = $this->cache->get('landing.' . (int)$this->config->get('config_language_id'));

			if (!$landing_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing i LEFT JOIN " . DB_PREFIX . "landing_description id ON (i.landing_id = id.landing_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$landing_data = $query->rows;

				$this->cache->set('landing.' . (int)$this->config->get('config_language_id'), $landing_data);
			}

			return $landing_data;
		}
	}

	public function getLandingDescriptions($landing_id) {
		$landing_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing_description WHERE landing_id = '" . (int)$landing_id . "'");

		foreach ($query->rows as $result) {
			$landing_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'intro'      => $result['intro'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $landing_description_data;
	}

	public function getLandingStores($landing_id) {
		$landing_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing_to_store WHERE landing_id = '" . (int)$landing_id . "'");

		foreach ($query->rows as $result) {
			$landing_store_data[] = $result['store_id'];
		}

		return $landing_store_data;
	}

	public function getLandingSeoUrls($landing_id) {
		$landing_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'landing_id=" . (int)$landing_id . "'");

		foreach ($query->rows as $result) {
			$landing_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $landing_seo_url_data;
	}

	public function getLandingLayouts($landing_id) {
		$landing_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "landing_to_layout WHERE landing_id = '" . (int)$landing_id . "'");

		foreach ($query->rows as $result) {
			$landing_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $landing_layout_data;
	}

	public function getTotalLandings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "landing");

		return $query->row['total'];
	}

	public function getTotalLandingsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "landing_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}