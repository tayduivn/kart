<?php
class ModelWebVideo extends Model {

	public function addVideo($data) {
		
        if(isset($data['main']) && (int)$data['main'] == 1) {
            $this->db->query("UPDATE " . DB_PREFIX . "video SET main = '0'");
        }
        
		$this->db->query("INSERT INTO " . DB_PREFIX . "video SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', main = '" . (isset($data['main']) ? (int)$data['main'] : 0) . "', home = '" . (isset($data['home']) ? (int)$data['home'] : 0) . "', status = '" . (int)$data['status'] . "'");

		$video_id = $this->db->getLastId();

		foreach ($data['video_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "video_description SET video_id = '" . (int)$video_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', url = '" . $this->db->escape($value['url']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['video_store'])) {
			foreach ($data['video_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_to_store SET video_id = '" . (int)$video_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// SEO URL
		if (isset($data['video_seo_url'])) {
			foreach ($data['video_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "seo_url SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'video_id=" . (int)$video_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}
		
		if (isset($data['video_layout'])) {
			foreach ($data['video_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_to_layout SET video_id = '" . (int)$video_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('video');

		return $video_id;
	}

	public function editVideo($video_id, $data) {
	    
        if(isset($data['main']) && (int)$data['main'] == 1) {
            $this->db->query("UPDATE " . DB_PREFIX . "video SET main = '0'");
        }   
       
		$this->db->query("UPDATE " . DB_PREFIX . "video SET sort_order = '" . (int)$data['sort_order'] . "', bottom = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "', main = '" . (isset($data['main']) ? (int)$data['main'] : 0) . "', home = '" . (isset($data['home']) ? (int)$data['home'] : 0) . "', status = '" . (int)$data['status'] . "' WHERE video_id = '" . (int)$video_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");

		foreach ($data['video_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "video_description SET video_id = '" . (int)$video_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', url = '" . $this->db->escape($value['url'])  . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "video_to_store WHERE video_id = '" . (int)$video_id . "'");

		if (isset($data['video_store'])) {
			foreach ($data['video_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "video_to_store SET video_id = '" . (int)$video_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'video_id=" . (int)$video_id . "'");

		if (isset($data['video_seo_url'])) {
			foreach ($data['video_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (trim($keyword)) {
						$this->db->query("INSERT INTO `" . DB_PREFIX . "seo_url` SET store_id = '" . (int)$store_id . "', language_id = '" . (int)$language_id . "', query = 'video_id=" . (int)$video_id . "', keyword = '" . $this->db->escape($keyword) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_to_layout` WHERE video_id = '" . (int)$video_id . "'");

		if (isset($data['video_layout'])) {
			foreach ($data['video_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "video_to_layout` SET video_id = '" . (int)$video_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->cache->delete('video');
	}

	public function deleteVideo($video_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video` WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_description` WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_to_store` WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "video_to_layout` WHERE video_id = '" . (int)$video_id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "seo_url` WHERE query = 'video_id=" . (int)$video_id . "'");

		$this->cache->delete('video');
	}

	public function getVideo($video_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'");

		return $query->row;
	}

	public function getVideos($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "video i LEFT JOIN " . DB_PREFIX . "video_description id ON (i.video_id = id.video_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$video_data = $this->cache->get('video.' . (int)$this->config->get('config_language_id'));

			if (!$video_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video i LEFT JOIN " . DB_PREFIX . "video_description id ON (i.video_id = id.video_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$video_data = $query->rows;

				$this->cache->set('video.' . (int)$this->config->get('config_language_id'), $video_data);
			}

			return $video_data;
		}
	}

	public function getVideoDescriptions($video_id) {
		$video_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");

		foreach ($query->rows as $result) {
			$video_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'url'            => $result['url'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $video_description_data;
	}

	public function getVideoStores($video_id) {
		$video_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_to_store WHERE video_id = '" . (int)$video_id . "'");

		foreach ($query->rows as $result) {
			$video_store_data[] = $result['store_id'];
		}

		return $video_store_data;
	}

	public function getVideoSeoUrls($video_id) {
		$video_seo_url_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "seo_url WHERE query = 'video_id=" . (int)$video_id . "'");

		foreach ($query->rows as $result) {
			$video_seo_url_data[$result['store_id']][$result['language_id']] = $result['keyword'];
		}

		return $video_seo_url_data;
	}

	public function getVideoLayouts($video_id) {
		$video_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_to_layout WHERE video_id = '" . (int)$video_id . "'");

		foreach ($query->rows as $result) {
			$video_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $video_layout_data;
	}

	public function getTotalVideos() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video");

		return $query->row['total'];
	}

	public function getTotalVideosByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}