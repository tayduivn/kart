<?php
class ModelWebBranch extends Model {

	public function addBranch($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "branch SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'" . "', area = '" . (int)$data['area'] . "'" . "', parking = '" . (int)$data['parking'] . "'");

		$branch_id = $this->db->getLastId();

		foreach ($data['branch_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "branch_description SET branch_id = '" . (int)$branch_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', phone = '" . $this->db->escape($value['phone']) . "', lat = '" . $this->db->escape($value['lat']). "', lng = '" . $this->db->escape($value['lng']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['branch_store'])) {
			foreach ($data['branch_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_to_store SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
        
        if (isset($data['branch_image'])) {
			foreach ($data['branch_image'] as $branch_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_image SET branch_id = '" . (int)$branch_id . "', image = '" . $this->db->escape($branch_image['image']) . "', sort_order = '" . (int)$branch_image['sort_order'] . "'");
			}
		}

		// SEO URL
		if (isset($data['branch_seo_url'])) {
			foreach ($data['branch_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'branch_id=" . (int)$branch_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['branch_layout'])) {
			foreach ($data['branch_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_to_layout SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('branch');

		return $branch_id;
	}

	public function editBranch($branch_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "branch SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "', area = '" . (int)$data['area'] . "', parking = '" . (int)$data['parking'] . "' WHERE branch_id = '" . (int)$branch_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "branch_description WHERE branch_id = '" . (int)$branch_id . "'");

		foreach ($data['branch_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "branch_description SET branch_id = '" . (int)$branch_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "branch_to_store WHERE branch_id = '" . (int)$branch_id . "'");

		if (isset($data['branch_store'])) {
			foreach ($data['branch_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_to_store SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
        
        $this->db->query("DELETE FROM " . DB_PREFIX . "branch_image WHERE branch_id = '" . (int)$branch_id . "'");

		if (isset($data['branch_image'])) {
			foreach ($data['branch_image'] as $branch_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_image SET branch_id = '" . (int)$branch_id . "', image = '" . $this->db->escape($branch_image['image']) . "', sort_order = '" . (int)$branch_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'branch_id=" . (int)$branch_id . "'");

		if (isset($data['branch_seo_url'])) {
			foreach ($data['branch_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'branch_id=" . (int)$branch_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch_to_layout` WHERE branch_id = '" . (int)$branch_id . "'");

		if (isset($data['branch_layout'])) {
			foreach ($data['branch_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "branch_to_layout` SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('branch');
	}

	public function deleteBranch($branch_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch` WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch_description` WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch_image` WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch_to_store` WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "branch_to_layout` WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'branch_id=" . (int)$branch_id . "'");

		$this->cache->delete('branch');
	}

	public function getBranch($branch_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "branch WHERE branch_id = '" . (int)$branch_id . "'");

		return $query->row;
	}

	public function getBranchs($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "branch i LEFT JOIN " . DB_PREFIX . "branch_description id ON (i.branch_id = id.branch_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$branch_data = $this->cache->get('branch.' . (int)$this->config->get('config_language_id'));

			if (!$branch_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch i LEFT JOIN " . DB_PREFIX . "branch_description id ON (i.branch_id = id.branch_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$branch_data = $query->rows;

				$this->cache->set('branch.' . (int)$this->config->get('config_language_id'), $branch_data);
			}

			return $branch_data;
		}
	}

	public function getBranchDescriptions($branch_id) {
		$branch_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_description WHERE branch_id = '" . (int)$branch_id . "'");

		foreach ($query->rows as $result) {
			$branch_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description'],
				'phone'            => $result['phone'],
				'lat'              => $result['lat'],
				'lng'              => $result['lng'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $branch_description_data;
	}

	public function getBranchStores($branch_id) {
		$branch_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_to_store WHERE branch_id = '" . (int)$branch_id . "'");

		foreach ($query->rows as $result) {
			$branch_store_data[] = $result['store_id'];
		}

		return $branch_store_data;
	}

	public function getBranchSeoUrls($branch_id) {
		$branch_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'branch_id=" . (int)$branch_id . "'");

		foreach ($query->rows as $result) {
			$branch_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $branch_seo_url_data;
	}

	public function getBranchLayouts($branch_id) {
		$branch_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_to_layout WHERE branch_id = '" . (int)$branch_id . "'");

		foreach ($query->rows as $result) {
			$branch_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $branch_layout_data;
	}
    
    public function getBranchImages($branch_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_image WHERE branch_id = '" . (int)$branch_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getTotalBranchs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "branch");

		return $query->row['total'];
	}

	public function getTotalBranchsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "branch_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}