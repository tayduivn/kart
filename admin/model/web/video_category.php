<?php
class ModelWebVideoCategory extends Model {

	public function addCategory($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "video_category SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', is_home = '" . (isset($data['is_home']) ? (int)$data['is_home'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$category_id = $this->db->getLastId();

		foreach ($data['video_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "video_category_description SET video_category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['video_category_store'])) {
			foreach ($data['video_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_category_to_store SET video_category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['video_category_seo_url'])) {
			foreach ($data['video_category_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'video_category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['video_category_layout'])) {
			foreach ($data['video_category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_category_to_layout SET video_category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('video_category');

		return $category_id;
	}

	public function editCategory($category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "video_category SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', is_home = '" . (isset($data['is_home']) ? (int)$data['is_home'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE video_category_id = '" . (int)$category_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "video_category_description WHERE video_category_id = '" . (int)$category_id . "'");

		foreach ($data['video_category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "video_category_description SET video_category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "video_category_to_store WHERE video_category_id = '" . (int)$category_id . "'");

		if (isset($data['video_category_store'])) {
			foreach ($data['video_category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_category_to_store SET video_category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'video_category_id=" . (int)$category_id . "'");

		if (isset($data['video_category_seo_url'])) {
			foreach ($data['video_category_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'video_category_id=" . (int)$category_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_category_to_layout` WHERE video_category_id = '" . (int)$category_id . "'");

		if (isset($data['video_category_layout'])) {
			foreach ($data['video_category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "video_category_to_layout` SET video_category_id = '" . (int)$category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('video_category');
	}

	public function deleteCategory($category_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_category` WHERE video_category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_category_description` WHERE video_category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_category_to_store` WHERE video_category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_category_to_layout` WHERE video_category_id = '" . (int)$category_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'video_category_id=" . (int)$category_id . "'");

		$this->cache->delete('video_category');
	}

	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT i.*, id.title FROM " . DB_PREFIX . "video_category i LEFT JOIN " . DB_PREFIX . "video_category_description id ON (i.video_category_id = id.video_category_id) WHERE id.video_category_id = '" . (int)$category_id . "'");

		return $query->row;
	}

	public function getCategories($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "video_category i LEFT JOIN " . DB_PREFIX . "video_category_description id ON (i.video_category_id = id.video_category_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

            if (!empty($data['filter_name'])) {
			     $sql .= " AND id.title LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
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
			$category_data = $this->cache->get('video_category.' . (int)$this->config->get('config_language_id'));

			if (!$category_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_category i LEFT JOIN " . DB_PREFIX . "video_category_description id ON (i.video_category = id.video_category) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$category_data = $query->rows;

				$this->cache->set('video_category.' . (int)$this->config->get('config_language_id'), $category_data);
			}

			return $category_data;
		}
	}

	public function getCategoryDescriptions($category_id) {
		$category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_category_description WHERE video_category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $category_description_data;
	}

	public function getCategoryStores($category_id) {
		$category_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_category_to_store WHERE video_category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}

		return $category_store_data;
	}

	public function getCategorySeoUrls($category_id) {
		$category_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'video_category_id=" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $category_seo_url_data;
	}

	public function getCategoryLayouts($category_id) {
		$category_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_category_to_layout WHERE video_category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $category_layout_data;
	}

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video_category");

		return $query->row['total'];
	}

	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}