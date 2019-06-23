<?php
class ModelWebBlog extends Model {

	public function getBlogs($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
			$blog_data = $this->cache->get('blog.' . (int)$this->config->get('config_language_id'));

			if (!$blog_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$blog_data = $query->rows;

				$this->cache->set('blog.' . (int)$this->config->get('config_language_id'), $blog_data);
			}

			return $blog_data;
		}
	}
    
    
    public function getBlog($blog_id) {
		$blog_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog i LEFT JOIN " . DB_PREFIX . "blog_description id ON (i.blog_id = id.blog_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i.blog_id = '" . (int)$blog_id . "'");

		return $query->row;
	}
    
}