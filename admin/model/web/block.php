<?php
class ModelWebBlock extends Model {

	public function addBlock($data) {
        
		$this->db->query("INSERT INTO " . DB_PREFIX . "block SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$block_id = $this->db->getLastId();

		foreach ($data['block_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "block_description SET block_id = '" . (int)$block_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', category_id = '" . $this->db->escape($value['category_id'])  . "', banner_id = '" . $this->db->escape($value['banner_id']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['block_store'])) {
			foreach ($data['block_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "block_to_store SET block_id = '" . (int)$block_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['block_seo_url'])) {
			foreach ($data['block_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'block_id=" . (int)$block_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['block_layout'])) {
			foreach ($data['block_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "block_to_layout SET block_id = '" . (int)$block_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('block');

		return $block_id;
	}

	public function editBlock($block_id, $data) {  
       
		$this->db->query("UPDATE " . DB_PREFIX . "block SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE block_id = '" . (int)$block_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "block_description WHERE block_id = '" . (int)$block_id . "'");

		foreach ($data['block_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "block_description SET block_id = '" . (int)$block_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', category_id = '" . $this->db->escape($value['category_id'])  . "', banner_id = '" . $this->db->escape($value['banner_id']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "block_to_store WHERE block_id = '" . (int)$block_id . "'");

		if (isset($data['block_store'])) {
			foreach ($data['block_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "block_to_store SET block_id = '" . (int)$block_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'block_id=" . (int)$block_id . "'");

		if (isset($data['block_seo_url'])) {
			foreach ($data['block_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'block_id=" . (int)$block_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "block_to_layout` WHERE block_id = '" . (int)$block_id . "'");

		if (isset($data['block_layout'])) {
			foreach ($data['block_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "block_to_layout` SET block_id = '" . (int)$block_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('block');
	}

	public function deleteBlock($block_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "block` WHERE block_id = '" . (int)$block_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "block_description` WHERE block_id = '" . (int)$block_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "block_to_store` WHERE block_id = '" . (int)$block_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "block_to_layout` WHERE block_id = '" . (int)$block_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'block_id=" . (int)$block_id . "'");

		$this->cache->delete('block');
	}

	public function getBlock($block_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "block WHERE block_id = '" . (int)$block_id . "'");

		return $query->row;
	}

	public function getBlocks($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "block i LEFT JOIN " . DB_PREFIX . "block_description id ON (i.block_id = id.block_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$block_data = $this->cache->get('block.' . (int)$this->config->get('config_language_id'));

			if (!$block_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "block i LEFT JOIN " . DB_PREFIX . "block_description id ON (i.block_id = id.block_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$block_data = $query->rows;

				$this->cache->set('block.' . (int)$this->config->get('config_language_id'), $block_data);
			}

			return $block_data;
		}
	}

	public function getBlockDescriptions($block_id) {
		$block_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "block_description WHERE block_id = '" . (int)$block_id . "'");

		foreach ($query->rows as $result) {
			$block_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'category_id'      => $result['category_id'],
				'banner_id'        => $result['banner_id'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $block_description_data;
	}

	public function getBlockStores($block_id) {
		$block_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "block_to_store WHERE block_id = '" . (int)$block_id . "'");

		foreach ($query->rows as $result) {
			$block_store_data[] = $result['store_id'];
		}

		return $block_store_data;
	}

	public function getBlockSeoUrls($block_id) {
		$block_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'block_id=" . (int)$block_id . "'");

		foreach ($query->rows as $result) {
			$block_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $block_seo_url_data;
	}

	public function getBlockLayouts($block_id) {
		$block_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "block_to_layout WHERE block_id = '" . (int)$block_id . "'");

		foreach ($query->rows as $result) {
			$block_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $block_layout_data;
	}

	public function getTotalBlocks() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "block");

		return $query->row['total'];
	}

	public function getTotalBlocksByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "block_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}