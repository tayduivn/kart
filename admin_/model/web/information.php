<?php
class ModelWebInformation extends Model {

	public function addInfo($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "info SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$info_id = $this->db->getLastId();

		foreach ($data['info_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "info_description SET info_id = '" . (int)$info_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['info_store'])) {
			foreach ($data['info_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "info_to_store SET info_id = '" . (int)$info_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['info_seo_url'])) {
			foreach ($data['info_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'info_id=" . (int)$info_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['info_layout'])) {
			foreach ($data['info_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "info_to_layout SET info_id = '" . (int)$info_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('info');

		return $info_id;
	}

	public function editInfo($info_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "info SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE info_id = '" . (int)$info_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "info_description WHERE info_id = '" . (int)$info_id . "'");

		foreach ($data['info_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "info_description SET info_id = '" . (int)$info_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "info_to_store WHERE info_id = '" . (int)$info_id . "'");

		if (isset($data['info_store'])) {
			foreach ($data['info_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "info_to_store SET info_id = '" . (int)$info_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'info_id=" . (int)$info_id . "'");

		if (isset($data['info_seo_url'])) {
			foreach ($data['info_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'info_id=" . (int)$info_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "info_to_layout` WHERE info_id = '" . (int)$info_id . "'");

		if (isset($data['info_layout'])) {
			foreach ($data['info_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "info_to_layout` SET info_id = '" . (int)$info_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('info');
	}

	public function deleteInfo($info_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "info` WHERE info_id = '" . (int)$info_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "info_description` WHERE info_id = '" . (int)$info_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "info_to_store` WHERE info_id = '" . (int)$info_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "info_to_layout` WHERE info_id = '" . (int)$info_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'info_id=" . (int)$info_id . "'");

		$this->cache->delete('info');
	}

	public function getInfo($info_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "info WHERE info_id = '" . (int)$info_id . "'");

		return $query->row;
	}

	public function getInfos($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "info i LEFT JOIN " . DB_PREFIX . "info_description id ON (i.info_id = id.info_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$info_data = $this->cache->get('info.' . (int)$this->config->get('config_language_id'));

			if (!$info_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "info i LEFT JOIN " . DB_PREFIX . "info_description id ON (i.info_id = id.info_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$info_data = $query->rows;

				$this->cache->set('info.' . (int)$this->config->get('config_language_id'), $info_data);
			}

			return $info_data;
		}
	}

	public function getInfoDescriptions($info_id) {
		$info_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "info_description WHERE info_id = '" . (int)$info_id . "'");

		foreach ($query->rows as $result) {
			$info_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $info_description_data;
	}

	public function getInfoStores($info_id) {
		$info_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "info_to_store WHERE info_id = '" . (int)$info_id . "'");

		foreach ($query->rows as $result) {
			$info_store_data[] = $result['store_id'];
		}

		return $info_store_data;
	}

	public function getInfoSeoUrls($info_id) {
		$info_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'info_id=" . (int)$info_id . "'");

		foreach ($query->rows as $result) {
			$info_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $info_seo_url_data;
	}

	public function getInfoLayouts($info_id) {
		$info_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "info_to_layout WHERE info_id = '" . (int)$info_id . "'");

		foreach ($query->rows as $result) {
			$info_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $info_layout_data;
	}

	public function getTotalInfos() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "info");

		return $query->row['total'];
	}

	public function getTotalInfosByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "info_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}