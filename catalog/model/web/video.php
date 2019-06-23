<?php
class ModelWebVideo extends Model {

	public function getVideos($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "video i LEFT JOIN " . DB_PREFIX . "video_description id ON (i.video_id = id.video_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

            if (isset($data['is_home'])) {
                $sql .= " AND i.home = " . $data['is_home'];
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
			$video_data = $this->cache->get('video.' . (int)$this->config->get('config_language_id'));

			if (!$video_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video i LEFT JOIN " . DB_PREFIX . "video_description id ON (i.video_id = id.video_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$video_data = $query->rows;

				$this->cache->set('video.' . (int)$this->config->get('config_language_id'), $video_data);
			}

			return $video_data;
		}
	}
    
}